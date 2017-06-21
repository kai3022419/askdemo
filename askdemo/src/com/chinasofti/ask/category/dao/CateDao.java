package com.chinasofti.ask.category.dao;

import java.util.List;

import com.chinasofti.ask.category.domain.CateGory;

public interface CateDao {
	/**
	 * 查询所有方法
	 * @Title: findAll 
	 * @Description: TODO
	 * @return
	 * @return: List<CateGory>
	 */
	List<CateGory> findAll();

}
