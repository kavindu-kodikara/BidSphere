package com.kv.ee.core.remote;

import com.kv.ee.core.modle.AutoBidConfig;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.modle.User;
import jakarta.ejb.Remote;

import java.util.List;
import java.util.Map;

@Remote
public interface DataStoreService {
    Map<Integer, User> getUserMap();
    Map<Integer, Product> getProductMap();
    Integer getUserId(String email,String password);
    void updateProductMap(Product product);
     void registerAutoBid(AutoBidConfig config);
     List<AutoBidConfig> getAutoBiddersForProduct(int productId);
}
