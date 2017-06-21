package com.chinasofti.ask.question.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.chinasofti.ask.question.dao.QuestionDao;
import com.chinasofti.ask.question.domain.Question;
import com.chinasofti.ask.util.JdbcUtil;

public class QuestionDaoImpl implements QuestionDao{
	QueryRunner qr = new QueryRunner(JdbcUtil.getDataSource());

	/**
	 * 查询所有问题
	 */
	public List<Question> findAll(String cid) {
		String sql = "SELECT * FROM question WHERE cid in(SELECT cid FROM category WHERE p_cid=? ) or cid=?"
				+ "order by quizTime LIMIT 10";
		Object[] params = {cid,cid};
		try {
			return qr.query(sql,params, new BeanListHandler<Question>(Question.class));
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/**
	 * 查找已解决、未解决的问题数量
	 * @Title: findEndCount 
	 * @return: int
	 */
	public int findQuesCount(int count) {
		String sql = "SELECT COUNT(qid) FROM question WHERE state=?";
		Object[] param = {count};
		try {
			Object obj = qr.query(sql,param, new ScalarHandler(1));
			return ((Long)obj).intValue();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/**
	 * 添加问题
	 */
	public void addques(Question q) {
		String sql = "INSERT INTO question VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = {q.getQid(),q.getTitle(),q.getContent(),q.getCid(),
				q.getUid(),q.getQuizTime().toLocaleString(),q.getEndTime().toLocaleString(),
				q.getState(),q.getAnswerCount(),q.getBelookCount(),q.getUsername(),
				q.getCateName(),q.getImage()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	/**
	 * 获取指定的question对象
	 */
	public Question findQuesByQid(String qid) {
		String sql = "SELECT * FROM question WHERE qid=?";
		Object[] params = {qid};
		try {
			return qr.query(sql, params, new BeanHandler<Question>(Question.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 更新指定question的状态
	 * @Title: update 
	 * @Description: TODO
	 * @param question
	 * @return: void
	 */
	public void update(Question q) {
		String sql = "UPDATE question SET title=?,content=?,cid=?,uid=?,quizTime=?,endTime=?,"
				+ "state=?,answerCount=?,belookCount=?,username=?,cateName=?,image=? WHERE qid=?";
		Object[] params = {q.getTitle(),q.getContent(),q.getCid(),
				q.getUid(),q.getQuizTime().toLocaleString(),q.getEndTime().toLocaleString(),
				q.getState(),q.getAnswerCount(),q.getBelookCount(),q.getUsername(),
				q.getCateName(),q.getImage(),q.getQid()};
		try {
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@Override
	public String getAvatar(String qid) {
		String  sql = "SELECT u.avatar FROM user u,question q WHERE q.uid=u.uid AND q.qid=?";
		Object[] params = {qid};
		String avatar;
		try {
			 avatar = (String)qr.query(sql, params, new ScalarHandler());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return avatar;
	}
	@Override
	public List<Question> findQuesByUid(String uid) {
		String sql = "SELECT * FROM question WHERE uid = ?";
		Object[] params = {uid};
		try {
			return qr.query(sql, params, new BeanListHandler<Question>(Question.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
