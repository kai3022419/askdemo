package com.chinasofti.ask.category.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.chinasofti.ask.category.dao.CateDao;
import com.chinasofti.ask.category.domain.CateGory;
import com.chinasofti.ask.question.domain.Question;
import com.chinasofti.ask.util.JdbcUtil;

public class CateDaoImpl implements CateDao{
	QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());
	/**
	 * 查询所有分类
	 */
	public List<CateGory> findAll() {
		String sql = "SELECT * FROM category";
		try {
			return qr.query(sql, new BeanListHandler<CateGory>(CateGory.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
