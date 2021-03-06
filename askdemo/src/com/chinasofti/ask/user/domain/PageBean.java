package com.chinasofti.ask.user.domain;

import java.util.List;

public class PageBean<T> {
	private int pageSize;//每页的数量
	private int pageCode;//第几页
	private int totalRecord;//总记录数
	private List<T> beanList;//当前页面的具体数据
	
	//获得总页数
			public int getTotalPage(){
				int totalPage = totalRecord/pageSize;
				return totalRecord%pageSize==0?totalPage:totalPage+1;
			}
			
	public List<T> getBeanList() {
				return beanList;
			}

			public void setBeanList(List<T> beanList) {
				this.beanList = beanList;
			}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCode() {
		return pageCode;
	}
	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}
