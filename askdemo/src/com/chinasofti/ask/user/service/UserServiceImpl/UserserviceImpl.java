package com.chinasofti.ask.user.service.UserServiceImpl;


import java.util.Date;
import java.util.List;

import com.chinasofti.ask.user.dao.UserDao;
import com.chinasofti.ask.user.dao.Impl.UserDaoImpl;
import com.chinasofti.ask.user.domain.PageBean;
import com.chinasofti.ask.user.domain.User;
import com.chinasofti.ask.user.service.UserException;
import com.chinasofti.ask.user.service.UserService;
import com.chinasofti.ask.util.MailUtils;


public class UserserviceImpl implements UserService{
	UserDao ud = new UserDaoImpl();
	private UserDao userDao;
	//新增用户
	public void addUser(User user) throws UserException {
		String uname = user.getUname();
		User user1 = new User();
		user1 = ud.findUserByUname(uname);
		if(user1!=null){
			throw new UserException("用户名已存在！");
		}
		//向数据库增加 user所有信息  状态码为0
		ud.addUser(user);
		//发送邮件
		MailUtils.sendMail(user.getEmail(), user.getToken());
	}
	/**
	 * 登录
	 */
	public User login(User user, String veriCode, String session_veriCode) throws UserException{
		String uname = user.getUname();
		String password = user.getPassword();
		User user2 = ud.findUserByUname(uname);
		if(user2 == null){
			throw new UserException("用户名不存在");
		}
		if(!password.equals(user2.getPassword())){
			throw new UserException("密码错误,请重新输入");
		}
		if(!veriCode.equals(session_veriCode)){
			throw new UserException("验证码输入错误,请重新输入");
		}
		if(!user2.getState().equals("1")){
			throw new UserException("该用户未激活");
		}
		return user2;
	}
	/**
	 * 根据token找到user，然后判断激活时间是否超时
	 * 如果没有超时，则把该user的state改为1
	 * 如果超时，删除该用户
	 * @throws UserException 
	 */
	public void activate(String token) throws UserException {
		//调用数据层的findUserByUid方法获取对应的user对象
		User user = ud.findUserByUid(token);
		long time = new Date().getTime()-user.getRegTime().getTime();
		if(time/1000/60>10){
			ud.deleteUser(user.getUid());
			throw new UserException("激活码已过期");
		}
		//把user对象的状态改为1
		user.setState("1");
		//更新user信息
		ud.update(user);
	}
	/**
	 * 根据用户名查找用户
	 */
	public User checkUname(String uname) {
		User user = ud.findUserByUname(uname);
		return user;
	}
	/**
	 * 查找数据库中注册用户数
	 */
	public int findRegisterUser() {
		return ud.findRegisterUser();
	}
	
	/**
	 * 上传头像
	 */
	public void avatarUpload(String avatar, String uid) {
		ud.avatarUpload(avatar,uid);
		
	}
	
	/**
	 * 查找全部用户
	 */
	public PageBean<User> findAll(int pageSize, int pageCode) {
		return ud.findAll(pageSize,pageCode);
	}
	
	@Override
	public void changePwd(String uname, String md5old, String md5new) throws UserException {
		
		User user=userDao.findUserByUname(uname);
		if (!user.getPassword().equals(md5old)) {
			throw new UserException("输入的旧密码有误");
		}
		userDao.changePwd(uname,md5new);
	}

}
