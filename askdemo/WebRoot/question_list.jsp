<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>问题列表</title>
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
		<div class="dh">
			<a href="">互动问答网</a>
		</div>
		<div class="cleftbox">
			<p class="blank10"></p>
			<div class="title">
				<ul>
					<li class="on">全部问题</li>
					<li class="current_none"><a href=""><font color="#ff6600">？</font>待解决</a>
					</li>
					<li class="current_none"><a href=""><font color="#1bbf00">√
						</font>已解决</a></li>
				</ul>
				<div class="blank0"></div>
			</div>

			<div class="clist">
				<ul>
					<li class="li1"><span id="loading"></span>标题(共3条)</li>
					<li class="li2">回答/查看</li>
					<li class="li3">状态</li>
					<li class="li4">提问时间</li>
				</ul>
				<c:forEach items="${quesList}" var="question">
					<ul>
						<li class="li1"><a
							href="question?opr=view&id=${question.qid}" target="_blank"
							title="${question.title}">${question.title}</a> &nbsp;<span class="lei">[<a
								target="_blank" href="" title="${question.cateName}" class="lei">${question.cateName}</a>] 
						</li>
						<li class="li2">${question.answerCount}/${question.belookCount}</li>
						<li class="li3"><img src="css/common/icn_6.gif" /></li>
						<li class="li4">${question.quizTime}</li>
					</ul>
				</c:forEach>
			</div>
			<div class="blank20"></div>
			<div class="pages">
				<div class="scott"></div>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>
