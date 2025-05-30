package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.modle.AutoBidConfig;
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
import java.util.Date;
import java.util.List;

@WebServlet("/autoBid")
public class AutoBidServlet extends HttpServlet {

    @EJB
    private DataStoreService dataStoreService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        resp.setContentType("application/json");
        JsonObject respObj = new JsonObject();
        boolean isSuccess = false;
        String msg = null;

        JsonObject reqObj = gson.fromJson(req.getReader(), JsonObject.class);

        Integer pid = reqObj.get("pid").getAsInt();
        double amount = reqObj.get("amount").getAsDouble();

        Integer uid = (Integer) req.getSession().getAttribute("userId");

        if(uid == null) {
            msg = "Please Login First";
        } else{

            AutoBidConfig autoBidConfig = new AutoBidConfig();
            autoBidConfig.setMaxBid(amount);
            autoBidConfig.setProductId(pid);
            autoBidConfig.setUserId(uid);
            autoBidConfig.setRegisteredAt(new Date());

            dataStoreService.registerAutoBid(autoBidConfig);

            ArrayList<AutoBidConfig> arrayList = (ArrayList<AutoBidConfig>) dataStoreService.getAutoBiddersForProduct(pid);

            for (AutoBidConfig autoBidConfig1 : arrayList) {
                System.out.println(autoBidConfig1.getUserId()+" : "+autoBidConfig1.getMaxBid());
            }

            isSuccess = true;

        }



        respObj.addProperty("isSuccess", isSuccess);
        respObj.addProperty("msg", msg);

        resp.getWriter().write(gson.toJson(respObj));

    }
}
