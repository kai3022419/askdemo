package com.chinasofti.ask.category.service.Impl;

import java.util.List;

import com.chinasofti.ask.category.dao.CateDao;
import com.chinasofti.ask.category.dao.Impl.CateDaoImpl;
import com.chinasofti.ask.category.domain.CateGory;
import com.chinasofti.ask.category.service.CateService;

public class CateServiceImpl implements CateService{
	CateDao cateDao = new CateDaoImpl();
	/**
	 * 查询所有分类
	 */
	public List<CateGory> findAll() {
		return cateDao.findAll();
	}

}
