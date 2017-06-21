<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#button1").click(function(){
				$("#h1").css({"color":"red","font-size":"100px"});
				$("#h1").html("hahahahhaa");
				$("#22").val("222222222");
				$("#h1").append("append");
				$("#h1").before("before");
				$("#h1").after("after");
			});
		});
	</script>
  </head>
  
  <body>
    <h1 id="h1">hello world</h1>
    <input id="22" value="11"/>
    <input type="button" id="button1" value="jqery"/>
  </body>
</html>
