package com.chinasofti.ask.category.domain;

/**
 * 问题分类类
 */
public class CateGory {
	private String cid;//id
	private String cname;//分类名称
	private String p_cid;//父类别的id
	private int quesCount;//当前类别的问题的数量
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getP_cid() {
		return p_cid;
	}
	public void setP_cid(String p_cid) {
		this.p_cid = p_cid;
	}
	public int getQuesCount() {
		return quesCount;
	}
	public void setQuesCount(int quesCount) {
		this.quesCount = quesCount;
	}
	
	
}
