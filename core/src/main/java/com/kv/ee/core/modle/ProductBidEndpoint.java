package com.kv.ee.core.modle;

import com.google.gson.Gson;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import org.ietf.jgss.GSSContext;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint("/bids/{productId}")
public class ProductBidEndpoint {

    
    // Map productId -> Set of Sessions watching that product
    private static final ConcurrentHashMap<Integer, Set<Session>> watchers = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("productId") Integer productId) {
        watchers.computeIfAbsent(productId, k -> ConcurrentHashMap.newKeySet()).add(session);
        System.out.println("New connection for product " + productId + ". Total watchers: " + watchers.get(productId).size());
    }

    @OnClose
    public void onClose(Session session, @PathParam("productId") Integer productId) {
        Set<Session> sessions = watchers.get(productId);
        if (sessions != null) {
            sessions.remove(session);
            if (sessions.isEmpty()) {
                watchers.remove(productId);
            }
            System.out.println("Connection closed for product " + productId + ". Remaining watchers: " + (sessions != null ? sessions.size() : 0));
        }
    }

    @OnMessage
    public void onMessage(String message, @PathParam("productId") Integer productId, Session session) throws IOException {


    }

    public static void broadcastBid(Bid bid) throws IOException {
        Set<Session> sessions = watchers.get(bid.getProductId());
        if (sessions != null) {
            String bidMessage = new Gson().toJson(bid);
            for (Session s : sessions) {
                if (s.isOpen()) {
                    s.getBasicRemote().sendText(bidMessage);
                }
            }
        }
    }
    
}
