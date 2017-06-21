package com.chinasofti.ask.user.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasofti.ask.user.domain.PageBean;
import com.chinasofti.ask.user.domain.User;
import com.chinasofti.ask.user.service.UserService;
import com.chinasofti.ask.user.service.UserServiceImpl.UserserviceImpl;
import com.chinasofti.ask.util.BaseServlet;


@WebServlet("/AdminServlet")
public class AdminServlet extends BaseServlet{
	 UserService userService = new UserserviceImpl();
	
	public void findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int pageSize = 3;//定义每页的记录数
		int pageCode = getPageCode(req);//获取当前页码
		PageBean<User> pb = userService.findAll
				(pageSize,pageCode);
		
		req.setAttribute("pb", pb);
		req.getRequestDispatcher("/admin/user_list.jsp").forward(req, resp);
	}

	private int getPageCode(HttpServletRequest req) {
		String pageCode = req.getParameter("pageCode");
		if(pageCode==null||pageCode.trim().isEmpty()){
			return 1;
		}
		return Integer.parseInt(pageCode);
	}
}
