package com.chinasofti.ask.user.web.servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONArray;

import com.chinasofti.ask.user.domain.User;
import com.chinasofti.ask.user.service.UserException;
import com.chinasofti.ask.user.service.UserService;
import com.chinasofti.ask.user.service.UserServiceImpl.UserserviceImpl;
import com.chinasofti.ask.util.BaseServlet;
import com.ndktools.javamd5.Mademd5;

@WebServlet("/UserServlet")
public class UserServlet extends BaseServlet{
	  UserService us = new UserserviceImpl();
	private UserService userService;
	  /**
	   * @Description: 注册
	   */
    public void register(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		  	String uname = request.getParameter("name");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			String email = request.getParameter("email");
			String md5password = new Mademd5().toMd5(password);//把注册的密码进行加密
			User user = new User();
			user.setUname(uname);
			user.setPassword(md5password);//把加密后的密码存入对象
			user.setEmail(email);
			user.setUid(UUID.randomUUID().toString().replace("-", ""));
			Date regTime = new Date();
			user.setRegTime(regTime);
			user.setAvatar(path+"/uploadFile/avatar/default.png");
			user.setRole("0");
			user.setState("0");
			user.setToken(user.getUid());
			try {
				us.addUser(user);
//				request.getSession().setAttribute("user", user);
//				response.sendRedirect(request.getContextPath()+"/login.jsp");
				response.getWriter().print("请点击邮箱激活");
			} catch (UserException e) {
				request.setAttribute("errorMsg", e.getMessage());
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			}
	  }
    	/**
	    * @Description: 登录
	    * 
	    */
    public void login(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
    		String autoLogin = request.getParameter("autoLogin");//获取是否自动登录的checkbox的值
		    String uname = request.getParameter("uname");
			String password = request.getParameter("password");
			String md5password = new Mademd5().toMd5(password);//把登录的密码进行md5加密
			String veriCode = request.getParameter("veriCode");
			String session_veriCode = (String)request.getSession().getAttribute("code");
			User user = new User();
			user.setUname(uname);
			user.setPassword(md5password);//把加密之后的密码存进对象
			try {
				User user1 = us.login(user,veriCode,session_veriCode);
				
				//如果该复选框没有被选中，则得到的值是null
				if(autoLogin!=null){//判断用户是否选择该复选框
					Cookie cookie1 = new Cookie("uname",URLEncoder.encode(uname,"UTF-8"));//保存用户名的cookie
					Cookie cookie2 = new Cookie("password",password);//保存密码的cookie
					cookie1.setMaxAge(1000*60*60*24*7);//设置cookie的存活时间
					cookie2.setMaxAge(1000*60*60*24*7);
					response.addCookie(cookie1); //cookie 是存在于浏览器内的
					response.addCookie(cookie2);
				}
//				//统计注册用户数量，显示在header.jsp上
//				int recount = us.findRegisterUser();
//				ServletContext app = this.getServletContext(); 
//				app.setAttribute("recount", recount);
				
				//service异常都通过  就执行重定向
				request.getSession().setAttribute("user", user1);//把用户存入session
				response.sendRedirect(path+"/index.jsp");
				
				
			} catch (UserException e) {
				request.setAttribute("errorMsg", e.getMessage());
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
	  } 
   	   /**
	    * @Description: 激活
	    * 
	    */
   public void activate(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		  	//获取token
			String token = request.getParameter("token");
			//调用userService处理邮件激活的业务逻辑
			try {
				us.activate(token);
				//激活成功，跳转到activate_suc.jsp
				response.sendRedirect(request.getContextPath()+"/activate_suc.jsp");
			} catch (UserException e) {
				//激活失败，显示错误信息
				request.setAttribute("errorMsg", e.getMessage());
				request.getRequestDispatcher("/register.jsp").forward(request, response);
			} 
	  }
   /*
    * 检查uname
    */
   public void checkUname(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	   String uname = request.getParameter("uname");
	   User user = us.checkUname(uname);
	   if(user!=null){
		   response.getWriter().print("用户名已存在");
	   }else{
		   response.getWriter().print("ok");
	   }
   }
   /*
    * 邮箱ajax 下拉提示
    */
   public void ajaxEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	   	String[] content = {"@qq.com","@163.com","@sina.com","@gmail.com","@yahoo.com","@msn.com","@googlemail.com"};
		String value = request.getParameter("value");
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < content.length; i++) {
			list.add(value+content[i]);
		}
		JSONArray json = JSONArray.fromObject(list);
		response.getWriter().print(json.toString());
   }
   /**
    * @Description: 激活
    * 
    */
   public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	   request.getSession().invalidate();//销毁session
	   request.getRequestDispatcher("/index.jsp").forward(request, response);
	   //转发时候路径相对于项目   重定向路径相对于服务器 （要写path）
   }  
   /**
    * 修改头像
    */
   public void avatarUpload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	   request.setCharacterEncoding("UTF-8");
	   User sessionUser = (User) request.getSession().getAttribute("user");
	   DiskFileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload sfu = new ServletFileUpload(factory);
	   try {
		List<FileItem> items = sfu.parseRequest(request);
		String image = null ;
		for (FileItem item : items) {
			String path = this.getServletContext().getRealPath(
					"/uploadFile/avatar");
			image = item.getName();
			item.write(new File(path +"/"+ image));
		}
		String avatar = path +"/uploadFile/avatar/"+ image;
		us.avatarUpload(avatar,sessionUser.getUid());
		response.sendRedirect("user/index.jsp");
	} catch (FileUploadException e) {
		e.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
   }
 //修改密码
 	public void changePwd(HttpServletRequest req, HttpServletResponse resp)
 			throws ServletException, IOException {
 		System.out.println("进入修改密码");
 		User user=(User) req.getSession().getAttribute("user");
 		String uname=user.getUname();
 		System.out.println(uname);
 		String oldpwd=req.getParameter("oldpwd");
 		String newpwd=req.getParameter("newpwd");
 		String md5old=new Mademd5().toMd5(oldpwd);
 		String md5new=new Mademd5().toMd5(newpwd);
 		
 		try {
 			userService.changePwd(uname,md5old,md5new);
 			req.getSession().invalidate();//销毁session
 			req.getRequestDispatcher("angepwd_suc.jsp").forward(req, resp);
 		} catch (UserException e) {
 			req.setAttribute("errorMsg",e.getMessage());
 			req.getRequestDispatcher("/userange_password.jsp").forward(req, resp);
 		}

 	}

}
