package com.chinasofti.ask.answer.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.chinasofti.ask.answer.dao.AnswerDao;
import com.chinasofti.ask.answer.domain.Answer;
import com.chinasofti.ask.util.JdbcUtil;

public class AnswerDaoImpl implements AnswerDao{
	QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());

	/**
	 * 添加回答
	 */
	public void addAnswer(Answer a) {
		String sql = "INSERT answer VALUES(?,?,?,?,?,?,?,?)";
		Object[] params = {a.getAid(),a.getContent(),a.getUid(),
				a.getAnswerTime().toLocaleString(),a.getQid(),a.getState()
				,a.getAvatar(),a.getUname()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 根据qid查找回答
	 */
	public List<Answer> findAll(String qid) {
		String sql = "SELECT * FROM answer WHERE qid=?";
		Object[] param = {qid};
		try {
			return qr.query(sql, param, new BeanListHandler<Answer>(Answer.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
