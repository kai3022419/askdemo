<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台管理</title>
<base href="${base}/" />
<link href="css/admin/admin_m.css" type="text/css" rel="stylesheet">
<script type=text/javascript>
	function setTab(name, cursel, n) {
		for ( var i = 1; i <= n; i++) {
			var menu = document.getElementById(name + i);
			var con = document.getElementById("con_" + name + "_" + i);
			menu.className = i == cursel ? "navon" : "";
			con.style.display = i == cursel ? "block" : "none";
		}
	}
</script>
</head>

<body>
	<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
		<TR>
			<TD vAlign="top" colSpan="2" height="80">
				<DIV id="header">
					<DIV class="logo fl">
						<DIV class="png">
							<img height="43" alt="" src="css/default/logo.jpg" width="160">
						</DIV>
						<DIV class="lun">
							<font size="3" color="#E68319">问答平台1.0</font>
						</DIV>
					</DIV>

					<!--大导航 -->
					<UL class="nav">
						<LI class="navon" id="nav1" onclick="setTab('nav',1,2)"><EM><A
								href="javascript:return false;">用户管理</A> </EM></LI>
						<LI id="nav2" onclick="setTab('nav',2,2)"><EM><A
								href="javascript:return false;">内容管理</A> </EM></LI>
					</UL>

					<!--头部信息导航-->
					<DIV class="wei fl">
						用户名：admin（<A href="login.jsp">退出</A>）&nbsp;|&nbsp; <A href="admin"
							target="main">控制面板首页</A> &nbsp;|&nbsp; <A class="s0"
							style="CURSOR: pointer" href="" target="_blank">访问网站首页</A>
						&nbsp;|&nbsp; <A title=后退到前一页 style="CURSOR: pointer"
							onclick="history.go(-1)">后退一页</A> &nbsp;
					</DIV>
					<!--头部信息导航结束-->
				</DIV>
			</TD>
		</TR>
		<TR>
			<TD id="main-fl" vAlign="top">
				<DIV id="left">
					<DIV id="con_nav_1" style="DISPLAY: display">
						<H1>用户管理</H1>
						<DIV class=cc></DIV>
						<ul>
							<li><a href="<c:url value='AdminServlet?opr=findAll'/>" target="main">用户管理</a></li>
						</ul>
					</DIV>
					<DIV id="con_nav_2" style="display: none">
						<H1>内容管理</H1>
						<DIV class=cc></DIV>
						<ul>
							<li><a href="admin/category_list.jsp" target="main">分类管理</a></li>
							<li><a href="admin/question_list.jsp" target="main">问题管理</a></li>
							</li>
						</ul>
					</DIV>
				</DIV> <!--end left-->
			</TD>
			<TD id="mainright" style="HEIGHT: 94%" vAlign="top"><br> <IFRAME
					style="OVERFLOW: visible" name="main" src="admin/welcome.jsp"
					frameBorder=0 width="100%" scrolling="yes" height="100%"></IFRAME>
				<br></TD>
		</TR>
	</TABLE>
</body>
</html>