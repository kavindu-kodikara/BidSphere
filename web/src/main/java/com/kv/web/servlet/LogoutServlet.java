package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.UserService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        resp.setContentType("application/json");

        boolean isSuccess = false;

        req.getSession().invalidate();

        isSuccess = true;

        resp.getWriter().write(gson.toJson(isSuccess));


    }
}
