package com.kv.ee.core.remote;

import jakarta.ejb.Remote;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import jakarta.websocket.Session;

@Remote
public interface WatcherService {
    ConcurrentHashMap<Integer, Set<Session>> getWatchers();
}
