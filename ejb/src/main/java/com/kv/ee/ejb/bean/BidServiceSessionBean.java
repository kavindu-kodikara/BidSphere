package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.BidService;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.ValidateService;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSContext;
import jakarta.jms.JMSProducer;
import jakarta.jms.Topic;

import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;

@Stateless
public class BidServiceSessionBean implements BidService {

    @EJB
    private DataStoreService dataStoreService;

    @EJB
    private ValidateService validateService;

    @Resource(lookup = "jms/__defaultConnectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(lookup = "jms/MyTopic")
    private Topic topic;

    @Override
    public boolean placeBid(Integer productId, Integer userId, double bidAmount) {
        boolean success = false;
        try (JMSContext context = connectionFactory.createContext()) {

            Bid bid = new Bid();
            bid.setProductId(productId);
            bid.setTime(new Date());
            bid.setPrice(bidAmount);
            bid.setUser(dataStoreService.getUserMap().get(userId));

            if(validateService.validateBid(bid)){
                JMSProducer producer = context.createProducer();
                producer.send(topic, bid);

                Product product = dataStoreService.getProductMap().get(productId);
                ArrayList<Bid> bidHistoryList = product.getBidHistory();

                bidHistoryList.add(bid);
                product.setBidHistory(bidHistoryList);

                dataStoreService.updateProductMap(product);

                System.out.println("Sent bid " + String.valueOf(bidAmount));
                success = true;

            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }



}
