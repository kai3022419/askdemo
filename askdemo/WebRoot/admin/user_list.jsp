<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户管理</title>
<base href="${base}/" />
<link href="css/admin/admincp.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.2.js"></script></head>
<script type="text/javascript" src="js/lhgdialog.js"></script></head>
<script type="text/javascript">
	function firstPage(){
		location.href = "<c:url value='/AdminServlet?opr=findAll&pageCode=1}'/>";
	}
	
	function lastPage(){
		location.href = "<c:url value='/AdminServlet?opr=findAll&pageCode=${pb.pageCode-1}'/>";
	}
	
	function nextPage(){
		location.href = "<c:url value='/AdminServlet?opr=findAll&pageCode=${pb.pageCode+1}'/>";
	}
	
	function endPage(){
		location.href = "<c:url value='/AdminServlet?opr=findAll&pageCode=${pb.totalPage}'/>";
	}
	
	function go(){
		var text = document.getElementById("text");
		location.href = "<c:url value='/AdminServlet?opr=findAll&pageCode=text.value'/>";
	}
</script>
<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td>
				<div style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
					<div style="float:left;">
						<a href="" target="main"><b>控制面板首页</b> </a>&nbsp;&raquo;&nbsp;用户管理
					</div>
				</div>
				<form name="form1" action="/ask/opr.jsp" method="post">
					<input type="hidden" name="opr" value="list">
					<input type="hidden" name="page" value="1">
					<table width="100%" cellspacing="1" cellpadding="4" align="center"
						class="tableborder">
						<tbody>
							<tr>
								<td width="20%">用户名:<input class="txt" name="name" value="">
								</td>
								<td width="20%">Email:<input class="txt" name="email" value="">
								</td>
								<td><input class="btn" type="submit" value="查 询"></td>
							</tr>
						</tbody>
					</table>
				</form>
 				[共 <font color="green">${pb.totalRecord }</font> 个用户]
				<form name="userForm" action="opr.jsp" id="userForm"
					method="post" onsubmit="return validate()">
					<input type="hidden" name="opr" value="del">
					<table width="100%" border="0" cellpadding="4" cellspacing="1"
						class="tableborder" id="datatable">
						<tr class="header">
							<td width="8%"><input class="checkbox" id="chkall"
								type="checkbox" name="chkall"><label for="chkall">全选</label>
							</td>
							<td width="10%">用户名</td>
							<td width="20%">Email</td>
							<td width="10%">提问数</td>
							<td width="15%">回答数/被采纳数</td>
							<td width="10%">操作</td>
						</tr>
						<c:forEach items="${pb.beanList}" var="user">
							<tr>
								<td width="8%"><input type="checkbox" >
								<td width="10%">${user.uname }</td>
								<td width="20%">${user.email }</td>
								<td width="10%">${user.quizCount }</td>
								<td width="15%">${user.answerCount }/${user.passAnswerCount }</td>
								<td width="10%"><input class="button" type="submit" name="delete" value="删除" /></td>
							</tr>
						</c:forEach>
						<tr class="altbg1"  id="oprbtn">
							<td colspan="7">
							<input name="ctrlcase" class="btn" type="button" value="首页" onclick="firstPage();">&nbsp;&nbsp;&nbsp; 
							<input name="ctrlcase" class="btn" type="button" value="上一页" 
							   <c:choose>
									<c:when test="${pb.pageCode>1 }">
										onclick="lastPage();"
									</c:when>
								</c:choose>   >&nbsp;&nbsp;&nbsp;
							<input name="ctrlcase" class="btn" type="button" id="next" value="下一页" 
								<c:choose>
									<c:when test="${pb.pageCode<pb.totalPage }">
										onclick="nextPage();"
									</c:when>
								</c:choose>   >&nbsp;&nbsp;&nbsp;
							<input name="ctrlcase" class="btn" type="button" value="尾页" onclick="endPage();">
								
							<select id="selPage" >
									
							</select>
								
							<input type="text" id="text"><input type="button" value="go" onclick="go();">
							</td>
						</tr>
						<tr>
							<td colspan="7" class="altbg1" align="left"><input
								class="button" type="submit" name="delete"
								value="删除" /></td>
						</tr>
						
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
