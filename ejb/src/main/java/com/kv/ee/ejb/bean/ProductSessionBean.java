package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.ProductService;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;

@Stateless
public class ProductSessionBean implements ProductService {

    @EJB
    private DataStoreService dataStoreService;

    @Override
    public Product getProduct(int productId) {

        Product product = dataStoreService.getProductMap().get(productId);

        return product;
    }
}
