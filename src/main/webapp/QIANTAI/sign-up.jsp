<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<%@include file="/QIANTAI/common/head.jsp" %>
<script src="/QIANTAI/layer/layer.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style >
#adduser{
	background: #90EE90;
    color: #FFF;
    font-size: 1em;
    padding:10px 0;
    width: 100%;
    outline: none;
	border:none;
}
</style>
</head>
	
<body>
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/QIANTAI/index.jsp">前往首页</a><i>|</i></li>
				<li>注册</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- sign-up -->
	<div class="login">
		<div class="container">
			<h6 style="color: #FA8072">新用户注册</h6>
			<h3></h3>

			<form action="${pageContext.request.contextPath }/user/insert" id="addForm" method="post">
				<input type="text" id="usercode" name="usercode" placeholder="请输入用户名" >
				<input type="text" id="realname" name="realname" placeholder="请输入真实姓名" >
				<input type="text" id="password" name="password" class="lock" placeholder="请输入密码">
				<input type="text" id="phone" name="phone" class="lock" placeholder="请输入电话">
				<input type="button" onclick="adduser1()" id="adduser" value="提   交">
			</form>
			
		</div>
	</div>
	<script src="js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/QIANTAI/gnjs/sign-up.js"></script>
	<script>
		var contextPath="${pageContext.request.contextPath}";		
	</script>

</body>

</html>