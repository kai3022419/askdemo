<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>类别管理</title>
<base href="${base}">  
<link href="css/admin/admincp.css" rel="stylesheet" type="text/css" />
<scrip t type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
var selCate=[];
$(function(){
	$(":radio").on("click",function(){
		var id=$(this).val();
		var name=$(this).parent().next().find("strong").html();
		alert(id+"="+name);
		selCate[0]=id;
		selCate[1]=name;
	});
});
</script>
</head>

<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td>
				<div style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
				</div>
					<table width="80%" border="0" cellpadding="4" cellspacing="1"
						class="tableborder" align="center">
						<tr class="header">
							<td width="10%"></label>
							</td>
							<td width="20%">类别名称</td>
							<td width="20%">问题数量</td>
						</tr>
						<c:forEach items="${categories}" var="category">
							<tr>
								<td class="altbg2"><input class="checkbox" type="radio"
									value="${category.id}" name="ids">
								</td>
								<td class="altbg2"><strong>${category.name}</strong>
								</td>
								<td class="altbg2"><strong>${category.quesNums}</strong>
								</td>
							</tr>
							</c:forEach>
					</table>
				</td>
		</tr>
	</table>
</body>
</html>