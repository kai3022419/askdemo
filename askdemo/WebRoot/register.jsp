<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE HTML>
<html>
<head>
<title>用户注册</title>
<meta charset="UTF-8" />
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/jquery-validate.js"></script>
	
<script type="text/javascript">
	//校验用户名
	function check_name(){
		var uname = document.getElementById("username").value;
		var usernametip = document.getElementById("usernametip");
		if(uname.length<3||uname.length>14){
			usernametip.innerHTML = "用户名长度必须是3-14位";
			usernametip.setAttribute("class","input_error");
			return false;
		}else{
			xmlHttp = createXMLHttpRequest();
			xmlHttp.open("POST", "<c:url value='UserServlet'/>", true);
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xmlHttp.send("opr=checkUname&uname="+uname);
			xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState==4&&xmlHttp.status==200){
						var text = xmlHttp.responseText;
						if(text!="ok"){
							usernametip.innerHTML = text;
							usernametip.setAttribute("class","input_error");
						}else{
							usernametip.innerHTML = "";
							usernametip.setAttribute("class","input_ok");
						}
			}
		};
		return true;
	}
	}	
	//校验密码
	function check_password(){
		var password = document.getElementById("password").value;
		var passwordtip = document.getElementById("passwordtip");
		if(password.length<6||password.length>14){
			passwordtip.innerHTML = "密码长度必须是6-14位";
			passwordtip.setAttribute("class","input_error");
			return false;
		}else{
			passwordtip.innerHTML = "";
			passwordtip.setAttribute("class","input_ok");
			return true;
		}
		
	}
	//校验重复密码
	function recheck_password(){
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		var repasswordtip = document.getElementById("repasswordtip");
		if(repassword!=password){
			repasswordtip.innerHTML = "必须与登录密码输入一致";
			repasswordtip.setAttribute("class","input_error");
			return false;
		}else{
			repasswordtip.innerHTML = "";
			repasswordtip.setAttribute("class","input_ok");
			return true;
		}
	}
	//校验邮箱
	function check_email(){
		var email = document.getElementById("email").value;
		var reg = new RegExp("\^[A-Za-z0-9]+\@[A-Za-z0-9]+\.[A-Za-z]{2,4}");
		var emailtip = document.getElementById("emailtip");
		if(reg.test(email)){
			emailtip.innerHTML = "";
			emailtip.setAttribute("class","input_ok");
			return true;
		}else{
			emailtip.innerHTML = "邮箱格式不对";
			emailtip.setAttribute("class","input_error");
			return false;
		}
	}
	//所有表单验证都通过，就提交该表单
	function doSubmit(){
		var form1 = document.getElementById("form1");
		if(check_name()&&check_password()&&recheck_password()&&check_email()){
			form1.submit();
		}
	}
	
	var xmlHttp;
		//根据浏览器版本创建XMLHttpReuest对象
		function createXMLHttpRequest(){
			try{
				return new XMLHttpRequest();
			}catch(e){
				try{
					return new ActiveXObject("Msxml2.XMLHTTP"); 
				}catch(e){
					try{
						return new ActiveXObject("Microsoft.XMLHTTP");
					}catch (e) {
						alert("您用这浏览器，就别用ajax了 吧");
						throw e;
					}
				}
			}
			
		}
		window.onload = function(){
			var email = document.getElementById('email');
			email.oninput = function(){
			//获取XMLHttpRequest对象
				xmlHttp = createXMLHttpRequest();
				//打开连接
				xmlHttp.open("POST", "<c:url value='UserServlet'/>", true);
				//设置请求头
				xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				//发送请求
				xmlHttp.send("opr=ajaxEmail&value="+email.value);
				xmlHttp.onreadystatechange = function(){
					if(xmlHttp.readyState==4&&xmlHttp.status==200){
						var text = xmlHttp.responseText;
						var content = eval("("+text+")");
						var table1 = document.getElementById("table1");
						clearContent();
						for(var i=0;i<content.length;i++){
							var tr = document.createElement("tr");
							var td = document.createElement("td");
							oprTd(td);
							var tdText = document.createTextNode(content[i]);
							td.appendChild(tdText);
							tr.appendChild(td);
							table1.appendChild(tr);
						}
					}
				};
			};
			
		};
		function oprTd(td){
			td.setAttribute("onmouseover","setColor(this,'gray')");
			td.setAttribute("onmouseout","setColor(this,'white')");
			td.onclick = function(){
				var text = td.innerHTML;
				var email = document.getElementById('email');
				email.value = text;
				clearContent();
			};
		}
		function setColor(td,color){
			td.setAttribute("style","background-color:"+color);
		}
		function clearContent(){
			var table1 = document.getElementById("table1");
			var allChild = table1.childNodes;
			for(var i=0;i<allChild.length;i++){
				table1.removeChild(allChild[i]);
				i--;
			}
		}
</script>
</head>
<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh">注册新用户</div>
		<div class="loginleft">
			<div class="zhuce">
				<div class="zhucet"></div>
				<div class="zhucec">
					<h1>
						<a href="login.jsp">已有账号？马上登录！</a>
					</h1>
					<h1>友情贴士：</h1>
					<ul>
						<li>·我们提醒您注意，您需要注册并登陆，才能享受我们的完整服务进行各项操作。</li>
						<li>·密码过于简单有被盗的风险，一旦密码被盗你的个人信息有泄漏的危险。</li>
						<li>·我们拒绝垃圾邮件，请使用有效的邮件地址</li>
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
				<p style="color:red">${errorMsg}</p>
					<form name="reg" name="registform" action="<c:url value='/UserServlet'/>"
						method="post" id="form1" >
						<input type="hidden" name="opr" value="register">
						<div class="dlc">
							<div class="shur">
								<h2>&nbsp;用户名:</h2>
								<input type="text" id="username" name="name"
									 class="required input3" value="" onblur="check_name();" /> <span
									id="usernametip" class="input_desc" >不超过14个字节(中文，数字，字母和下划线)</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>登录密码：</h2>
								<input type="password" name="password" id="password"
									class="input3"   onblur="check_password();"/> <span
									id="passwordtip" class="input_desc" >长度6-14位，字母区分大小写</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>密码确认：</h2>
								<input type="password" name="repassword" id="repassword"
									class="input3"   onblur="recheck_password();"/> <span
									id="repasswordtip" class="input_desc">与登录密码输入一致</span>
							</div>
							<div class="clr"></div>
							<div class="shur">
								<h2>电子邮件：</h2>
								<input type="text" id="email" name="email" class="input3"
								 onblur="check_email();"/> 
									<span id="emailtip" class="input_desc">请输入正确的电子邮箱地址</span>
							</div>
							<div class="shure" style="margin-left:110px;padding-top:10px;font-size: 17px;">
								<table id="table1"></table>
							</div>
							<div class="clr"></div>
							<div class="shur3">
								<input type="button" name="Submit" class="button4" id="Submit" value="提交注册" onclick="doSubmit();" />
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