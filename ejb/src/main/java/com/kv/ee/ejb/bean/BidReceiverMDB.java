package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.AutoBidConfig;
import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.ProductBidEndpoint;
import com.kv.ee.core.modle.Validate;
import com.kv.ee.core.remote.BidService;
import com.kv.ee.core.remote.DataStoreService;
import jakarta.ejb.ActivationConfigProperty;
import jakarta.ejb.EJB;
import jakarta.ejb.MessageDriven;
import jakarta.jms.*;
import jakarta.jms.MessageListener;

import java.io.IOException;
import java.util.List;

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

    @EJB
    DataStoreService dataStoreService;

    @EJB
    BidService bidService;

    @Override
    public void onMessage(Message message) {

        System.out.println("Received bid message");
        try {
            if (message instanceof ObjectMessage) {
                ObjectMessage objMsg = (ObjectMessage) message;
                Bid bid = (Bid) objMsg.getObject();

                ProductBidEndpoint.broadcastBid(bid);
                System.out.println("Received bid object: " + bid.getPrice());

                // Evaluate auto-bid for this product
                List<AutoBidConfig> autoBidders = dataStoreService.getAutoBiddersForProduct(bid.getProductId());

                for (AutoBidConfig config : Validate.sortBidConfigs(autoBidders)) {

                    if (bid.getUser().getId() == config.getUserId()) continue; // skip self

                    System.out.println("bidder : "+bid.getUser().getId()+" , user : "+config.getUserId());

                    double nextBid = bid.getPrice() + 10;

                    if (nextBid <= config.getMaxBid()) {
                        bidService.placeBid(bid.getProductId(), config.getUserId(), nextBid);
                        break; // only allow one auto-bid at a time (chain reaction via JMS)
                    }
                }

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
