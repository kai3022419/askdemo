package com.chinasofti.ask.answer.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasofti.ask.answer.domain.Answer;
import com.chinasofti.ask.answer.service.AnswerService;
import com.chinasofti.ask.answer.service.Impl.AnswerServiceImpl;
import com.chinasofti.ask.question.domain.Question;
import com.chinasofti.ask.question.service.QuestionService;
import com.chinasofti.ask.question.service.Impl.QuestionServiceImpl;
import com.chinasofti.ask.user.domain.User;
import com.chinasofti.ask.util.BaseServlet;

@WebServlet("/AnswerServlet")
public class AnswerServlet extends BaseServlet{
	AnswerService answerService = new AnswerServiceImpl();
	QuestionService quesService = new QuestionServiceImpl();
	public void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		User sessionUser = (User)req.getSession().getAttribute("user");
		String qid = req.getParameter("qid");
		String content = req.getParameter("content");
		String aid = UUID.randomUUID().toString().replace("-", "");
		User sessionuser = (User) req.getSession().getAttribute("user");
		String uid = sessionuser.getUid();
		Date answerTime = new Date();
		String state = "0";
		
		Answer answer = new Answer();
		answer.setAid(aid);
		answer.setAnswerTime(answerTime);
		answer.setContent(content);
		answer.setQid(qid);
		answer.setState(state);
		answer.setUid(uid);
		//设置answer对象的avatar/uname属性
		answer.setAvatar(sessionUser.getAvatar());
		answer.setUname(sessionUser.getUname());
		Question question = quesService.findQuesByQid(qid);
		question.setAnswerUser(sessionUser);
		//添加回答
		answerService.addAnswer(answer);

		//该问题的回答信息
		List<Answer> answers = answerService.findAll(qid);
		String avatar = quesService.getAvatar(qid);
		question.setAvatar(avatar);
		
		req.getSession().setAttribute("answers", answers);
		req.setAttribute("formQues", question);
		req.getRequestDispatcher("/question_view.jsp").forward(req, resp);
	}
}
