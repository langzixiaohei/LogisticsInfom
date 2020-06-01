<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mail Us</title>

<%@include file="/QIANTAI/common/head.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
	
<body>

<!-- banner1 -->

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/QIANTAI/index.jsp">前往首页</a><i>|</i></li>
				<li>个人信息</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- mail -->
	<div class="mail">
		<div class="container">				
			<div class="col-md-4 wthree_contact_left">
				<h4>我的信息</h4>
				<p>钱包余额
					<span>${sessionScope.user.wallet }</span></p>
				<ul>
					<li><span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span> 用户名 :${sessionScope.user.realName }</li>
					<li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 联系电话 :${sessionScope.user.phone }</li>
				</ul>
			</div>
			<div class="col-md-8 wthree_contact_left">
				<h4>修改我的信息${error }</h4>
				<form action="${pageContext.request.contextPath }/user/updateuser" method="post">
				<input type="hidden" name="id" value="${sessionScope.user.id }">
					<div class="col-md-6 wthree_contact_left_grid">
					
						<input type="text" name="realname" value="${sessionScope.user.realName }" >
						<input type="text" name="phone" placeholder="请输入手机号" value="">
					</div>
					<div class="col-md-6 wthree_contact_left_grid">
						<input type="text" name="password" placeholder="请输入密码，无需修改可以不用填写" >
						<input type="text" name="password" placeholder="请确认密码" >
					</div>
					<div class="clearfix" style="margin: 20px;"> </div>
					<input type="submit" value="提交">
					<input type="reset" value="清除">
				</form>
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
<!-- //mail -->

<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
</html>