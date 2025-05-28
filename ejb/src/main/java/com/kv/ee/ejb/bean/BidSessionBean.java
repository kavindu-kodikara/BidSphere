package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.modle.User;
import com.kv.ee.core.remote.BidService;
import com.kv.ee.core.remote.DataStoreService;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateful;
import org.apache.activemq.ActiveMQConnectionFactory;

import javax.jms.*;
import java.util.Date;

@Stateful
public class BidSessionBean implements BidService {

    @EJB
    private DataStoreService dataStoreService;

    @Override
    public void sendBid(Integer uid,Integer pid, double price) {

        User user = dataStoreService.getUserMap().get(uid);
        Product product = dataStoreService.getProductMap().get(pid);

        Bid bid = new Bid();

        bid.setUser(user);
        bid.setPrice(price);
        bid.setTime(new Date());

        try {

            ActiveMQConnectionFactory factory = new ActiveMQConnectionFactory("tcp://localhost:61616");
            Connection connection = factory.createConnection();
            Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            Topic topic = session.createTopic("bid.topic"+pid);

            MessageProducer producer = session.createProducer(topic);
            ObjectMessage objectMessage = session.createObjectMessage(bid);

            producer.send(objectMessage);

            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
