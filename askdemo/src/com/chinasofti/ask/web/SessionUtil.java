package com.chinasofti.ask.web;

import java.util.ArrayList;

import com.chinasofti.ask.user.domain.User;

public class SessionUtil { 
    public static Object getUserBySessionId(ArrayList <User> userList,String sessionId){ 
        for(User user:userList){ 
            if(user.getSessionId().equals(sessionId)){ 
                return user; 
            } 
        } 
        return null; 
    }
	public static boolean getUserBySessionId(ArrayList<User> userList, boolean b) {
		// TODO Auto-generated method stub
		return false;
	} 
}
