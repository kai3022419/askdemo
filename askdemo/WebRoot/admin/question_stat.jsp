<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>问题管理</title>
<link rel="stylesheet" href="css/admin/admin_.css" type="text/css"></link>
<link rel="stylesheet" href="js/skins/default.css" type="text/css"></link>
<script type="text/javascript" src="${base}js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="${base}js/highcharts.js">
</script>
<script type="text/javascript">

$(function(){
	  var chart;
   	// Build the chart
   
   	$.get("../question?opr=statbytype",function(mydata){
   		//alert(mydata);
   		var data=[];
   		for(var key in mydata){
   			var d=[];
   			d.push(key);//alert(key+"=="+mydata[key]);
   			d.push(mydata[key]);
   			data.push(d);
   		}
   		//alert(data);
   	   $('#container').highcharts({
           chart: {
               plotBackgroundColor: null,
               plotBorderWidth: null,
               plotShadow: false
           },
           title: {
               text: '问题类别统计图'
           },
           tooltip: {
       	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           series: [{
               type: 'pie',
               name: '问题百分比',
               data:data
           }]
       });
   	},'json');
   	
    
});
</script>
<body>
	<table width="100%" border="0" cellpadding="2" cellspacing="6">
		<tr>
			<td>
				<div style="width:100%; height:15px;color:#000;margin:0px 0px 10px;">
					<div style="float:left;">
						<a href="" target="main"><b>控制面板首页</b> </a>&nbsp;&raquo;&nbsp;问题管理
					</div>
					<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
				</div>
				</td>
		</tr>
	</table>
</body>
</html>
