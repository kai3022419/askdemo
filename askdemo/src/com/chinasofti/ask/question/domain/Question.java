package com.chinasofti.ask.question.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.chinasofti.ask.answer.domain.Answer;
import com.chinasofti.ask.user.domain.User;
/**
 * 问题类
 * @ClassName: Question 
 * @Description: TODO
 * @author: 夏浩钦
 * @date: 2017年5月11日 下午2:46:53
 */
public class Question {
	private String qid;//id
	private String title;//问题标题
	private String content;//问题内容
	private String cid;//关联的类别id
	private String uid;//关联的用户id
	private Date quizTime;//提问的时间
	private Date endTime;//问题结束的时间
	private int state;//问题状态 0待解决  1已解决  2超时
	private int answerCount;//回答数量
	private int belookCount;//浏览数量
	private String username;//关联的用户名称
	private String cateName;//关联的问题类别名称
	private String image;//问题图片路径
	private User answerUser;//回答该问题的用户
	private String avatar;
	
	//计算剩余时间	
	public String getRemainingTime(){
		long times = endTime.getTime()-new Date().getTime();
		long day = times/(1000*60*60*24);
		long hour = (times%(1000*60*60*24))/(60*60*1000);
		long minute = (times%(1000*60*60))/(60*1000);
		if(times<=0){
			this.state = 2;
			return "问题已过期";
		}
		return "离问题结束还有:"+day+"天"+hour+"小时"+minute+"分";
	} 
	
	public User getAnswerUser() {
		return answerUser;
	}

	public void setAnswerUser(User answerUser) {
		this.answerUser = answerUser;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getQuizTime() {
		return quizTime;
	}
	public void setQuizTime(Date quizTime) {
		this.quizTime = quizTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getBelookCount() {
		return belookCount;
	}
	public void setBelookCount(int belookCount) {
		this.belookCount = belookCount;
	}
	
	
}
