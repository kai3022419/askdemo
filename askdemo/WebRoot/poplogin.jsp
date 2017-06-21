<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="${base}/" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div>
		<form name="loginform" action="user" method="post">
			<input type="hidden" name="opr" value="login" />
			<div class="dlc">
				<div class="shur">
					<h2>用户名：</h2>
					<input type="text" name="name" id="username" class="input3"
						value="">
				</div>
				<div class="clr"></div>
				<div class="shur">
					<h2>密&nbsp;码：</h2>
					<input type="password" name="password" id="password" class="input3"
						value="" />
				</div>
				<div class="clr"></div>
				<div class="shur">
					<h2>验证码：</h2>
					<input type="text" name="vcode" id="vcode" class="input3"
						style="width:80px" /> <img src="vcode.jxxxx"
						onclick="change(this)">
				</div>
				<div class="clr"></div>
				<div class="shur1">
					<input border="1" type="checkbox" value="2592000" name="cookietime"
						id="cookietime" />10天内自动登录
				</div>
			</div>
		</form>
	</div>
</body>
</html>
