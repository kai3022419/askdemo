package com.chinasofti.ask.answer.service.Impl;

import java.util.List;

import com.chinasofti.ask.answer.dao.AnswerDao;
import com.chinasofti.ask.answer.dao.Impl.AnswerDaoImpl;
import com.chinasofti.ask.answer.domain.Answer;
import com.chinasofti.ask.answer.service.AnswerService;

public class AnswerServiceImpl implements AnswerService{
	AnswerDao answerDao = new AnswerDaoImpl();

	/**
	 * 添加回答
	 */
	public void addAnswer(Answer answer) {
		answerDao.addAnswer(answer);
		
	}

	/**
	 * 根据qid查找回答
	 */
	public List<Answer> findAll(String qid) {
		return answerDao.findAll(qid);
	}
}
