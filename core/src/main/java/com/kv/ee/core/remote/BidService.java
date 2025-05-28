package com.kv.ee.core.remote;

import jakarta.ejb.Remote;

@Remote
public interface BidService {
    void sendBid(Integer uid,Integer pid,double price);
}
