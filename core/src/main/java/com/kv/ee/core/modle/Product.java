package com.kv.ee.core.modle;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Product implements Serializable {
    private int id;
    private String name;
    private String description;
    private double basePrice;
    private String image;
    private Date time;

    private ArrayList<Bid> bidHistory;

    public Product() {
    }

    public Product(int id, String name, String description, double basePrice, String image, Date time, ArrayList<Bid> bidHistory) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.basePrice = basePrice;
        this.image = image;
        this.time = time;
        this.bidHistory = bidHistory;
    }

    public ArrayList<Bid> getBidHistory() {
        return bidHistory;
    }

    public void setBidHistory(ArrayList<Bid> bidHistory) {
        this.bidHistory = bidHistory;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
