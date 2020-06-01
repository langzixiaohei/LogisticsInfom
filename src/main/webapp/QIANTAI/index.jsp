<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>主页</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="/QIANTAI/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/QIANTAI/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="/QIANTAI/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="/QIANTAI/layer/layer.js"></script>
<script src="/QIANTAI/js/server.js"></script>
<!-- load-more -->
<script>
	$(document).ready(function () {
		size_li = $("#myList li").size();
		x=1;
		$('#myList li:lt('+x+')').show();
		$('#loadMore').click(function () {
			x= (x+1 <= size_li) ? x+1 : size_li;
			$('#myList li:lt('+x+')').show();
		});
		$('#showLess').click(function () {
			x=(x-1<0) ? 1 : x-1;
			$('#myList li').not(':lt('+x+')').hide();
		});
	});
</script>
<!-- //load-more -->
</head>
	
<body>
<!-- header -->
	<div class="header">
		<div class="container">
			<div class="w3l_header_left"> 
				<ul>
					<li>物流信息系统服务平台</li>
				</ul>
			</div>
		
			<div class="w3l_header_right">
				<c:choose>
				<c:when test="${sessionScope.user!=null}">
				<ul>
					<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span>欢迎你：${sessionScope.user.realName}</li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登陆</a></li>
					<li><a href="sign-up.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>注册</a></li>
				</ul>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="clearfix"> </div>
			<script type="text/javascript" src="js/demo.js"></script>
		</div>
	</div>
	<div class="logo_nav">
		<div class="container">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				  </button>
					<div class="logo">
						<h1><a class="navbar-brand" href="index.jsp">liu<span>yj</span>system</a></h1>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp"><span data-hover="进入">首页</span></a></li>
							<li ><a href="${pageContext.request.contextPath }/user/wuliuxx"><span data-hover="&nbsp&nbsp&nbsp&nbsp&nbsp查&nbsp&nbsp&nbsp&nbsp看">物流订单信息</span></a></li>
							<c:if test="${sessionScope.user != null}">						
								<li ><a href="${pageContext.request.contextPath }/user/getbyorder?userid=${sessionScope.user.id}"><span data-hover="&nbsp&nbsp&nbsp&nbsp进 入">订单管理</span></a></li>
							</c:if>
							<li><a href="zaixianyouji.jsp"><span data-hover="点击下单">在线下单</span></a></li>
							<li><a href="mail.jsp"><span data-hover="&nbsp&nbsp&nbsp查  看">我的信息</span></a></li>
							<li><a href="../HOUTAI/login.jsp"><span data-hover="后台系统">登录后台</span></a></li>
						</ul>
					</nav>
				</div>
				
			</nav>
		</div>
	</div>
<!-- //header -->
<!-- banner -->
	<div class="banner">
		<div class="container">
			<div class="w3ls_banner_info">
				<h2>物流信息系统服务平台</h2>
				<p>欢迎访问物流信息系统服务平台</p>
				<div class="wthree_more">
					<a  class="button--wayra button--border-thick button--text-upper button--size-s">全国一流平台</a>
				</div>
			</div>
		</div>
	</div>
<!-- //banner -->

	<script src="/QIANTAI/js/bootstrap.js"></script>

</body>
</html>