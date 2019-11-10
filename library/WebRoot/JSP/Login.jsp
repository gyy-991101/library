<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  <link rel="stylesheet" href="css/style.css" type="text/css"></link>
  </head>
  
 <body>
	<h1>图书管理系统</h1>
	<div class="container w3layouts agileits">
<form action="/library/servlet/LoginServlet" method="post">
		<div class="login w3layouts agileits">
			<h2>登录</h2>
				<input type="text" name="Username" id="Username" placeholder="用户名" >
				<input type="password" name="Password" id="Password" placeholder="密码" >
				<input type="test" name="background" id="background" value="background" hidden="true" >
			<ul class="tick w3layouts agileits">
				<li>
					<input type="checkbox" id="brand1" value="">
					<label for="brand1"><span></span>记住我</label>
				</li>
			</ul>
			<div class="send-button w3layouts agileits">
					<input type="submit" value="登录">
			</div>
		</div>
			</form>
	</div>

	<div class="footer w3layouts agileits">
		<p> &copy; 2017广东信息科技培训学院版权所有</p>
	</div>
<script type="text/javascript">

</script>
</body>
</html>
