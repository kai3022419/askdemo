package com.chinasofti.ask.user.domain;

import java.util.Date;

public class User {
	private String uid;//id
	private String uname;//用户名
	private String password;//密码
	private String email;//邮箱
	private int quizCount;//提问数量
	private int answerCount;//回答数量
	private int passAnswerCount;//采纳回答数量
	private Date regTime;//注册时间
	private int point;//积分
	private String avatar;//头像
	private String role;//权限     0:普通用户  1：管理员
	private String state;//状态码    0：未激活   1：激活
	private String token;//激活码
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getQuizCount() {
		return quizCount;
	}
	public void setQuizCount(int quizCount) {
		this.quizCount = quizCount;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getPassAnswerCount() {
		return passAnswerCount;
	}
	public void setPassAnswerCount(int passAnswerCount) {
		this.passAnswerCount = passAnswerCount;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Object getSessionId() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
