<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chang_password.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<p style="color:red">${errorMsg}</p>
    <form name="changpwdform" action="<c:url value='UserServlet'/>" method="post">
	<input type="hidden" name="opr" value="changePwd"/>
	<table>
    <tr>
    	<td>请输入旧密码：</td>
    	<td><input type="password" name="oldpwd"></td>
    </tr>
    <tr>
    	<td>请输入新密码：</td>
    	<td><input type="password" name="newpwd"></td>
    </tr>
    <tr>
    	<td>再次输入新密码:</td>
    	<td><input type="password" name="renewpwd"></td>
    </tr>
    <tr>
    	<td><input type="submit" name="submit" class="changepwd_suc.jsp" value="提&nbsp;交" /></td>
    </tr>
    </table>
    </form>
  </body>
</html>
