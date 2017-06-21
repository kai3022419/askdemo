<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>增加新分类</title>
<base href="${base}/" />
<link href="css/admin/admincp.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td><div
					style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
					<div style="float:left;">
						<a href="admin/index.jsp" target="main"><b>控制面板首页</b> </a>&nbsp;&raquo;&nbsp;增加新类别
					</div>
				</div>
				<form action="category" method="post" id="form1">
					<input type="hidden" name="opr" value="add">
					<table cellspacing="1" cellpadding="4" width="60%" align="center"
						class="tableborder">
						<tr>
							<td class="altbg1" width="15%"><b>类别名称:</b></td>
							<td class="altbg2"><input type="text" name="name" id="cname"
								size="20" />${msg} <span id="cnamemsg" class="input_desc">请输入3到10个字符</span>
							</td>
							<td><input type="submit" class="button" name="submit"
								value="提 交">&nbsp;&nbsp; <input type="button"
								class="button" name="cancel" value="取消" onclick="history.go(-1)">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
