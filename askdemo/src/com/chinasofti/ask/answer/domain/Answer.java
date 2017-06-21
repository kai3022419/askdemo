package com.chinasofti.ask.answer.domain;

import java.util.Date;

/**
 * 回答类
 * @ClassName: Answer 
 * @Description: TODO
 * @author: 夏浩钦
 * @date: 2017年5月13日 上午11:10:28
 */
public class Answer {
	private String aid;
	private String content;
	private String uid;
	private Date answerTime;
	private String qid;
	private String state;
	private String avatar;
	private String uname;
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Date getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
