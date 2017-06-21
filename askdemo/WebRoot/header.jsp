<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<script type="text/javascript">
	function logout() {
		if (confirm("确认退出吗")) {
			location.href = "<c:url value='UserServlet?opr=logout'/>";
			//window.close();
		}
	}

</script>
<div class="h_top">
	<br />
	<div class="logo">
		<a href="" title="问答平台" target="_top"><img
			src="css/default/logo.jpg" /> </a>
	</div>
	<div class="userbar">
		
	<div class="userbar">
		<div class='hyn'>
			<c:choose>
				<c:when test="${not empty sessionScope.user }">
					<div class='gdfw'>
					<img src="${user.avatar }" alt="${user.uname}" />
					</div>
					<div class='hyn'>
					<p>
					您好,<a href=""><b>${user.uname}</b> </a> <span class="separe">|</span><a
						href="/askdemo/user/index.jsp">个人中心</a><span class="separe">|</span>
					<c:if test="${sessionScope.user.role eq '1'}">
						<a href="<c:url value='/admin/index.jsp'/>">后台管理<span class="separe">|</span>
						</a>
					</c:if>
					<a href="javascript:logout()">退出</a>
					</p>
					<p>提问:${user.quizCount} | 回答:${user.answerCount}</p>
					</div>
				</c:when>
				<c:otherwise>
				<div class='hyn'>
					<p>
						您好，欢迎来互动问答网！[<a href="login.jsp">请登录</a>] [<a href="register.jsp">免费注册</a>]
					</p>
				</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
		
	</div>
	<div class="clr"></div>
</div>
<div class="h_mid">
	<div class="h_mid_l"></div>
	<div id="tdh" class="h_mid_m">
		<ul>
			<li class="on"><strong>问答首页</strong></li>
		</ul>
	</div>
	<div class="h_mid_r"></div>
</div>
<div class="clr"></div>
<div class="h_b">
	<div class="h_b_l"></div>
	<div class="h_b_m">
		<div class="question_count">
			<span class="count">已解决问题数:</span><span class="countques">${applicationScope.endcount }</span><br />
			<span class="count">待解决问题数:</span><span class="countques">${applicationScope.notcount }</span>
		</div>
		<form name="searchform" action="" method="post">
			<div class="h_b_input">
				<input type="hidden" name="q" id="kw_hide" autocomplete="off" /> <input
					type="text" id="kw" onmouseover="this.focus()" autocomplete="off"
					class="searchinput" style="vertical-align:middle;" name="word"
					maxlength="100" tabindex="1" value="" />
				<button type="button" class="sub" onclick=""></button>
				<input type="button" class="but"
					onclick="location.href='question_add.jsp'" />
			</div>
		</form>
		<div class="tongji">
			<div id="move">
				<span class="count">在线人数:</span>${userNumber }人<br /> 
				<span class="count">注册用户:</span>${applicationScope.recount }人
			</div>
		</div>
		<div class="clr"></div>
	</div>
	<div class="h_b_r"></div>
</div>
<div class="clr"></div>