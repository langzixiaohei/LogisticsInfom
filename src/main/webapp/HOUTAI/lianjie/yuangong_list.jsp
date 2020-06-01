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

<title>信息管理系统</title>
<script type="text/javascript">		
	  
	/** 系统根目录  **/
	var path = "${pageContext.request.contextPath }";

	 	
	/** 删除 **/
	function del(id){
	$("#submitForm #id").val(id);	
	 	$("#submitForm").submit();
	}
	
	/** 修改**/
	function update(id){
		 $.ajax({
			type: "POST",
			url:path+"/admin/getbyidyg",			
			data: {"id":id},
			dataType: "json",
			success: function(req){
		     $("#updateModal #id").val(req.id);
		     $("#updateModal #drivername").val(req.drivername);
		     $("#updateModal #age").val(req.age);
		     $("#updateModal #phone").val(req.phone);
			 $("#updateModal #price").val(req.price);
			 $("#updateModal").modal("show");
			},
			error: function(data){
				layer.msg("再试一次",{offset : 320,icon: 5});
			} 
		});  
	
	 
	  
	  
	}
	
	
	
	
	/** 修改**/
	function add(){
	 $("#addModal").modal("show");	
	}
		
	
</script>
<style>
	.alt td{ background:black !important;}
</style>
</head>
<body>
	<form id="submitForm" name="submitForm" action="${pageContext.request.contextPath }/admin/deleteyg" method="post">
		<input type="hidden" name="id" id="id">
		<div id="container">

			<div class="ui_content">
				<div class="ui_tb">				
					<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
						<tr>
							<th>员工姓名</th>
							<th>年龄</th>
							<th>电话</th>
							<th>出车价格</th>
							<th>状态</th>
							<th>操作</th>
						</tr>	
						<c:forEach var="driver" items="${sessionScope.drivers}">
							<tr>
								<td>${driver.driverName }</td>
								<td>${driver.age }</td>
								<td>${driver.phone }</td>
								<td>${driver.price }</td>
								<c:if test="${driver.status ==1}">
								<td><span style="color: #FF0000">出车中</span></td>
								</c:if>
								<c:if test="${driver.status ==0}">
								<td><span style="color: #00FF00">未出车</span></td>
								</c:if>
								
								<td>
									<a href="javascript:update(${driver.id});" class="edit">修改</a> 
									<a href="javascript:del(${driver.id});">删除</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			
			</div>
		</div>
	</form>




<!-- 添加模型 -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/admin/insertyg"   method="POST"  meid="addExamForm">
               
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加员工</h4>
                </div>
               <div class="modal-body">             
                  <div class="form-group">
                        <label for="examname">员工姓名：</label>
                        <input type="text" name="drivername" id="drivername" class="form-control"  />
                  </div>
                  <div class="form-group">
                        <label for="examtime">员工电话：</label>
                        <input type="text" name="phone" id="phone" class="form-control" />
                  </div>
                       <div class="form-group">
                        <label for="examtime">员工年龄：</label>
                        <input type="text" name="age" id="age" class="form-control"  />
                  </div>
                     <div class="form-group">
                        <label for="examtime">出车价格：</label>
                        <input type="text" name="price" id="price" class="form-control" placeholder="请输入货物名称"/>
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

<!-- 修改模型 -->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <form role="form" action="${pageContext.request.contextPath }/admin/updateyg"   method="POST" id="addExamForm">             
                <input type="hidden" name="id" id="id">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
                </div>
               <div class="modal-body">             
                  <div class="form-group">
                        <label for="examname">员工姓名：</label>
                        <input type="text" name="drivername" id="drivername" class="form-control"  />
                  </div>
                  <div class="form-group">
                        <label for="examtime">员工电话：</label>
                        <input type="text" name="phone" id="phone" class="form-control"  />
                  </div>
                     <div class="form-group">
                        <label for="examtime">员工年龄：</label>
                        <input type="text" name="age" id="age" class="form-control" placeholder="请输入货物名称"/>
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



</body>
	<script src="${pageContext.request.contextPath }/HOUTAI/js/bootstrap.js"></script>
</html>
