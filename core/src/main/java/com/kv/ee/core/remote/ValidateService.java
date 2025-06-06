package com.kv.ee.core.remote;

import com.kv.ee.core.modle.AutoBidConfig;
import com.kv.ee.core.modle.Bid;
import jakarta.ejb.Remote;

import java.util.List;

@Remote
public interface ValidateService {
    public List<AutoBidConfig> sortBidConfigs(List<AutoBidConfig> autoBidders);
    public boolean validateBid(Bid bid);
}
