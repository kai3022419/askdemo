package com.chinasofti.ask.web;

import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.chinasofti.ask.user.domain.User;
@WebListener
public class MyListener implements HttpSessionListener {
	private int userNumber=0;//统计在线人数
	@Override
	public void sessionCreated(HttpSessionEvent a) {
		userNumber++;
		a.getSession().getServletContext().setAttribute("userNumber", userNumber);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent a) {
		userNumber--;
		a.getSession().getServletContext().setAttribute("userNumber", userNumber);
		ArrayList<User> userList=null;
		userList=(ArrayList<User>) a.getSession().getServletContext().getAttribute("userList");
		if(SessionUtil.getUserBySessionId(userList,a.getSession().getId()!=null)){
			userList.remove(SessionUtil.getUserBySessionId(userList,a.getSession().getId()));
		}	
	}
}
