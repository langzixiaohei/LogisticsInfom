<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	  <link rel="stylesheet" href="${pageContext.request.contextPath }/js/layer/css/layui.css"  media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/js/jquery-2.1.4.min.js"></script>
	  <script type="text/javascript" src="${pageContext.request.contextPath }/js/layer/layui.all.js"></script>  
<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/basic_layout.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/common_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/authority/commonAll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/fancybox/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/HOUTAI/style/authority/jquery.fancybox-1.3.4.css" media="screen"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/artDialog/artDialog.js?skin=default"></script>




<link href="${pageContext.request.contextPath }/HOUTAI/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/HOUTAI/css/style.css" rel="stylesheet" type="text/css" media="all" />



<title>物流管理系统</title>
<script type="text/javascript">		
	  
	/** 系统根目录  **/
	var path = "${pageContext.request.contextPath }";
			
			
	/** 删除**/		
			
	function del(id){
	
	 $.ajax({
			type: "POST",
			url:path+"/admin/delgoods",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
		   			if(req){
		   			  alert("删除成功");
		   			  window.location.href=path+"/admin/getbylisthuowu";	   			 
		   			}
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		});   
	
	}		
	
	function updateshow(id){
		
		 $.ajax({
			type: "POST",
			url:path+"/admin/getbyidgoods",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
				$("#updateModal #name").val(req.name);
				$("#updateModal #weight").val(req.weight);
				$("#updateModal #id").val(req.id);

			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		});   
	
		$("#updateModal").modal("show");
	}
	
	
	function search(){
	//得到订单号
      var goodsname=$("#goodsname").val();
		$("#submitForm").attr("action", path+"/admin/getbylisthuowu?goodsname="+goodsname).submit();
	}
	
		
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="" method="POST">
		
		<div id="container">

			<div class="ui_content">
			<div class="ui_text_indent">
					<div id="box_border"  class="layui-inline">
						<div id="box_top">搜索</div>
						<form action="${pageContext.request.contextPath }/admin/getzhifujilu" method="POST">
						<div  class="layui-input-inline" id="box_center">					
						请输入用户名称:&nbsp;&nbsp; <input type="text" id="paytime1" name="paytime1" style="height: 40px;margin-top: 10px;" class="ui_input_txt02"/> 
							
						</div>
						<div id="box_bottom">
							<input type="submit" value="查询" class="ui_input_btn01"/> 
						</div>
						</form>
					</div>
				</div>
				<div class="ui_tb">				
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th>用户名称</th>
							<th>订单号</th>			
							<th>支付时间</th>								
						</tr>	
						<c:forEach var="payrecord" items="${sessionScope.payrecords}">
							<tr>
								<td>${payrecord.userName }</td>
								<td>${payrecord.orderNumber }</td>
								<td>${payrecord.payTime }</td>
							</tr>
							
						</c:forEach>
					</table>
				</div>
			
			</div>
		</div>
	</form>


<!-- 修改模型 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/admin/updatehuowu"   method="POST" id="addExamForm">             
                <input type="hidden" name="id" id="id">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改货物信息</h4>	
                </div>
               <div class="modal-body">             
                  <div class="form-group">
                        <label for="examname">货物名称：</label>
                        <input type="text" name="name" id="name" class="form-control"  />
                  </div>
                     <div class="form-group">
                        <label for="examtime">重量：</label>
                        <input type="text" name="weight" id="weight" class="form-control"/>
                    </div>

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
<script >
layui.use('laydate', function(){
  var laydate = layui.laydate;	  
	  //常规用法
	  laydate.render({
	    elem: '#test1'
	  }); 
});
</script>




</body>
	<script src="${pageContext.request.contextPath }/HOUTAI/js/bootstrap.js"></script>
</html>
