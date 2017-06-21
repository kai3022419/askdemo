package com.chinasofti.ask.question.web.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.chinasofti.ask.answer.domain.Answer;
import com.chinasofti.ask.answer.service.AnswerService;
import com.chinasofti.ask.answer.service.Impl.AnswerServiceImpl;
import com.chinasofti.ask.question.domain.Question;
import com.chinasofti.ask.question.service.QuestionService;
import com.chinasofti.ask.question.service.Impl.QuestionServiceImpl;
import com.chinasofti.ask.user.domain.User;

@WebServlet("/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	QuestionService quesService = new QuestionServiceImpl();
	AnswerService answerService = new AnswerServiceImpl();
	/**
	 * 获取所有问题
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */

	public void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cid = request.getParameter("cid");
		List<Question> newquestions = quesService.findAll(cid);
		request.setAttribute("newquestions", newquestions);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
				String opr = req.getParameter("opr");
				//查询所有问题
				if(opr.equals("findAll")){
					findAll(req,resp);
				}
				//显示问题详情
				else if(opr.equals("view")){
					String qid = req.getParameter("qid");
					Question question = quesService.findQuesByQid(qid);
					//把该问题的浏览数+1
					question.setBelookCount(question.getBelookCount()+1);
					quesService.update(question);//更新
					//获取该问题的所有回答
					List<Answer> answers = answerService.findAll(qid);
					req.getSession().setAttribute("answers", answers);
					
					req.setAttribute("formQues", question);
					req.getRequestDispatcher("/question_view.jsp").forward(req, resp);
				}else if(opr.equals("close")){
					String qid = req.getParameter("qid");
					Question question = quesService.findQuesByQid(qid);
					question.setState(1);
					quesService.update(question);
					req.setAttribute("formQues", question);
					req.getRequestDispatcher("/question_view.jsp").forward(req, resp);
				}else if(opr.equals("findQuesByUid")){
					User sessionUser = (User)req.getSession().getAttribute("user");
					String uid = sessionUser.getUid();
					List<Question> quesList = quesService.finQuesByUid(uid);
					req.setAttribute("quesList", quesList);
					req.getRequestDispatcher("/question_list.jsp").forward(req, resp);
				}
	}
	/**
	 * 创建问题
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//解决文件名乱码
		request.setCharacterEncoding("UTF-8");
		// 获取session中user:因为创建的question对象，需要uid和userName,都是该user的属性值
		User sessionUser = (User) request.getSession().getAttribute("user");
		// 创建把硬盘文件解析为表单项对象的工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 创建解析request的解析器
		ServletFileUpload sfu = new ServletFileUpload(factory);
		try {
			// 使用解析器解析request,得到包含所有表单项的集合
			List<FileItem> items = sfu.parseRequest(request);
			Question formQues = new Question();// 创建question对象，用来交给业务层处理
			String title = null, content = null, cid = null, image = null,quesPath="";// 从前端页面获取的四个属性
			for (FileItem item : items) {// 遍历所有的表单项
				if (item.isFormField()) {// 如果是普通表单项，并获取相应的表单项的值
					if (item.getFieldName().equals("title")) {
						title = item.getString("utf-8");
					} else if (item.getFieldName().equals("content")) {
						content = item.getString("utf-8");
					} else if (item.getFieldName().equals("cateId")) {
						cid = item.getString("utf-8");
					} 
				} else {//肯定是文件表单项
					image = item.getName();//获取上传文件的名称
							//使用hash打散的方式，上传该文件
							String path = this.getServletContext().getRealPath(
									"/uploadFile/quesImage");
							int hash = image.hashCode();
							String hex = Integer.toHexString(hash);
							quesPath =  hex.charAt(0) + "/"+ hex.charAt(1);
							File file = new File(path, quesPath);
							file.mkdirs();
							item.write(new File(path + "/" + quesPath, image));
					}
				}
			// 把cid的值用;隔开，得到的是包含cid 和cateName两个值的数组
			String[] quesInfo = cid.split(";");
			//给question的每个属性赋值
			formQues.setCid(quesInfo[0]);
			formQues.setCateName(quesInfo[1]);
			formQues.setQid(UUID.randomUUID().toString().replace("-", ""));
			formQues.setTitle(title);
			formQues.setContent(content);
			// 获得当前登录的用户
			formQues.setUid(sessionUser.getUid());
			formQues.setQuizTime(new Date());
			// 也可以使用SimpleDateFormat
			Date endTime = new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 3);
			formQues.setEndTime(endTime);
			// 获取与当前question关联的用户的uname
			formQues.setUsername(sessionUser.getUname());
			formQues.setImage(quesPath+"/"+image);
			request.getSession().setAttribute("formQues", formQues);
			// 请求业务层添加question
			quesService.addques(formQues);
			request.setAttribute("formQues", formQues);
			request.getRequestDispatcher("/question_view.jsp").forward(request, response);
			//request.getSession().removeAttribute("formQues");
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
