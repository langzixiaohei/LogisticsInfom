<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>About Us</title>
<!-- for-mobile-apps -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.4.min.js"></script>
<!-- Stats-Number-Scroller-Animation-JavaScript -->
	<script src="${pageContext.request.contextPath }/js/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/counterup.min.js"></script>
	
	<script>
		jQuery(document).ready(function( $ ) {
			$('.counter').counterUp({
				delay: 10,
				time: 1000
			});
		});
	</script>

<link  rel='stylesheet' type='text/css'>
</head>
	
<body>
<!-- header -->
	<div class="clearfix"> </div><div class="header">
		<div class="container">
			<div class="w3l_header_left"> 
			<ul>
					<li>商贸流通综合服务平台</li>
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
					<li><a href="${pageContext.request.contextPath }/QIANTAI/login.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>登陆</a></li>
					<li><a href="${pageContext.request.contextPath }/QIANTAI/sign-up.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>注册</a></li>
				</ul>
				</c:otherwise>
				</c:choose>
			</div>
			
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
						<h1><a class="navbar-brand" href="index.jsp">Truc<span>k</span>age</a></h1>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="link-effect-2" id="link-effect-2">
						<ul class="nav navbar-nav">
							<li><a href="${pageContext.request.contextPath }/QIANTAI/index.jsp"><span data-hover="Home">首页</span></a></li>
							<li ><a href="${pageContext.request.contextPath}/user/wuliuxx"><span data-hover="Order">物流节点查询</span></a></li>
							<c:if test="${sessionScope.user != null}">
								<li ><a href="${pageContext.request.contextPath }/user/getbyorder?userid=${sessionScope.user.id}"><span data-hover="Order">订单管理</span></a></li>							
							</c:if>
							<li><a href="${pageContext.request.contextPath }/QIANTAI/zaixianyouji.jsp"><span data-hover="Short Codes">在线订单</span></a></li>
							<li><a href="#" onclick="aaa();"><span data-hover="Short Codes">时效价格查询</span></a></li>
							<li><a href="${pageContext.request.contextPath }/QIANTAI/mail.jsp"><span data-hover="message">个人空间</span></a></li>	
							<li><a href="${pageContext.request.contextPath }/user/logout"><span data-hover="out">退出注销</span></a></li>
						</ul>
					</nav>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
	</div>
<!-- //header -->
    <div class="banner1">
		<div class="container">
		</div>
	</div>

<div class="modal fade" id="addModal123" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/user/addorder"   id="addExamForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">时效价格查询</h4>
                </div>
               <div class="modal-body">                             
                     <div class="form-group">
                        <label for="examtime">请输入寄件地址：</label>
                        <input type="text" name="jihuodizhi" id="jihuodizhi" class="form-control"/>
                  </div>
                    <div class="form-group">
                        <label for="examtime">请输入收货地址：</label>
                        <input type="text" name="shouhuodizhi" id="shouhuodizhi"  class="form-control"/>
                  </div>
                   <div class="form-group">
                        <label for="examtime">请输入货物重量：</label>
                        <input type="text" name="huowuzhongliang" id="huowuzhongliang"  class="form-control"/>
                  </div>
             
                <div class="modal-footer">
                	<span id="returnMessage" class="glyphicon"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
                    <button type="button" id="addExamRecord"  onclick="addorder123();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">

	var contextPath="${pageContext.request.contextPath}";

	function aaa(){
		$("#addModal123").modal("show");
	}
	function addorder123(){
		var jihuodizhi = $("#addModal123 #jihuodizhi").val();
		var shouhuodizhi = $("#addModal123 #shouhuodizhi").val();
		var huowuzhongliang = $("#addModal123 #huowuzhongliang").val();		
	 	 $.ajax({
			type: "POST",
			url:contextPath+"/user/shixiao",			
			data: {"jihuodizhi":jihuodizhi,"shouhuodizhi":shouhuodizhi,"huowuzhongliang":huowuzhongliang},
			dataType: "json",
			success: function(req){
		      if(req){					  									
				alert("配送范围：省内      配送价格：15     预计完成时间：一天");	
				$("#addModal123").modal("hide");	
				}else{					
					
					alert("配送范围：省外      配送价格：30       预计完成时间：两天");	
					$("#addModal123").modal("hide");	
				}  
			},
			error: function(data){
				alert("请求错误");
					$("#addModal").modal("hide");	
			} 
		});  
		
	} 
</script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
</body>
</html>