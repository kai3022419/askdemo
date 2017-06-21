package com.chinasofti.ask.answer.dao;

import java.util.List;

import com.chinasofti.ask.answer.domain.Answer;

public interface AnswerDao {
	/**
	 * 添加回答
	 * @Title: addAnswer 
	 * @Description: TODO
	 * @param answer
	 * @return: void
	 */
	void addAnswer(Answer answer);
	/**
	 * 根据qid查找回答
	 * @Title: findAll 
	 * @Description: TODO
	 * @param qid
	 * @return
	 * @return: List<Answer>
	 */
	List<Answer> findAll(String qid);

}
