package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.AutoBidConfig;
import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.ValidateService;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Stateless
public class ValidateSessionBean implements ValidateService {

    @EJB
    private DataStoreService dataStoreService;

    @Override
    public List<AutoBidConfig> sortBidConfigs(List<AutoBidConfig> autoBidders) {
        return autoBidders.stream()
                .sorted(Comparator
                        .comparing(AutoBidConfig::getRegisteredAt)
                        .thenComparing(AutoBidConfig::getUserId))
                .collect(Collectors.toList());
    }

    @Override
    public boolean validateBid(Bid bid) {

        Product product = dataStoreService.getProductMap().get(bid.getProductId());
        ArrayList<Bid> bidHistory = product.getBidHistory();

        if(product.getTime().before(bid.getTime())){
            System.out.println("product exp, product time : "+product.getTime().getTime() + " bid time : "+ bid.getTime().getTime());
            return false;
        } else if (!bidHistory.isEmpty() && bidHistory.get(bidHistory.size() - 1).getPrice() >= bid.getPrice() ) {
            System.out.println("amount < current bid");
            return false;
        } else if (product.getBasePrice() >= bid.getPrice()) {
            System.out.println("amount < base price");
            return false;
        }else{
            return true;
        }

    }


}
