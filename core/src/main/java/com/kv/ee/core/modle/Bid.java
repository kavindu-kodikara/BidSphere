package com.kv.ee.core.modle;

import java.io.Serializable;
import java.util.Date;

public class Bid implements Serializable {

    private double price;
    private Date time;
    private User user;
    private Integer productId;

    public Bid() {
    }

    public Bid(double price, Date time, User user, Integer productId) {
        this.price = price;
        this.time = time;
        this.user = user;
        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
