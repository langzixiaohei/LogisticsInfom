<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mail Us</title>

<%@include file="/QIANTAI/common/head.jsp" %>
<script src="${pageContext.request.contextPath }/QIANTAI/layer/layer.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
	
<body>

<!-- banner1 -->

	<div class="services-breadcrumb">
		<div class="container">
			<ul>
				<li><a href="${pageContext.request.contextPath }/QIANTAI/index.jsp">前往首页</a><i>|</i></li>
				<li>在线邮寄</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->

	<div class="typo" style="margin-left: 430px">
		<div class="container">
			<h3 class="title btn btn-info" onclick="addshow();">在线邮寄</h3>
	
		</div>
	</div>


<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/user/addorder" id="addExamForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建订单</h4>
                </div>
               <div class="modal-body">             
                  <div class="form-group">
                        <label for="examname">寄件人名称：</label>
                        <input type="text" name="realname" id="realname" class="form-control"  disabled="disabled" value="${sessionScope.user.realName}"/>
                  </div>
                  <div class="form-group">
                        <label for="examtime">寄件人电话：</label>
                        <input type="text" name="phone" id="phone" class="form-control" disabled="disabled" value="${sessionScope.user.phone}"/>
                  </div>
                     <div class="form-group">
                        <label for="examtime">货物名称：</label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="请输入货物名称"/>
                  </div>
                       <div class="form-group">
                        <label for="examtime">货物规格：</label>
                        <input type="text" name="weight" id="weight" class="form-control" placeholder="请输入质量,保留小数点后两位"/>
                  </div>
                     <div class="form-group">
                        <label for="examtime">寄件地址：</label>
                        <input type="text" name="useraddress" id="useraddress" class="form-control" placeholder="请输入寄件地址"/>
                  </div>
                     <div class="form-group">
                        <label for="examtime">收件地址：</label>
                        <input type="text" name="linkaddress" id="linkaddress" class="form-control" placeholder="请输入寄件地址"/>
                  </div>
                           <div class="form-group">
                        <label for="examtime">收件人姓名：</label>
                        <input type="text" name="shouname" id="shouname" class="form-control" placeholder="请输入收件人姓名"/>
                  </div>
                     <div class="form-group">
                        <label for="examtime">收件人电话：</label>
                        <input type="text" name="phoneshou" id="phoneshou" class="form-control" placeholder="请输入收件人电话"/>
                  </div>
                     <div class="form-group">
                        <label for="examtime">订单状态：</label>
                        <input type="text" name="stauts" id="stauts" disabled="disabled" value="未支付" class="form-control"/>
                  </div>
             
                <div class="modal-footer">
                	<span id="returnMessage" class="glyphicon"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
                    <button type="button" id="addExamRecord"  onclick="addorder();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>


<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/QIANTAI/gnjs/zaixianyouji.js"></script>
	<script>
		var contextPath="${pageContext.request.contextPath}";	
		var userid="${sessionScope.user.id}";	
	</script>
	<script>
		function addshow(){		
		$("#addModal").modal("show");		
	   }
 	
 	function addorder(){
 		var userid1="${sessionScope.user.id}";
		var realname = $("#realname").val();
		var phone = $("#phone").val();	
		var name = $("#name").val();
		var useraddress = $("#useraddress").val();
		var linkaddress = $("#linkaddress").val();			
		var phoneshou = $("#phoneshou").val();
		var weight = $("#addModal #weight").val();
		var shouname = $("#addModal #shouname").val();		
	 	 $.ajax({
			type: "POST",
			url:contextPath+"/user/addorder",			
			data: {"realname":realname,"phone":phone,"phoneshou":phoneshou,"name":name,"shouname":shouname,"weight":weight,"useraddress":useraddress,"linkaddress":linkaddress,"phoneshou":phoneshou,"userid1":userid1},
			dataType: "json",

			success: function(req){
		      if(req){					  									
				 layer.open({
	                content: "订单已创建",
	                btn: ['前往支付', '留在本页'],
	                offset:320,
	                yes: function(index, layero) {
	                    window.location.href=contextPath+"/user/getbyorder?userid="+userid;
	                },
	                btn2: function(index, layero) {
						
	                },
	                cancel: function(){
	                    //右上角关闭回调
	                }
	            });	
				    
				}else{					
					layer.msg("创建订单失败",{offset : 320,icon: 2});
					$("#addModal").modal("hide");	
				}  
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		});  
		
	} 
 	
 	
	</script>
<!-- //for bootstrap working -->
</body>
</html>