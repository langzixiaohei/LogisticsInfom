<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@include file="/QIANTAI/common/head.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
	
<body>
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="index.jsp">前往首页</a><i>|</i></li>
				<li>登陆</li>
			</ul>
		</div>
	</div>
	<div class="login">
		<div class="container">
			<h6>Login</h6>
			<h3>欢迎登陆物流信息管理平台|<span style="color: #FF0000">${cuowu}</span></h3>
			<form action="${pageContext.request.contextPath }/user/login" method="post">
				<input type="text" name="usercode" value="User Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'User Name';}">
				<input type="password" name="password" class="lock" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
				<div class="remember">
					 <div class="w3agile_checkbox1">					
						   <label class="checkbox"><input type="checkbox" name="Checkbox" checked=""><i> </i>记住密码</label>
						 
					 </div>
					<div class="clearfix"> </div>
				</div>
				<input style="background-color: #1A5CC6" type="submit" value="登    录">
			</form>
	
		</div>
	</div>
<script src="js/bootstrap.js"></script>
</body>
</html>