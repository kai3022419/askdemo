<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>找回密码</title>
<meta charset="UTF-8" />
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<br />
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh">找回密码</div>
		<div class="loginleft">
			<div class="zhuce">
				<div class="zhucet"></div>
				<div class="zhucec">
					<h1>友情贴士：</h1>
					<ul>
						<li>·请正确填写相关信息以帮您找回密码。</li>
					</ul>
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
					<form name="getpassform" action="" method="post">
						<div class="dlc">
							<div class="shur">
								<h2>&nbsp;用户名：</h2>
								<input type="text" name="username" id="username" class="input3">
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>电子邮件：</h2>
								<input type="text" name="password" name="email" id="email"
									class="input3" />
							</div>
							<div class="clr"></div>
							<div class="shur1">
								<input type="submit" name="submit" class="button4"
									value="提&nbsp;交" />
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
