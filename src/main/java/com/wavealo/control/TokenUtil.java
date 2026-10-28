package com.wavealo.control;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.UUID;

public class TokenUtil {
    public static String getToken(HttpSession session){
        String token = (String) session.getAttribute("token");
        if(token == null){
            token = UUID.randomUUID().toString();
            session.setAttribute("token", token);
        }
        return token;
    }

    public static void rigeneraToken(HttpSession session){
        session.setAttribute("token", UUID.randomUUID().toString());
    }

    public static boolean isValid(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null) return false;
        String tokenSessione = (String) session.getAttribute("token");
        String tokenForm = request.getParameter("token");
        return tokenSessione != null && tokenSessione.equals(tokenForm);
    }
}
