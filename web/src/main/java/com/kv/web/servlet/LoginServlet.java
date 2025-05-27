package com.kv.web.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kv.ee.core.modle.User;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.UserService;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @EJB
    private UserService userService ;

    @EJB
    private DataStoreService dataStoreService ;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Gson gson = new Gson();
        resp.setContentType("application/json");

        boolean isSuccess = false;

        JsonObject reqObj = gson.fromJson(req.getReader(), JsonObject.class);

        String email = reqObj.get("email").getAsString();
        String password = reqObj.get("password").getAsString();

        if(userService.login(email, password)) {
            Integer id = dataStoreService.getUserId(email, password);
            req.getSession().setAttribute("userId", id);
            isSuccess = true;
        }

        resp.getWriter().write(gson.toJson(isSuccess));


    }
}
