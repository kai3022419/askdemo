<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<title>查看问题</title>
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8">
	
</script>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript">
	$(function() {
		/*	$(".touxiang").find("img").on("mouseover",function(){
				alert($(this).prev().val());
				var user=JSON.parse(r);
				
			}); */
	});
	function closeQues(){
	if(confirm("确认退出吗？"))
		location.href = "<c:url value='/QuestionServlet?opr=close&qid=${formQues.qid}'/>";
	}
</script>
<link type="text/css" rel="stylesheet"
	href="ueditor/third-party/SyntaxHighlighter/shCoreDefault.css" />
<!--主题样式表(多重样式选一)-->

<script type="text/javascript"
	src="ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<!--核心js脚本(必选)-->
</head>

<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<!--问题分类导航开始-->
		<div class="dh">
			<a href="">互动问答网</a> &gt; <a href=""></a>
		</div>

		<!--问题分类导航结束-->
		<div class="leftbox">
			<!--问题开始-->
			<div class="wenti">
				<div class="wttitle">
					<ul>
						<li class="wta1"></li>
						<li class="wta2">
							<div class="qico">
								<div class="iwhy"></div>
							</div>
						</li>
						<li class="wta3"></li>
						<li class="wta4"></li>
					</ul>
					<div class="clr"></div>
				</div>
				<div class="wtallcont">
					<div class="wtleft">
						<div class="readFace" id="userinfo-2"></div>
						<div class="touxiang">
							<input type="hidden" value="${formQues.uid}" /> <img
								src="${user.avatar}" width="100" height="100" />
						</div>
						<div class="hyxinxi">
							<a href="" target="top">${formQues.username}</a>
						</div>
					</div>
					<div class="wtright">
						<div class="wtt">
							<h1 class="wttit">${formQues.title}</h1>
							<c:choose>
								<c:when test="${formQues.state eq 0 }">
									<div class="xs">
									<span class="twsj"> <img src="css/default/lefttime.gif" />
									${formQues.remainingTime }&nbsp;&nbsp; 浏览次数:<span id="views">${formQues.belookCount}</span>
									</span>
									</div>
								</c:when>
								<c:otherwise>
									<span>问题已关闭</span>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="qfgx"></div>
						<div class="wtcont" id="mydescription">
							<p>${formQues.content}</p>
							<img alt="java" src="uploadFile/quesImage/${formQues.image }">
						</div>
						<div class="clr"></div>
						<c:if test="${not empty sessionScope.user}">
						<div class="wlhdb">
							<c:choose>
							<c:when
								test="${(sessionScope.user.role eq '1' or sessionScope.user.uid eq requestScope.formQues.uid) and requestScope.formQues.state eq 0}">
								<h1>处理问题：</h1>
								<p>如果已获得满意的回答，请及时采纳，感谢回答者。若还没有满意的回答，可以尝试以下操作：</p>
								<span class="questioncontrol"><input type="button"
									value="关闭问题" name="supply_question" onclick="closeQues();" class="button1"
									title="无满意答案的回答，可以直接结束提问，关闭问题" /> </span>
							</c:when>
							<c:otherwise>
								<h1>问题已关闭</h1>
							</c:otherwise>
							</c:choose>
							<form name="closeForm" action="" method="post">
								<input type="hidden" value="2" name="qid" />
							</form>
							<div id="mysupplydiv" style="display: none;">
								<h5>问题补充</h5>
								补充提问细节，以得到更准确的答案
								<form name="supplyForm" action="" method="post">
									<span class="innerrightspan"><input type="button"
										class="button4" value="提交" onclick="check_mysupply();" /> </span>
								</form>
							</div>
						</div>
						</c:if>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="wtbuttom">
					<ul>
						<li class="wtba1"></li>
						<li class="wtba2"></li>
						<li class="wtba3"></li>
						<li class="wtba4"></li>
					</ul>
					<div class="clr"></div>
				</div>
			</div>
			<!--问题结束-->
			<div class="qitawenda">
				<div class="ianswer"></div>
			</div>

			<!--回答开始-->
			<c:forEach items="${answers}" var="answer">
				<div class="qita">
					<div class="qitat"></div>
					<div class="qtallcont">
						<div class="qtleft">
							<div class="readFace" id="userinfo-2"></div>
							<div class="touxiang">
								<input type="text" value="${answer.uid}" /> <img
									align="absmiddle" src="${answer.avatar}"
									alt="${answer.uname}" />
							</div>
							<div class="hyxinxi">
								<span class="name"><a target="_blank" href="">${answer.uname}</a>
								</span>

							</div>
						</div>
						<div class="qtright">
							<div class="qtt">
								<img align="absmiddle" src="css/default/lefttime.gif" />
								回答于:5小时前
							</div>
							<div class="clr"></div>
							<div class="qfgx"></div>
							<div class="qtcont">
								<div class="wtcont" id="mc0">${answer.content}</div>
								<div class="blank10"></div>
								<div class="clr"></div>
								<!--如果是提问者并且不是匿名用户，则显示“采纳为答案”按钮-->
								<!--如果是回答者自己，则显示“修改答案”按钮-->
								<c:if test="${sessionScope.user.uid eq answer.uid}">
									<input type="button" value="修改答案" name="button"
										onclick="showeditanswer('0')" class="button1" />&nbsp;
								<div class="clr"></div>
									<div id="editanswerdiv0" style="display: none;">
										<h5>修改回答内容</h5>
										<form name="editanswerForm0" id="editanswerForm0" action=""
											method="post">
											<input type="hidden" value="4" name="qid" /> <input
												type="hidden" value="2" name="aid" />
											<script type="text/plain" id="answercontet0" name="content"></script>
											<script type="text/javascript">
											</script>
											<span class="innerrightspan"><input type="button"
												class="button4" value="提交"
												onclick="check_editanswer(editoranswer0,'0');" /> </span>
										</form>
										<div class="blank10"></div>
									</div>
								</c:if>
								<input type="button" value="采纳为答案" name="button"
									onclick="showeditanswer('0')" class="button1" />&nbsp;
								<div class="clr"></div>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div class="qtbuttom">
						<ul>
							<li class="qtba1"></li>
							<li class="qtba2"></li>
							<li class="qtba3"></li>
							<li class="qtba4"></li>
						</ul>
						<div class="clr"></div>
					</div>
				</div>
			</c:forEach>
			<div class="pages">
				<div class="scott"></div>
			</div>
			<!--回答结束-->
		</div>

		<!--回答问题开始-->
		<ask:showAnswer userId="${sessionScope.user.uid}"
			quserId="${formQues.uid}">
			<div class="blank10"></div>
			<div class="zjpl">
				<div class="zjpltitle">
					<ul>
						<li class="zjpla1"></li>
						<li class="zjpla2"><div class="juzhong">&nbsp;我帮TA解答：</div></li>
						<li class="zjpla3"></li>
					</ul>
					<div class="clr"></div>
				</div>
				<div class="zjplcon">
					<form name="answerForm" action="<c:url value='AnswerServlet'/>" method="post">
						<input type="hidden" value="add" name="opr" /> 
						<input type="hidden" value="${formQues.qid}" name="qid">
						<textarea id="mycontent" name="content"
							style="width:740px;margin-left: 4px;"></textarea>
						<script type="text/javascript">
							var option = {
								toolbars : [ [ 'fullscreen', 'source', '|',
										'undo', 'redo', '|', 'bold', 'italic',
										'underline', 'fontborder',
										'strikethrough', 'superscript',
										'subscript', 'removeformat'] ],
								initialFrameWidth : 750,
								initialFrameHeight : 300

							};
							var mycontent = new baidu.editor.ui.Editor(option);
							mycontent.render("mycontent");
						</script>
						<p class="zjplbr">
							<input type="submit" value="" align="absmiddle" class="subanswer"
								name="mybutton" />
						</p>
					</form>

				</div>
				<div class="zjpjbuttom">
					<ul>
						<li class="zjplba1"></li>
						<li class="zjplba2"></li>
						<li class="zjplba3"></li>
					</ul>
					<div class="clr"></div>
				</div>
			</div>
		</ask:showAnswer>
		<!--回答问题结束-->
	</div>
	</div>
	</div>
	<div class="clr"></div>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>
<script type="text/javascript">
	SyntaxHighlighter.all(); //通过该js脚本来进行高亮处理;
</script>
<!-- Baidu Button BEGIN -->
<script type="text/javascript" id="bdshare_js"
	data="type=slide&amp;img=0&amp;pos=right&amp;uid=0"></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
	document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion="
			+ Math.ceil(new Date() / 3600000);
</script>
<!-- Baidu Button END -->