package com.kv.ee.core.remote;

import jakarta.ejb.Remote;

@Remote
public interface UserService {
    boolean login(String email, String password);
}
