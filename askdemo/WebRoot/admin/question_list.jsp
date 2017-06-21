<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>问题管理</title>
<base href="${base}/">
<link href="css/admin/admincp.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/admin/admin_.css" type="text/css"></link>
<link rel="stylesheet" href="js/skins/default.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/lhgdialog.js">
</script>
<script type="text/javascript">

$(function(){
	
	$("#del").click(function(){
		$.dialog.alert("ok");
	});
	
	//$("").
	var totalPage="${pageBean.totalPage}";
	
	for(var i=1;i<=totalPage;i++){
		var option="<option value='"+i+"'>"+i+"</option>";
		$("#selPage").append(option);
	}
	
	$("#selPage").change(function(){
		goPage($(this).val());
	});
	$("#selPage").val("${pageBean.page}");
	/*
	$("document").resize(function(){
		alert("aa");
	});*/

	$("#next").one("click",function(){alert("aa");
		//goPage("${pageBean.page+1}");
	});
	
	//$("#next").unbind("click");
});

function goPage(p){
	//document.getElementById("page").value=p;
	$("#page").val(p);
	$("#form1").submit();
	//document.getElementById("form1").submit();
}

/*
window.onload=function(){
	//document.getElementsByName("status")[0].value="${question.status}";
	document.getElementById("selPage").value="${pageBean.page}";
}*/
</script>
<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td>
				<div style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
					<div style="float:left;">
						<a href="" target="main"><b>控制面板首页</b> </a>&nbsp;&raquo;&nbsp;问题管理
					</div>
				</div>
				<form action="question" method="post" id="form1">
					<input type="hidden" name="opr" value="list">
					<input type="hidden" name="page" id="page" value="1">
					<table width="100%" cellspacing="0" cellpadding="4" align="center"
						class="tableborder">
						<tr>
							<td width="200" class="altbg2">标题:<input class="txt"
								name="tit b   le" value="${question.title}">
							</td>
							<td width="200" class="altbg2">状态: <select name=" ">
									<option value="0">--不限--</option>
									<option value="1">待解决</option>
									<option value="2">已解决</option>
									<option value="6">推荐问题</option>
									<option value="9">已关闭问题</option>
							</select></td>
							<td width="400"  class="altbg2">提问时间: <input class="txt"
								onclick="showcalendar();" name="startTime" value="${question.startTime}">&nbsp;
								到&nbsp; <input class="txt" onclick="showcalendar();"
								name="overTime" value="${question.overTime}"></td>
							<td class="altbg2"><input class="btn" type="submit"
								value="提 交">
							</td>
						</tr>
					</table>
				</form> [共 <font color="green">${pageBean.actualSize}/${pageBean.totalNums}</font> 个问题，
				当前第${pageBean.page}页,共${pageBean.totalPage}页]
				<form name="queslist" method="POST">
					<table width="100%" border="0" cellpadding="4" cellspacing="1"
						class="tableborder">
						<tr class="header">
							<td width="8%"><input class="checkbox" id="chkall"
								type="checkbox" name="chkall"><label for="chkall">全选</label>
							</td>
							<td width="8%">序号</td>
							<td width="25%">标题</td>
							<td width="8%">提问者</td>
							<td width="10%">问题分类</td>
							<td width="10%">回答/查看</td>
							<td width="10%">状态</td>
							<td>提问时间</td>
						</tr>
						<c:forEach items="${pageBean.data}" var="question" varStatus="s">
							<tr>
								<td class="altbg2"><input class="checkbox" type="checkbox"
									value="9" name="qid[]"></td>
									<td class="altbg2" id="title_9"><a
									href="" target="_blank">${s.count}</a>
								</td>
								<td class="altbg2" id="title_9"><a
									href="" target="_blank">${question.title}</a>
								</td>
								<td class="altbg2"><a href=""
									target="_blank">${question.userName}</a>
								</td>
								<td class="altbg2"><a href=""
									target="_blank">${question.cateName}</a>
								</td>
								<td class="altbg2">${question.answerNums}/${question.viewNums}</td>
								<td class="altbg2">
								<c:choose>
									<c:when test="${question.status eq 1}"><img src="css/common/icn_1.gif"></c:when>
								<c:when test="${question.status eq 2}"><img src="css/common/icn_2.gif"></c:when>
								<c:when test="${question.status eq 3}"><img src="css/common/icn_3.gif"></c:when>
								</c:choose>
								</td>
								<td class="altbg2"><fmt:formatDate value="${question.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
							</tr>
							</c:forEach>
							<tr class="altbg1">
							<td colspan="7"><input name="ctrlcase" class="btn"
								type="button" value="首页">&nbsp;&nbsp;&nbsp; <input
								name="ctrlcase" class="btn" type="button" value="上一页">&nbsp;&nbsp;&nbsp;
								<input name="ctrlcase" class="btn" type="button" id="next" value="下一页" >&nbsp;&nbsp;&nbsp;
								<input name="ctrlcase" class="btn" type="button" value="尾页">
								
								<c:forEach begin="1" end="${pageBean.totalPage}" var="p">
									<a href="javascript:goPage(${p})">${p}</a>&nbsp;&nbsp;
								</c:forEach>
								
								<select id="selPage" >
									
								</select>
								<input type="text"><input type="button" value="go">
							</td>
						</tr>
						
					</table>
				</form></td>
		</tr>
	</table>
</body>
</html>
