package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.AutoBidConfig;
import com.kv.ee.core.modle.Bid;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.modle.User;
import com.kv.ee.core.remote.DataStoreService;
import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Singleton
@Startup
public class DataStoreSessionBean implements DataStoreService {

    private Map<Integer,User> userMap;
    private Map<Integer,Product> productMap;
    private ConcurrentHashMap<Integer, List<AutoBidConfig>> autoBidMap;

    @PostConstruct
    public void init() {
        userMap = new HashMap<>();
        productMap = new HashMap<>();
        autoBidMap = new ConcurrentHashMap<>();

        Date now = new Date();

        userMap.put(1,new User(1,"Kavindu","kv@gmail.com","123"));
        userMap.put(2,new User(2,"Kusal","kusal@gmail.com","123"));
        userMap.put(3,new User(3,"Pathum","pathum@gmail.com","123"));

        productMap.put(1,new Product(
                1,
                "Apple iPhone 13 Pro Max",
                "Brand new sealed iPhone 13 Pro Max 256GB Sierra Blue with warranty.",
                890.00,
                "https://i5.walmartimages.com/seo/Open-Box-Apple-iPhone-13-Pro-Max-AP-2484M-1024GB-Blue-US-Model-Factory-Unlocked-Cell-Phone_6ba1f90b-3b76-4e73-bb5c-8e353d988df0.de5842bcd17198be175ce2c6486b140c.jpeg",
                new Date(now.getTime() + 20 * 60 * 1000),
                new ArrayList<Bid>()
        ));

        productMap.put(2,new Product(
                2,
                "Rolex Submariner",
                "Vintage Rolex Submariner 16610 from 2003, excellent condition.",
                7500.00,
                "https://diamondseast.com/cdn/shop/files/IMG_6384.jpg?v=1724780733",
                new Date(now.getTime() + 45 * 60 * 1000),
                new ArrayList<Bid>()
        ));

        productMap.put(3,new Product(
                3,
                "Original Landscape Painting",
                "Beautiful oil painting by contemporary artist, 24x36 inches.",
                450.00,
                "https://georgemillerart.com/cdn/shop/products/il_fullxfull.2240815375_9pzt.jpg?v=1699571350&width=1946",
                new Date(now.getTime() + 30 * 60 * 1000),
                new ArrayList<Bid>()
        ));

        productMap.put(4,new Product(
                4,
                "Sony A7 IV Mirrorless Camera",
                "Like new condition with 3 lenses and accessories included.",
                2100.00,
                "https://www.dpreview.com/files/p/articles/7257804807/DSC09703.acr.jpeg",
                new Date(now.getTime() + 55 * 60 * 1000),
                new ArrayList<Bid>()
        ));

    }

    @Override
    public Map<Integer, User> getUserMap() {
        return userMap;
    }

    @Override
    public Map<Integer, Product> getProductMap() {
        return productMap;
    }

    @Override
    public Integer getUserId(String email, String password) {
        for (User user : userMap.values()) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user.getId();
            }
        }
        return 0;
    }

    @Override
    public void updateProductMap(Product product) {
        productMap.replace(product.getId(),product);
    }

    @Override
    public void registerAutoBid(AutoBidConfig config) {
        autoBidMap.computeIfAbsent(config.getProductId(), k -> new ArrayList<>()).add(config);
    }

    @Override
    public List<AutoBidConfig> getAutoBiddersForProduct(int productId) {
        return autoBidMap.getOrDefault(productId, new ArrayList<>());
    }

    @Override
    public void removeAutoBid(Integer pid, Integer uid) {
        List<AutoBidConfig> configs = autoBidMap.get(pid);

        if (configs != null) {
            synchronized (configs) {
                configs.removeIf(config -> config.getUserId().equals(uid));
            }
        }
    }
}
