package com.chinasofti.ask.user.dao;

import java.util.List;

import com.chinasofti.ask.user.domain.PageBean;
import com.chinasofti.ask.user.domain.User;

public interface UserDao {
	/**
	 * 通过uname查找User
	 * @param user
	 * @return
	 */
	User findUserByUname(String uname);
	/**
	 * 向数据库写入user信息
	 * @param user
	 */
	void addUser(User form);
	/**
	 * 通过token查找user
	 * @param user
	 */
	User findUserByUid(String token);
	/**
	 * 删除用户
	 * @param user
	 */
	void deleteUser(String uid);
	/**
	 * 更新用户信息
	 * @param user
	 */
	void update(User user);
	/**
	 * 查询注册用户数
	 * @param user
	 */
	int findRegisterUser();
	/**
	 * 上传头像
	 * @Title: avatarUpload 
	 * @param avatar
	 * @param uid 
	 * @return: void
	 */
	void avatarUpload(String avatar, String uid);
	/**
	 * 查询全部用户
	 * @Title: finduser 
	 * @return: List<User>
	 */
	PageBean<User> findAll(int pageSize, int pageCode);
	void changePwd(String uname, String md5new);
}
