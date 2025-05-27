package com.kv.ee.ejb.bean;

import com.kv.ee.core.modle.User;
import com.kv.ee.core.remote.DataStoreService;
import com.kv.ee.core.remote.UserService;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;

import java.util.Map;

@Stateless
public class UserSessionBean implements UserService {

    @EJB
    private DataStoreService dataStoreService;

    @Override
    public boolean login(String email, String password) {

        boolean result = false;
        Map<Integer, User> userMap = dataStoreService.getUserMap();

        for (User user : userMap.values()) {
            if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
                result = true;
                break;
            }
        }

        return result;
    }
}
