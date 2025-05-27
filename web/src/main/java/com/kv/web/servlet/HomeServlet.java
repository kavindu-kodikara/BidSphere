package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.DataStoreService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/loadHome")
public class HomeServlet extends HttpServlet {

    @EJB
    DataStoreService dataStoreService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        resp.setContentType("application/json");
        JsonObject respObj = new JsonObject();

        boolean isSuccess = false;
        List<Product> productList = new ArrayList<>();

        productList.addAll(dataStoreService.getProductMap().values());
        isSuccess = true;

        respObj.addProperty("isSuccess", isSuccess);
        respObj.add("products", gson.toJsonTree(productList));

        resp.getWriter().write(gson.toJson(respObj));

    }
}
