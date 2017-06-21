package com.chinasofti.ask.question.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


/**
 * 如果没有登录则禁止访问question_add.jsp
 * @ClassName: QuesAddFilter 
 * @Description: TODO
 * @author: 夏浩钦
 * @date: 2017年5月12日 上午10:47:30
 */
@WebFilter("/question_add.jsp")
public class QuesAddFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if(req.getSession().getAttribute("user")==null){
			req.setAttribute("errorMsg", "提问之前请先登录");
			req.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
