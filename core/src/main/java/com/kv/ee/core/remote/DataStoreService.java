package com.kv.ee.core.remote;

import com.kv.ee.core.modle.Product;
import com.kv.ee.core.modle.User;
import jakarta.ejb.Remote;

import java.util.Map;

@Remote
public interface DataStoreService {
    Map<Integer, User> getUserMap();
    Map<Integer, Product> getProductMap();
    Integer getUserId(String email,String password);
}
