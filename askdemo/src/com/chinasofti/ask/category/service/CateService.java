package com.chinasofti.ask.category.service;

import java.util.List;

import com.chinasofti.ask.category.domain.CateGory;

public interface CateService{
	/**
	 * 查询所有分类
	 */
	public List<CateGory> findAll();
}
