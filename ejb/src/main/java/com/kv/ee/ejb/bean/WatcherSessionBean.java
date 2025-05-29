package com.kv.ee.ejb.bean;

import com.kv.ee.core.remote.WatcherService;
import jakarta.annotation.PostConstruct;
import jakarta.ejb.Singleton;
import jakarta.ejb.Startup;
import jakarta.websocket.Session;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Singleton
@Startup
public class WatcherSessionBean implements WatcherService {

    private ConcurrentHashMap<Integer, Set<Session>> watchers;

    @PostConstruct
    public void init(){
        watchers = new ConcurrentHashMap<>();
    }

    @Override
    public ConcurrentHashMap<Integer, Set<Session>> getWatchers() {
        return watchers;
    }
}
