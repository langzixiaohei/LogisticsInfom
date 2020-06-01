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
			
	/** 修改**/
	function update(id){
		 $.ajax({
			type: "POST",
			url:path+"/admin/shangpingrukucaozuo",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
		   			if(req){
		   			  alert("已到达收件地址");
		   			  //重新查一次待出库商品
		   			  window.location.href=path+"/admin/shangpingruku";	   			 
		   			}
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		});   
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
			
				<div class="ui_tb">				
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th>商品名称</th>
							<th>商品状态</th>
							<th>商品规格</th>				
						    <th>操作</th>
						</tr>	
						<c:forEach var="good" items="${sessionScope.goodchu}">
							<tr>
								<td>${good.goodName }</td>
								<td>${good.goodStype }</td>
								<td>${good.weight }</td>							
								<td>	
									<a href="javascript:update(${good.id});" class="edit">入库</a> 				    
								</td>
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
