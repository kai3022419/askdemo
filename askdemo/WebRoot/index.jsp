<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>问答平台首页</title>
<meta charset="UTF-8" />
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />


</head>
<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<!--左边分类开始-->
		<div class="left">
			<!--问题分类开始-->
			<div class="wtfl">
				<div class="wtfl_t"></div>
				<div class="wtfl_m">
					<div class="wtfl_m_t">
						<div class="wt_l">&nbsp;问题分类</div>
						<div class="clr"></div>
						<div id="rmc"></div>
					</div>
					<div id="siderbar">
						<div id="secNav">
							<ul id="secNavList">
								<c:forEach items="${sessionScope.categories}" var="category">
									<div class="iconBg">
											<a href="QuestionServlet?opr=findAll&cid=${category.cid }" title="${category.cname}">${category.cname}</a>(<span
												class="categorynum">${category.quesCount}</span>)
										</div>
									<li>
										
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="wtfl_b"></div>
			</div>
			<!--问题分类结束-->
		</div>
		<div class="b_right">
			<div class="middle">
				<!--待解决问题开始-->
				<div class="m_wt">
					<div class="m_wtt">
						<ul>
							<li class="a1"></li>
							<li class="a2">
								<div class="a2t">大家都在问什么</div>
								<div class="more">
									<a target="_top" title="更多问题" href="question_list.jsp">更多问题</a>
								</div>
							</li>
							<li class="a3"></li>
						</ul>
						<div class="clr"></div>
					</div>

					<div class="m_wtm">
						<div id="weijieList">
							<ul>
								<c:forEach items="${newquestions}" var="question">
									<li><a target="_blank"
										href="<c:url value='/QuestionServlet?opr=view&qid=${question.qid }'/>"
										title="${question.title}">${question.title}</a>&nbsp;<span
										class="lei">[<a target="_blank" href=""
											title="${question.qid}">${question.cid}</a>]
									</span><span class="qanswers">${question.answerCount}回答</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="m_wtb"></div>
				</div>
				<!--待解决问题结束-->
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>