package com.chinasofti.ask.user.web.servlet;


import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URLEncoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasofti.ask.util.VeriUtil;



@WebServlet(urlPatterns="/VeriServlet")
public class VeriServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		VeriUtil vu = new VeriUtil();
		BufferedImage image = vu.getImage();
		ImageIO.write(image, "JPG", resp.getOutputStream());
		String code = vu.getVeriCode();
		req.getSession().setAttribute("code", code);
	}
}
