package com.chinasofti.ask.user.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.chinasofti.ask.user.domain.User;

@WebFilter(urlPatterns={"/login.jsp","/admin/*"
		+ ""})
public class UserFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		User sessionuser = (User)req.getSession().getAttribute("user");
		if(sessionuser==null || !sessionuser.getRole().equals("1")){
			req.setAttribute("errorMsg", "你没有管理员权限");
			req.getRequestDispatcher("/login.jsp").forward(request, response);
		}else{
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
}
