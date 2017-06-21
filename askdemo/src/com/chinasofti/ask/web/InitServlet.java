package com.chinasofti.ask.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class InitServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		String path = getServletContext().getContextPath();
		getServletContext().setAttribute("base", path);
	}

}
