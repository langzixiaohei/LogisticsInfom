<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/jquery/jquery-1.7.1.js"></script>
<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/HOUTAI/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/artDialog/artDialog.js?skin=default"></script>




<link href="${pageContext.request.contextPath }/HOUTAI/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/HOUTAI/css/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/js/jquery-2.1.4.min.js"></script>

<title>物流管理系统</title>
<script type="text/javascript">		
	  
	/** 系统根目录  **/
	var path = "${pageContext.request.contextPath }";
	
	function search(){
	//得到订单号
      var ordernumber1=$("#ordernumber1").val();
      var creattime1=$("#creattime1").val();
		$("#submitForm").attr("action", path+"/admin/getlistorder?ordernumber="+ordernumber1+"&creattime="+creattime1).submit();
	}
		
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="post">
		
		<div id="container">

			<div class="ui_content">
			<div class="ui_text_indent">
					<div id="box_border">
						<div id="box_top">搜索</div>
						<div id="box_center">					
						订单号:&nbsp;&nbsp;<input type="text" id="ordernumber1" name="ordernumber1" style="height: 30px;margin-top: 10px;" class="ui_input_txt02" />
						创建时间:&nbsp;&nbsp;<input type="text" id="creattime1" name="creattime1" style="height: 30px;margin-top: 10px;"/>
						</div>
						<div id="box_bottom">
							<input type="button" value="查询" class="ui_input_btn01" onclick="search();" /> 
						</div>
					</div>
				</div>
				<div class="ui_tb">				
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th>寄件人姓名</th>
							<th>收件人姓名</th>
							<th>货物名称</th>				
						    <th>订单状态</th>	
						    <th>司机姓名</th>	
						    <th>车牌号</th>							    
						    <th>运输费用</th>
						</tr>	
						<c:forEach var="order" items="${sessionScope.orders}">
							<tr>
								<td>${order.jiname }</td>
								<td>${order.shouname}</td>
								<td>${order.goodname}</td>
								<td>${order.stauts}</td>
								<td>${order.drivername}</td>
								<td>${order.trucknub}</td>
								<td>${order.money}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			
			</div>
		</div>
	</form>

</body>
	<script src="${pageContext.request.contextPath }/HOUTAI/js/bootstrap.js"></script>
</html>
