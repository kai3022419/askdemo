<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>提出问题</title>
<base href="${base}/" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="header">
		<c:import url="header.jsp" />
	</div>
	<div class="content">
		<div class="dh" id="pos">
			<a href="">问答平台首页</a>&gt; 提问问题
		</div>
		<div class="left1">
			<div class="leftt">
				<ul>
					<li class="a1"></li>
					<li class="a2"><div class="juzhong">提问问题</div></li>
					<li class="a3"></li>
				</ul>
			</div>
			<div class="clr"></div>
			<div class="leftc">
				<div class="tw_t">请将您的问题告诉我们:</div>
				<div class="askfgx"></div>
				<form name="askform" onsubmit="" action="question" method="post">
					<input type="hidden" name="opr" value="add" />
					<div class="tiwen">
						<div class="shur1">
							<h2>您的问题:</h2>
							<input type="text" maxlength="100" size="65" name="title"
								value="" id="mytitle" class="input1" />
						</div>
						<div class="clr"></div>
						<div class="shur1">
							<h2>问题描述:</h2>
							<script type="text/plain" id="mydescription" name="content"
								style="width:550px;margin-left:75px;display:block;"></script>
							<script type="text/javascript">
								var option = {
									toolbars : [ [ 'fullscreen', 'source', '|',
											'undo', 'redo', '|', 'bold',
											'italic', 'underline',
											'fontborder', 'strikethrough',
											'superscript', 'subscript',
											'removeformat', 'formatmatch',
											'autotypeset', 'blockquote',
											'pasteplain', '|', 'forecolor',
											'backcolor', 'insertorderedlist',
											'insertunorderedlist', 'selectall',
											'cleardoc', '|', 'rowspacingtop',
											'rowspacingbottom', 'lineheight',
											'|', 'customstyle', 'paragraph',
											'fontfamily', 'fontsize', '|',
											'directionalityltr',
											'directionalityrtl', 'indent', '|',
											'justifyleft', 'justifycenter',
											'justifyright', 'justifyjustify',
											'|', 'touppercase', 'tolowercase',
											'|', 'link', 'unlink', 'anchor',
											'|', 'imagenone', 'imageleft',
											'imageright', 'imagecenter', '|',
											'insertimage', 'emotion', 'scrawl',
											'insertvideo', 'music',
											'attachment', 'map', 'gmap',
											'insertframe', 'insertcode',
											'webapp', 'pagebreak', 'template',
											'background', '|', 'horizontal' ] ],
									initialFrameWidth : 550,
									initialFrameHeight : 300

								};
								var mycontent = new baidu.editor.ui.Editor(
										option);
								mycontent.render("mydescription");
							</script>
						</div>
						<div class="clr"></div>
						<div class="shur shur3">
							<h2>问题分类</h2>
							<div id="classnav" name="classnav">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr valign="top">
										<td width="15%" id="catesSelect"><select id="ClassLevel1"
											class="catselect2" size="8" name="cateId">
											<c:forEach items="${categories}" var="category">
												<option value="${category.id}">${category.name}</option>
											</c:forEach>
										</select></td>
									</tr>
									<tr valign="top">
										<td class="tiw_biaozhu" align="left" valign="middle">请您选择正确的分类，以使您的问题尽快得到解答。</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clr"></div>
						<div class="asksubmit">
							<button name="submit" type="submit" class="btn_addques"></button>
						</div>
						<div class="clr"></div>
					</div>
				</form>
			</div>
			<div class="clr"></div>
			<div class="leftb"></div>
		</div>
		<div class="right1">
			<div class="gg">
				<div class="ggtitle">
					<ul>
						<li class="gga1"></li>
						<li class="gga2">
							<div class="juzhong">
								<div class="qico">
									<div class="irelate"></div>
								</div>
								别人都在问什么
							</div>
						</li>
						<li class="gga3"></li>
					</ul>
				</div>
				<div class="clr"></div>
				<div class="ggcon">
					<ul>
						<li><a title="招人！求推荐！" target="_blank" href="">招人！求推荐！</a></li>
						<li><a title="不晓得现在学习Oracle有前途吗？我有此打算，大家有兴趣吗？一起"
							target="_blank" href="">不晓得现在学习Oracle有前 ...</a></li>
						<li><a title="最近想学习一下php，请给个建议" target="_blank" href="">最近想学习一下php，请给...</a>
						</li>
						<li><a title="这个问题不好问" target="_blank" href="">这个问题不好问</a></li>
						<li><a title="以下代码有问题吗" target="_blank" href="">以下代码有问题吗</a>
						</li>
					</ul>
				</div>
				<div class="ggbuttom">
					<ul>
						<li class="ggba1"></li>
						<li class="ggba2"></li>
						<li class="ggba3"></li>
					</ul>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</div>
	<div class="clr"></div>
	<!--footer-->
	<div class="footer">
		<c:import url="footer.jsp"></c:import>
	</div>
</body>
</html>