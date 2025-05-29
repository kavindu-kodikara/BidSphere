package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.ProductBidEndpoint;
import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.MessageDriven;
import jakarta.jms.*;
import jakarta.jms.MessageListener;

import java.io.IOException;

@MessageDriven(
        activationConfig = {
                @ActivationConfigProperty(propertyName = "destinationLookup", propertyValue = "jms/MyTopic"),
                @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "jakarta.jms.Topic"),
                @ActivationConfigProperty(propertyName = "subscriptionDurability", propertyValue = "Durable"),
                @ActivationConfigProperty(propertyName = "clientId", propertyValue = "myClientID1"),
                @ActivationConfigProperty(propertyName = "subscriptionName", propertyValue = "mySubscription")
        }
)

public class BidReceiverMDB implements MessageListener {


    @Override
    public void onMessage(Message message) {

        System.out.println("Received bid message");
        try {
            if (message instanceof ObjectMessage) {
                ObjectMessage objMsg = (ObjectMessage) message;
                Bid bid = (Bid) objMsg.getObject();

                ProductBidEndpoint.broadcastBid(bid);

                System.out.println("Received bid object: " + bid.getPrice());
            } else {
                System.out.println("Received message of unsupported type: " + message.getClass());
            }
        } catch (JMSException e) {
            e.printStackTrace();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


}
