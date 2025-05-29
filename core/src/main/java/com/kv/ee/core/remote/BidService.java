package com.kv.ee.core.remote;

import jakarta.ejb.Remote;

@Remote
public interface BidService {
    boolean placeBid(Integer productId, Integer userId, double amount);
}
