<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>类别管理</title>
<base href="${base}/">
<link href="css/admin/admincp.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
	$(function(){
		$("#addcategory").click(function(){
			location.href="admin/category_add.jsp";
		});
	});
</script>
</head>

<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td>
				<div style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
					<div style="float:left;">
						<a href="" target="main"><b>控制面板首页</b> </a>&nbsp;&raquo;&nbsp;类别管理
					</div>
				</div>
				<form name="userForm" action="" method="post">
					<table width="80%" border="0" cellpadding="4" cellspacing="1"
						class="tableborder" align="center">
						<tr class="header">
							<td width="10%"><input class="checkbox" id="chkall"
								onclick="" type="checkbox" name="chkall"><label
								for="chkall">全选</label>
							</td>
							<td width="20%">类别名称</td>
							<td width="20%">问题数量</td>
							<td width="10%">操作</td>
						</tr>
						<c:forEach items="${categories}" var="category">
							<tr>
								<td class="altbg2"><input class="checkbox" type="checkbox"
									value="${category.id}" name="ids">
								</td>
								<td class="altbg2"><strong>${category.name}</strong>
								</td>
								<td class="altbg2"><strong>${category.quesNums}</strong>
								</td>
								<td class="altbg2"><a>修改</a>&nbsp;&nbsp;<a>删除</a>
								</td>
							</tr>
							</c:forEach>
						<tr>
							<td colspan="4" class="altbg1" align="center"><input
								class="button" type="button" name="addcategory" id="addcategory"
								value="增加新分类" />&nbsp;&nbsp;<input class="button" type="button"
								name="delete" id="delete" value="删除" />
							</td>
						</tr>
					</table>
				</form></td>
		</tr>
	</table>
</body>
</html>