<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'statistics.jsp' starting page</title>
    
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
   <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
   <script type="text/javascript" src="JS/jquery-1.8.2.min.js"></script>
   <script type="text/javascript" src="JS/highcharts.js"></script>
   <script type="text/javascript" src="JS/data.js"></script>
   <script type="text/javascript" src="JS/drilldown.js"></script>
   <script type="text/javascript">
   $(function () {
  $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/Statistics",
        dataType:"json",  
         success:function(data){
      $.ajax({  
        type:"post",//请求方式  
        url:"<%=request.getContextPath()%>/servlet/StatisticsServlet",
        dataType:"json",  
         success:function(data2){
         Highcharts.chart("container", 
         {
        chart: {
            type:"column"
        },
        title: {
            text: '图书报表'
        },
        subtitle: {
            text: '点击可查看具体的版本数据，数据来源'
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {
            title: {
                text: '书本数量'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true,
                    //format: '{point.y:.1f}'
                }
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
            pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b><br/>'
        },
        series: [{
            name: '返回',
            colorByPoint: true,
            data:data.data
        }],   
        drilldown: 
        {
            series:data2
        }
    });
         }})
                 } });
   
});
   </script>
  </body>
</html>
