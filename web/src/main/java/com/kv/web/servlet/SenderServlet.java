package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.modle.Product;
import com.kv.ee.core.remote.BidService;
import com.kv.ee.core.remote.DataStoreService;
import jakarta.annotation.Resource;
import jakarta.ejb.EJB;
import jakarta.jms.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/send")
public class SenderServlet extends HttpServlet {

    @EJB
    BidService bidService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject response = new JsonObject();
        boolean isSuccess = false;
        String msg = null;

        JsonObject reqObject = gson.fromJson(req.getReader(), JsonObject.class);

        Integer uid = (Integer) req.getSession().getAttribute("userId");

        if(uid == null) {
            msg = "Please Login First";
        } else{

            isSuccess = bidService.placeBid(reqObject.get("pid").getAsInt(),uid,reqObject.get("amount").getAsDouble());

        }

        response.addProperty("msg", msg);
        response.addProperty("isSuccess", isSuccess);

        resp.setContentType("application/json");
        resp.getWriter().write(gson.toJson(response));


    }
}

