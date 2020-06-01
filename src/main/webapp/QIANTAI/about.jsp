<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>About Us</title>
<%@include file="/QIANTAI/common/head.jsp" %>
    <script src="${pageContext.request.contextPath }/QIANTAI/layer/layer.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%--<script>--%>
        <%--$(window).load(function() {--%>
            <%--$.ajax({--%>
                <%--type:"get",--%>
                <%--url:"${pageContext.request.contextPath }/user/getbyorder",--%>
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
				<li>订单管理</li>
			</ul>
		</div>
	</div>
<!-- //banner1 -->
	<div style="padding-top: 30px;padding-left: 80px;">
		<form method="POST" name="myForm" id="myForm">
			请输入订单号:&nbsp;&nbsp;<input type="text"  id="ordernumber" name="ordernumber" >
			<input type="hidden" id="userid1" name="userid1" value="${sessionScope.user.id}">
			<input type="button" class="btn btn-info" style="margin-left: 50px;" onclick="chaxun();" value="查询">
		</form>
	</div>
<!-- about -->
	<div class="about">
		<div class="container row">
       <div style="margin-top: -40px; width: 1210px">
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="panel panel-default" style="width: 1500px;">    
                    <div class="panel-body" style="width: 1500px;">
                        <div class="table-responsive">
                            <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">                              
                                <table class="table table-striped table-bordered table-hover dataTable no-footer"
                                       id="dataTables-example" aria-describedby="dataTables-example_info" >
                                    <thead>
                                    <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example"
                                            rowspan="1" colspan="1" aria-sort="ascending"
                                            aria-label="Rendering engine: activate to sort column ascending"
                                            style="width: 101px;">寄件人
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Browser: activate to sort column ascending"
                                            style="width: 151px;">寄件人电话
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Platform(s): activate to sort column ascending"
                                            style="width: 151px;">寄件人地址
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">收件人名称
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">收件人地址
                                        </th>
                                         <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">订单号
                                        </th>
                                          <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">货物名称
                                        </th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">创建时间
                                        </th>
                                           <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">支付状态
                                        </th> 
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="Engine version: activate to sort column ascending"
                                            style="width: 126px;">运输状态
                                        </th> 
                                                                              
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1"
                                            colspan="1" aria-label="CSS grade: activate to sort column ascending"
                                            style="width: 187px;">操作
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="order" items="${requestScope.orders}">
                                    <tr class="gradeA odd">
                                        <td class="sorting_1">${order.jiname }</td>
                                        <td class=" ">${order.jiphone }</td>
                                        <td class=" ">${order.userAddress }</td>
                                        <td class="center ">${order.shouname }</td> 
                                        <td class="center ">${order.linkAddress }</td>
                                        <td class="center ">${order.orderNumber }</td>
                                        <td class="center ">${order.goodname }</td>
                                        <td class="center ">${order.createTime}</td>
                                        <c:choose>
                                        	<c:when test="${order.payType ==0}">
                                        	<td class="center" style="color: #FF0000">未支付</td>  
                                        	</c:when>
                                        	<c:otherwise>
                                        	<td class="center" style="color:#00FF00">已支付</td>  
                                        	</c:otherwise>
                                        </c:choose>    
                                        <td class="center ">${order.stauts}</td>                                  
                                        <td class="center " style="width: 500px;">
                                     
                                            <button type="button" class="btn btn-info" onclick="getby(${order.id})">查看详情<span
                                                    class="glyphicon glyphicon-edit"></span> 
                                            </button>
                                   
                                            <button type="button" class="btn btn-danger" onclick="update(${order.id})" >异常上报<span
                                                    class="glyphicon glyphicon-edit"></span> 
                                            </button> 
                                            <c:choose>
	                                            <c:when test="${order.payType ==0 }">
	                                            <button type="button" class="btn btn-largesuccess" onclick="zhifu(${order.id})">订单支付<span
	                                                    class="glyphicon glyphicon-edit"></span> 
	                                            </button>                                          
	                                            </c:when>
	                                            <c:otherwise>
	                                             <button type="button" class="btn btn-large" onclick="shouhuo(${order.id})">确认收货<span
	                                                    class="glyphicon glyphicon-edit"></span> 
	                                            </button> 
	                                            </c:otherwise>
                                            </c:choose>
                                      
                                        </td>
                                    </tr>    
                                    </c:forEach>                            
                                    </tbody>
                                </table>                                                                            
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
		
		</div>
	</div>


<!-- 订单详细显示  -->
<div class="modal fade" id="shouwmodel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/user/addorder" id="addExamForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">订单详情</h4>
                </div>
               <div class="modal-body">             
                  <div style="margin-left: 50px;"  class="form-group">            
                        <label for="examname">寄件人名称：<span id=jiname></span></label><br>                       
                        <label for="examtime">收件人姓名：<span id="shouname"></span></label> <br>                     
                        <label for="examtime">订单号：<span id="ordernumber"></span></label><br>
                        <label for="examtime">创建时间：<span id="createtime"></span></label>   <br>
                        <label for="examtime">寄件地址：<span id="useraddress"></span></label><br>
                        <label for="examtime">收件地址：<span id="linkaddress"></span></label><br>
                        <label for="examtime">寄件人电话：<span id="userphone"></span></label><br> 
                        <label for="examtime">收件人电话：<span id="linkphone"></span></label><br>                      
                        <label for="examtime">订单状态：<span id="stauts"></span></label><br> 
                        <label for="examtime">是否异常：<span id="unusual"></span></label><br> 
                        <label for="examtime">服务类型：<span id="servicetype"></span></label><br>
                        <label for="examtime">支付状态：<span id="paytype"></span></label><br>
                        <label for="examtime">订单跟踪：<span id="orgenzong"></span></label><br>
                        <label for="examtime">总费用：<span id="money"></span></label><br> 
                  </div>

            </div>
            </form>
        </div>
    </div>
</div>

<!--修改模型  -->
<div class="modal fade" id="yichangModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="" id="addExamForm">
            <input type="hidden" name="id" id="id" >
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">订单异常上报</h4>
                </div>
               <div class="modal-body">             
                  <div class="form-group">   
                  		<select id="yichang">
                  			<option  value="null">请选择订单异常类型</option>
                  			<option value="退单">退单</option>
                  			<option value="货物损坏">货物损坏</option>
                  			<option value="改单">改单</option>
                  		</select>                   
                  </div>
                 
                <div class="modal-footer">
                	<span id="returnMessage" class="glyphicon"> </span>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>取消</button>
                    <button type="button" id="addExamRecord"  onclick="update1();" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>提交</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
	<script src="js/bootstrap.js"></script>
	<script >
	
	function chaxun(){
	var path="${pageContext.request.contextPath }";
		var ordernumber=$("#ordernumber").val();
		var userid1=$("#userid1").val();
		window.location=path+"/user/getbyorder?userid="+userid1+"&ordernumber="+ordernumber;
		//$("#myForm").attr("action", path+"/user/getbyorder?userid="+userid1+"&ordernumber="+ordernumber).submit();

	}
	
	
	var userid="${sessionScope.user.id}";
	var contextPath="${pageContext.request.contextPath}";
		function getby(id){			
		 $.ajax({
			type: "POST",
			url:contextPath+"/user/getbyidorder",			
			data: {"id":id},
			dataType: "json",
			success: function(order){			
			    $("#shouwmodel #jiname").html(order.jiname);
				$("#shouwmodel #shouname").html(order.shouname);
				$("#shouwmodel #goodsname").html(order.goodSname);
				$("#shouwmodel #ordernumber").html(order.orderNumber);
				$("#shouwmodel #createtime").html(order.createTime);
				$("#shouwmodel #useraddress").html(order.userAddress);
				$("#shouwmodel #linkaddress").html(order.linkAddress);
				$("#shouwmodel #userphone").html(order.userPhone);
				$("#shouwmodel #linkphone").html(order.linkPhone);
				$("#shouwmodel #orgenzong").html(order.orgenzong);
				$("#shouwmodel #stauts").html(order.stauts);
				if(order.unusual==1){
				$("#shouwmodel #unusual").html("是");
				}else{
				$("#shouwmodel #unusual").html("否");
				}
				
				$("#shouwmodel #servicetype").html(order.serviceType);
				if(order.payType==0){
				$("#shouwmodel #paytype").html("未支付");
				}else{
				$("#shouwmodel #paytype").html("已支付");
				}
				
				$("#shouwmodel #money").html(order.money);	
				$("#shouwmodel").modal("show");							
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		}); 		
		
		}
		
		function update(id){
			$("#yichangModal").modal("show");
			$("#yichangModal #id").val(id);
					
		}
		function update1(id){
		  var yichang=$("#yichangModal #yichang").val();
		 var id=$("#yichangModal #id").val();
		  $.ajax({
			type: "POST",
			url:contextPath+"/user/updateorder",			
			data: {"id":id,"yichang":yichang},
			dataType: "json",
			success: function(req){
				if(req){										
				    layer.open({
	                content: "上报成功",
	                btn: ['确认并刷新', '取消'],
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
					
					layer.msg("注册失败",{offset : 320,icon: 2});
				}
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		}); 		
		
		
		}
		
		
		function zhifu(id){		
		 $.ajax({
			type: "POST",
			url:contextPath+"/user/zhifu",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
				if(req){										
				    layer.open({
	                content: "支付成功",
	                btn: ['确认并刷新', '取消'],
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
					
					layer.msg("支付失败",{offset : 320,icon: 2});
				}
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		}); 		
		}
		
	function shouhuo(id){	
		$.ajax({
			type: "POST",
			url:contextPath+"/user/shouhuo",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
				if(req){
				    layer.open({
	                content: "收货成功",
	                btn: ['确认并刷新', '取消'],
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
					layer.msg("收货失败",{offset : 320,icon: 2});
				}
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		}); 		
		
	}
	
	</script>
</body>
</html>