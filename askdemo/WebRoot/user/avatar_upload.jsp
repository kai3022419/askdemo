<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>个人中心</title>
<base href="${base}/" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function view(){
	alert(document.getElementById("image").value);
}



	function check_file(){
			var image = document.getElementById("image");
			var filetip = document.getElementById("filetip");
			var index = image.value.lastIndexOf(".");
			var suffix = image.value.substring(index+1);
			var newsuffix = suffix.toUpperCase();
			if(newsuffix=="PNG"||newsuffix=="JPG"||newsuffix=="JPEG")
			{
				filetip.innerHTML = "";
				filetip.setAttribute("class","input_ok");
				return true;
			}else{
				filetip.innerHTML = "文件类型只能是图片";
				filetip.setAttribute("class","input_error");
				return false;
			}
		}
	
</script>
</head>

<body>
	<div class="header">
		<c:import url="../header.jsp" />
	</div>
	<div class="content">
		<div class="uleft">
			<div class="tximg">
				<img width="100px" height="100px" src="${sessionScope.user.avatar }" alt="${sessionScope.user.uname}" title="${sessionScope.user.uname}">
			</div>
			<div class="txname">
				${sessionScope.user.uname} <img src="css/default/online.gif" align="absmiddle" title="当前在线"
					alt="当前在线" />
			</div>
			<div class="clr"></div>
			<div class="list">
				<h1 class="on">
					<a title="我的主页" target="_top" href=""><img width="16"
						height="16" align="absmiddle" src="css/default/myhome.gif" />
						&nbsp;我的主页</a>
				</h1>
				<h1>
					<a title="我的问答" target="_top" href=""><img width="16px"
						height="15px" align="absmiddle" src="css/default/myanswer.gif" />
						&nbsp;我的问答</a>
				</h1>
				<h1 class="">
					<a title="我的消息" target="_top" href=""><img width="16px"
						height="16px" align="absmiddle" src="css/default/mymsg.gif" />
						&nbsp;我的消息</a>
				</h1>
				<h1 class="">
					<a title="我收藏的问题" target="_top" href=""><img width="14"
						height="15" align="absmiddle" src="css/default/mycollect.gif" />
						&nbsp;我的收藏</a>
				</h1>
			</div>
		</div>
		<div class="uright">
			<div class="grzl">
				<h2>请选择本地图片</h2><br/>
				<form action="UserServlet?opr=avatarUpload" method="post" enctype="multipart/form-data">
					<input type="file" name="image" id="image" onchange ="check_file();"><span id="filetip" ></span>
				 	<input type="submit" class="button" value="确定">
				 	<input type="button" class="button" value="预览" onclick="view()">
				</form>
			</div>
			<div class="glgrzl">
				<div class="ggao"></div>
				<div class="glzlt"></div>
				<div class="glzlc">
					<h1>管理个人资料</h1>
					<div class="clr"></div>
					<div class="jiben">
						<img width="16px" height="16px" src="css/default/myquestion.gif" />
						<a title="我的问题" target="_top" href="<c:url value='QuestionServlet?opr=findQuesByUid'/>">我的提问</a>&nbsp;&nbsp; <img
							width="16px" height="16px" src="css/default/myanswer.gif" /> <a
							title="我的回答" target="_top" href="">我的回答</a>
					</div>
					<div class="jiben">
						<img width="16px" height="16px" align="absmiddle"
							src="css/default/mymsg.gif" /> <a title="我的消息" target="_top"
							href="">我的消息</a>&nbsp;&nbsp; <img width="16px" height="16px"
							src="css/default/myquestion.gif" /> <a title="修改密码"
							target="_top" href="">修改密码</a>
					</div>
					<div class="jiben">
						<img width="16px" height="16px" align="absmiddle"
							src="css/default/myinfo.gif"> <a title="个人信息" target="_top"
							href="">个人信息</a>&nbsp;&nbsp; <img width="16px" height="16px"
							align="absmiddle" src="css/default/myavatar.gif" /> <a
							title="查看或修改头像" target="_top" href="">修改头像</a>
					</div>
					<div class="clr"></div>
				</div>
				<div class="glzlb"></div>
				<div class="clr"></div>
			</div>
			<div class="fg">
				<img width="780px;" height="6px" src="css/default/userline.gif">
			</div>
			<div class="jf"></div>
			
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="../footer.jsp"></c:import>
	</div>
</body>
</html>