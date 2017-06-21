package com.chinasofti.ask.user.service;

import java.util.List;

import com.chinasofti.ask.user.domain.PageBean;
import com.chinasofti.ask.user.domain.User;


public interface UserService {
	/**
	 * 注册功能
	 * @param user
	 * @throws UserException
	 */
	void addUser(User user) throws UserException;
	/**
	 * 登录功能
	 * @param user
	 * @throws UserException
	 */
	User login(User user,String veriCode,String session_veriCode) throws UserException;
	/**
	 * 处理邮件激活
	 * @param user
	 * @throws UserException
	 */
	void activate(String token)  throws UserException;
	/**
	 * 检查用户名是否存在
	 * @Title: checkUname 
	 * @param uname
	 * @return: User
	 */
	User checkUname(String uname);
	/**
	 * 查找数据库中注册用户数
	 * @Title: findRegisterUser 
	 * @Description: TODO
	 * @return
	 * @return: int
	 */
	int findRegisterUser();
	/**
	 * 上传头像
	 * @Title: avatarUpload 
	 * @param avatar
	 * @param string 
	 * @return: void
	 */
	void avatarUpload(String avatar, String string);
	/**
	 * 查找全部用户
	 * @Title: findAll 
	 * @return: List<User>
	 */
	PageBean<User> findAll(int pageSize,int pageCode);
	void changePwd(String uname, String md5old, String md5new)
			throws UserException;
}
