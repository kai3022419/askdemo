package com.chinasofti.ask.util;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.chinasofti.ask.question.service.QuestionService;
import com.chinasofti.ask.question.service.Impl.QuestionServiceImpl;
import com.chinasofti.ask.user.service.UserService;
import com.chinasofti.ask.user.service.UserServiceImpl.UserserviceImpl;

@WebListener
public class Listener implements HttpSessionListener{
	static int count = 0;
	UserService userService = new UserserviceImpl();
	QuestionService questionService = new QuestionServiceImpl();
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		//统计在线用户数
		se.getSession().getServletContext().setAttribute("count",++count);
		//统计注册用户数
		int registercount = userService.findRegisterUser();
		se.getSession().getServletContext().setAttribute("recount",registercount);
		//统计已解决问题数
		int endcount = questionService.findQuesCount(1);
		se.getSession().getServletContext().setAttribute("endcount",endcount);
		//统计未解决问题数
		int notcount = questionService.findQuesCount(0);
		se.getSession().getServletContext().setAttribute("notcount",notcount);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		se.getSession().getServletContext().setAttribute("count",--count);
	}
}
