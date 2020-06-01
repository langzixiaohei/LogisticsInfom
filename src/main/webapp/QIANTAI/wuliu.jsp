<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>物流订单</title>
<%@include file="/QIANTAI/common/head.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	#div1>div{
		float: left;
		margin: 20px;		
	}

</style>
	<%--<script>--%>
        <%--$(window).load(function() {--%>
            <%--$.ajax({--%>
                <%--type:"post",--%>
                <%--url:"${pageContext.request.contextPath }/user/wuliuxx",--%>
                <%--success: function(data) {--%>

                <%--}--%>
            <%--});--%>
		<%--});--%>
	<%--</script>--%>
</head>
	
<body>

<!-- banner1 -->
	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/QIANTAI/index.jsp">前往首页</a><i>|</i></li>
				<li>物流网点查询</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

<!-- about -->
	<div class="about">
		<div class="container row">
		
		
		<div  id="div1" style="margin-left: 50px;" class="filter-row clearfix">
          
         <c:forEach  var="wangdian"  items="${wangdians}" >
         <div class="outlet-item">
                        <h4 class="outlet-title"><a target="_blank">${wangdian.wdName}</a>
                        </h4>
          <p class="outlet-summary">地址：${wangdian.diZhi}<br>联系电话：${wangdian.phone}<br>派送区域：${wangdian.fanWei}  业务范围：收发货</p>
          <div>首重2KG,多出每千克5元</div>
        </div>
        </c:forEach> 
        </div>
		</div>
	</div>

<!-- for bootstrap working -->
	<script src="/QIANTAI/js/bootstrap.js"></script>
<!-- //for bootstrap working -->

</body>
</html>