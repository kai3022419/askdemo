package com.chinasofti.ask.question.service.Impl;

import java.util.List;

import com.chinasofti.ask.question.dao.QuestionDao;
import com.chinasofti.ask.question.dao.Impl.QuestionDaoImpl;
import com.chinasofti.ask.question.domain.Question;
import com.chinasofti.ask.question.service.QuestionService;

public class QuestionServiceImpl implements QuestionService{
	QuestionDao questionDao = new QuestionDaoImpl();

	/**
	 * 查询所有问题
	 */
	public List<Question> findAll(String cid) {
		return questionDao.findAll(cid);
	}
	/**
	 * 查找已、未解决的问题数量
	 * @Title: findCount 
	 * @return: int
	 */
	public int findQuesCount(int count) {
		return questionDao.findQuesCount(count);
	}
	/**
	 * 添加问题
	 */
	public void addques(Question formQues) {
		questionDao.addques(formQues);
		
	}
	/**
	 * 获取指定的question对象
	 */
	public Question findQuesByQid(String qid) {
		return questionDao.findQuesByQid(qid);
	}
	/**
	 * 更新指定question的状态
	 * @Title: update 
	 * @Description: TODO
	 * @param question
	 * @return: void
	 */
	public void update(Question question) {
		questionDao.update(question);
		
	}
	@Override
	public String getAvatar(String qid) {
		return questionDao.getAvatar(qid);
	}
	@Override
	public List<Question> finQuesByUid(String uid) {
		return questionDao.findQuesByUid(uid);
	}
	
}
