package com.chinasofti.ask.util;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BaseServlet extends HttpServlet{
	public String path= null;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		path = request.getContextPath();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String opr = request.getParameter("opr");
		Method method;
		try {
			//根据方法名，参数类型，得到方法对象
			method = this.getClass().getMethod(opr, HttpServletRequest.class,HttpServletResponse.class);
			//执行该方法
			method.invoke(this, request,response);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
