<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
<title>用户登录</title>
<meta charset="UTF-8" />
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />

</head>

<script type="text/javascript">
	function change(){
  		var img = document.getElementById("img");
  		img.src= "<c:url value='/VeriServlet'/>?"+new Date().getTime();
  	}
</script>
<body>

	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh">用户登录</div>
		<div class="loginleft">
			<div class="zhuce">
				<div class="zhucet"></div>
				<div class="zhucec">
					<h1>
						<a href="register.jsp">还没有帐号？立即注册</a>！
					</h1>
				</div>
				<div class="zhuceb"></div>
			</div>
		</div>
		<div class="loginright">
			<div class="lgbdright">
				<ul>
					<li class="a1"></li>
					<li class="a2"></li>
					<li class="a3"></li>
				</ul>
			</div>
			<div class="clr"></div>
			<div class="lgrightc">
				<div class="dl">
					<p style="color:red">${errorMsg}</p>
					<form name="loginform" action="<c:url value='/UserServlet'/>" method="post">
						<input type="hidden" name="opr" value="login"/>
						<div class="dlc">
							<div class="shur">
								<h2>用户名：</h2>
								<input type="text" name="uname" id="username" class="input3" value="${cookie.uname.value }">
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>密&nbsp;码：</h2>
								<input type="password" name="password" id="password"
									class="input3" value="${cookie.password.value }" />
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>验证码：</h2>
								<input type="text" name="veriCode" class="input3">
								<img id = "img" src="<c:url value='/VeriServlet'/>"/>
								<a href="javascript:change();">看不清楚，换一张？</a>
							</div>
							<div class="clr"></div>
							<div class="shur1">
								<input type="submit" name="submit" class="button4"
									value="登&nbsp;录" />
								<input type="checkbox" name="autoLogin" />一周之内自动登录	
							</div>
							
						</div>
					</form>
					<div class="clr"></div>
				</div>
			</div>
			<div class="lgbdright2">
				<ul>
					<li class="a1"></li>
					<li class="a2"></li>
					<li class="a3"></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>