package com.chinasofti.ask.question.service;

import java.util.List;

import com.chinasofti.ask.question.domain.Question;

public interface QuestionService {
	/**
	 * 获取所有问题
	 * @Title: findAll 
	 * @Description: TODO
	 * @return
	 * @return: List<Question>
	 */
	List<Question> findAll(String cid);
	/**
	 * 查找已、未解决的问题数量
	 * @Title: findCount 
	 * @return: int
	 */
	int findQuesCount(int count);
	/**
	 * 添加问题
	 * @Title: add 
	 * @param formQues
	 * @return: void
	 */
	void addques(Question formQues);
	/**
	 * 获取指定的question对象
	 */
	Question findQuesByQid(String qid);
	/**
	 * 更新指定question的状态
	 * @Title: update 
	 * @Description: TODO
	 * @param question
	 * @return: void
	 */
	void update(Question question);
	
	String getAvatar(String qid);
	List<Question> finQuesByUid(String uid);
}
