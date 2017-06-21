package com.chinasofti.ask.category.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasofti.ask.category.domain.CateGory;
import com.chinasofti.ask.category.service.CateService;
import com.chinasofti.ask.category.service.Impl.CateServiceImpl;
import com.chinasofti.ask.util.BaseServlet;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends BaseServlet{
	CateService cateService = new CateServiceImpl();
	/**
	 * 查询所有分类
	 */
	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<CateGory> categories = cateService.findAll();
		request.getSession().setAttribute("categories", categories);
		response.sendRedirect(path+"/index.jsp");
	}
}
