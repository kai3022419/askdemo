<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE HTML>
<html>
<head>
<title>提出问题</title>
<base href="${base}/" />
<link rel="shortcut icon" href="ask.ico" />
<link href="css/default/ask.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
<link rel="stylesheet" href="ueditor/themes/default/css/ueditor.css" />
<script type="text/javascript" src="js/lhgdialog.js"></script>
<script type="text/javascript">
/* 	window.onload = function(){
		var mytitle = document.getElementById("mytitle");
		mytitle.onblur= check_title();
		
		var description = document.getElementById("description");
		description.onblur= check_description();
		
		var file = document.getElementById("file");
		file.onchange = check_file();
	} */
	
	
	function check_title(){
			var mytitletip = document.getElementById("mytitletip");
			var mytitle = document.getElementById("mytitle");
			if(mytitle.value == ""){
				mytitletip.innerHTML = "问题不能为空";
				mytitletip.setAttribute("class","input_error");
				return false;
			}else{
				mytitletip.innerHTML = "";
				mytitletip.setAttribute("class","input_ok");
				return true;
			}
		}
	function check_description(){
			var descriptiontip = document.getElementById("descriptiontip");
			var description = document.getElementById("description");
			if(description.value.length<10){
				descriptiontip.innerHTML = "问题描述不能小于10个字符";
				descriptiontip.setAttribute("class","input_error");
				return false;
			}else{
				descriptiontip.innerHTML = "";
				descriptiontip.setAttribute("class","input_ok");
				return true;
			}
		}
	function check_file(){
			var file = document.getElementById("file");
			var filetip = document.getElementById("filetip");
			var index = file.value.lastIndexOf(".");
			var suffix = file.value.substring(index+1);
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
	
	
	
	function doSubmit(){
		var quesform = document.getElementById("quesform");
		var select = document.getElementById("ClassLevel1");
    	var selecttip = document.getElementById("ClassLevel1tip");
		if(check_title()&&check_description()&&check_file()){
			alert(select.value);
			if(select.value!=null){
				quesform.submit();
			}else{
				selecttip.innerHTML = "请选择问题分类";
				selecttip.setAttribute("class","input_error");
			}
		}
	}
</script>
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
				<form id="quesform" action="QuestionServlet" method="post" enctype="multipart/form-data">
					<input type="hidden" name="opr" value="add" />
					<div class="tiwen">
						<div class="shur1">
							<h2>您的问题:</h2>
							<input type="text" maxlength="100" size="65" name="title"
								value="" id="mytitle" class="input1" onblur="check_title();"/>
								<br/><span id="mytitletip" ></span>
						</div>
						<div class="clr"></div>
						<div class="shur1">
							<h2>问题描述:</h2>
							<script type="text/plain" id="mydescription" name="content"
								style="width:550px;margin-left:75px;display:block;"></script>
							<textarea rows="15" cols="76" name="content" id="description" onblur="check_description();"></textarea>
							<br/><span id="descriptiontip" ></span>
							
							<br/><h2>选择图片:</h2><input type="file" name="file" id="file" onchange ="check_file();"/>
							<br/><span id="filetip" ></span>
						</div>
						<div class="clr"></div>
						<div class="shur shur3">
							<h2>问题分类</h2>
							<div id="classnav" name="classnav">
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
									<tr valign="top">
										<td width="15%" id="catesSelect"><select id="ClassLevel1"
											class="catselect2" size="8" name="cateId">
											<c:forEach items="${sessionScope.categories }" var="category">
												<c:choose>
													<c:when test="${category.p_cid eq null }">
														<option value="" disabled="disabled">---${category.cname }---</option>
													</c:when>
													<c:otherwise>
														<option value="${category.cid };${category.cname }">${category.cname }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select></td>
									</tr>
									<br/><span id="ClassLevel1tip" ></span>
									<tr valign="top">
										<td class="tiw_biaozhu" align="left" valign="middle">请您选择正确的分类，以使您的问题尽快得到解答。</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="clr"></div>
						<div class="asksubmit">
							<input name="Submit" type="button" id="addquestion"
								class="btn_addques" onclick="doSubmit();"/>
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