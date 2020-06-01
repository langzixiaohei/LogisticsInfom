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
		

	
	/** 订单调度 **/
	function show(id){
	
			var odid=$("#updateModal #odid").val(id);
			$("#updateModal").modal("show");
	}	
	
	/** 订单调度 **/
	function diaodu(id){
		 $.ajax({
			type: "POST",
			url:contextPath+"/admin/orderdiaodu",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
		   			if(req){
		   			  alert("分配成功");
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
							<th>寄件人姓名</th>
							<th>收件人姓名</th>
							<th>货物名称</th>				
						    <th>订单状态</th>										    
						    <th>运输费用</th>
						    <th>操作</th>
						</tr>	
						<c:forEach var="order" items="${sessionScope.ordersdiaodu}">
							<tr>
								<td>${order.jiname }</td>
								<td>${order.shouname }</td>
								<td>${order.goodname }</td>
								<td>${order.stauts}</td>
								<td>${order.money}</td>
								<c:choose>
									<c:when test="${order.truckId ==null}">I
										<td>	
											<a href="javascript:show(${order.id});" class="edit">订单调度</a> 				    
										</td>
									</c:when>
									<c:otherwise>
										<td>	
											<a href="#" class="edit">路线已规划</a> 				    
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</table>
				</div>
			
			</div>
		</div>
	</form>


<!-- 模型 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/admin/dingdanpeizhi" id="addExamForm">             
                <input type="hidden" name="id" id="odid">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">订单调度</h4>
                </div>
               <div class="modal-body">                            
                  <div class="form-group">
                  		<label>配置司机</label>
                       <select name="sijiid">
                       <c:forEach var="driver" items="${sessionScope.drivers }">
                       		<option value="${driver.id}">${driver.driverName}</option>
                       	</c:forEach>
                       </select>
                  </div>
                <div class="form-group">
               				 <label>配置运输车辆</label>
                       <select name="kacheid">
                       <c:forEach var="truck" items="${sessionScope.trucks }">
                       		<option value="${truck.id}">${truck.truckNumber}</option>
                       	</c:forEach>
                       </select>
                  </div>
<%--                   
                    <div class="form-group">
                    	<label>开始配送地址</label>
                       <select name="kaishi">
                       <c:forEach var="wangdian" items="${sessionScope.wangdians}">
                       		<option value="${wangdian.id}">${wangdian.wdname}</option>
                       	</c:forEach>
                       </select>
                  </div>
                  
                    <div class="form-group">
                   	  <label>货物到达地址</label>
                       <select name="jieshu">
                       <c:forEach var="wangdian" items="${sessionScope.wangdians}">
                       		<option value="${wangdian.id}">${wangdian.wdname}</option>
                       	</c:forEach>
                       </select>
                  </div> --%>

                <div class="modal-footer">
                	<span id="returnMessage" class="glyphicon"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
                    <button type="submit"   class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

</body>
	<script src="${pageContext.request.contextPath }/HOUTAI/js/bootstrap.js"></script>
</html>
