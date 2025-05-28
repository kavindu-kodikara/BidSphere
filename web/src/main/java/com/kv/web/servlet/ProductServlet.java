package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.ProductService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/loadProduct")
public class ProductServlet extends HttpServlet {

    @EJB
    ProductService productService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        resp.setContentType("application/json");
        JsonObject respObj = new JsonObject();
        boolean isSuccess = false;

        JsonObject reqObj = gson.fromJson(req.getReader(), JsonObject.class);
        int id = reqObj.get("id").getAsInt();

        Product product = productService.getProduct(id);

        isSuccess = true;

        respObj.add("product",gson.toJsonTree(product));
        respObj.addProperty("isSuccess",isSuccess);

        resp.getWriter().write(gson.toJson(respObj));

    }
}
