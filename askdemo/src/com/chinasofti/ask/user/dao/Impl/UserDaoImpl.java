package com.chinasofti.ask.user.dao.Impl;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.chinasofti.ask.user.dao.UserDao;
import com.chinasofti.ask.user.domain.PageBean;
import com.chinasofti.ask.user.domain.User;
import com.chinasofti.ask.util.JdbcUtil;



public class UserDaoImpl implements UserDao{
	QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
	/**
	 * 根据用户名查找用户
	 */
	public User findUserByUname(String uname) {
		String sql = "SELECT * FROM User WHERE uname=?";
		Object[] params = {uname};
		try {
			return qr.query(sql, params, new BeanHandler<User>(
					User.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 添加用户
	 */
	public void addUser(User user) {
		String sql = "INSERT INTO User VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//util.date 转化为sql.Date 存入数据库
		//Date sqlDate = new Date(user.getRegTime().getTime());
		Object[] params = {user.getUid(),user.getUname(),user.getPassword(),
				user.getEmail(),user.getQuizCount(),user.getAnswerCount(),
				user.getPassAnswerCount(),user.getRegTime().toLocaleString(),user.getPoint(),
				user.getAvatar(),user.getRole(),user.getState(),user.getToken()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 根据token获取user对象
	 */
	public User findUserByUid(String token) {
		String sql = "SELECT * FROM user WHERE token=?";
		Object[] params = {token};		
		try {
			return qr.query(sql, params, new BeanHandler<User>(User.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 删除用户
	 */
	public void deleteUser(String uid) {
		String sql = "DELETE FROM user WHERE uid=?";
		Object[] params = {uid};	
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 更新用户信息
	 */
	public void update(User user) {
		String sql = "UPDATE user SET uname=?,password=?,email=?,quizCount=?,"
				+ "answerCount=?,passAnswerCount=?,regTime=?,point=?,avatar=?,"
				+ "role=?,state=? WHERE uid=?";
		Object[] params = {user.getUname(),user.getPassword(),
				user.getEmail(),user.getQuizCount(),user.getAnswerCount(),
				user.getPassAnswerCount(),user.getRegTime().toLocaleString(),user.getPoint(),
				user.getAvatar(),user.getRole(),user.getState(),user.getUid()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查询注册用户数
	 */
	public int findRegisterUser() {
		String sql = "SELECT COUNT(uid) FROM user";
		try {
			Object obj = qr.query(sql, new ScalarHandler(1));
			return ((Long)obj).intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 上传头像
	 */
	public void avatarUpload(String avatar,String uid) {
		String sql = "UPDATE user SET avatar = ? WHERE uid =?";
		Object[] params = {avatar,uid};
		try {
			qr.update(sql,params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 后台查找全部用户
	 * @Title: findAll 
	 * @return: List<User>
	 */
	public PageBean<User> findAll(int pageSize, int pageCode) {
		PageBean<User> pb = new PageBean<User>();
		pb.setPageSize(pageSize);
		pb.setPageCode(pageCode);
		
		try {
			String sql = "SELECT COUNT(*) FROM user";
			Number totalRecord = (Number) qr.query(sql, new ScalarHandler());
			
			sql = "SELECT * FROM user LIMIT ?,?";
			Object[] params = {(pageCode-1)*pageSize,pageSize};
			List<User> beanList = qr.query(sql, params,
					new BeanListHandler<User>(User.class));
			pb.setBeanList(beanList);
			pb.setTotalRecord(totalRecord.intValue());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return pb;
	}
	@Override
	public void changePwd(String uname, String md5new) {
		
		String sql="UPDATE user SET password=? WHERE uname=?";
		
		Object[] params={md5new,uname};
		
		try {
			qr.update(sql,params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
