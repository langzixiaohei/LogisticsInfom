<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>物流信息管理后台系统</title>
	<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/main_css.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/HOUTAI/style/authority/zTreeStyle.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/jquery/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/zTree/jquery.ztree.core-3.2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/HOUTAI/scripts/authority/commonAll.js"></script>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
		
		var path="${pageContext.request.contextPath }";
		/**获得当前日期**/
		function  getDate01(){
			var time = new Date();
			var myYear = time.getFullYear();
			var myMonth = time.getMonth()+1;
			var myDay = time.getDate();
			if(myMonth < 10){
				myMonth = "0" + myMonth;
			}
			document.getElementById("yue_fen").innerHTML =  myYear + "." + myMonth;
			document.getElementById("day_day").innerHTML =  myYear + "." + myMonth + "." + myDay;
		}
		
	</script>
	<script type="text/javascript">
		/* zTree插件加载目录的处理  */
		var zTree;
		
		var setting = {
				view: {
					dblClickExpand: false,
					showLine: false,
					expandSpeed: ($.browser.msie && parseInt($.browser.version)<=6)?"":"fast"
				},
				data: {
					key: {
						name: "resourceName"
					},
					simpleData: {
						enable:true,
						idKey: "resourceID",
						pIdKey: "parentID",
						rootPId: ""
					}
				},
				callback: {
	// 				beforeExpand: beforeExpand,
	// 				onExpand: onExpand,
					onClick: zTreeOnClick			
				}
		};
		 
		var curExpandNode = null;
		function beforeExpand(treeId, treeNode) {
			var pNode = curExpandNode ? curExpandNode.getParentNode():null;
			var treeNodeP = treeNode.parentTId ? treeNode.getParentNode():null;
			for(var i=0, l=!treeNodeP ? 0:treeNodeP.children.length; i<l; i++ ) {
				if (treeNode !== treeNodeP.children[i]) {
					zTree.expandNode(treeNodeP.children[i], false);
				}
			}
			while (pNode) {
				if (pNode === treeNode) {
					break;
				}
				pNode = pNode.getParentNode();
			}
			if (!pNode) {
				singlePath(treeNode);
			}
	
		}
		function singlePath(newNode) {
			if (newNode === curExpandNode) return;
			if (curExpandNode && curExpandNode.open==true) {
				if (newNode.parentTId === curExpandNode.parentTId) {
					zTree.expandNode(curExpandNode, false);
				} else {
					var newParents = [];
					while (newNode) {
						newNode = newNode.getParentNode();
						if (newNode === curExpandNode) {
							newParents = null;
							break;
						} else if (newNode) {
							newParents.push(newNode);
						}
					}
					if (newParents!=null) {
						var oldNode = curExpandNode;
						var oldParents = [];
						while (oldNode) {
							oldNode = oldNode.getParentNode();
							if (oldNode) {
								oldParents.push(oldNode);
							}
						}
						if (newParents.length>0) {
							for (var i = Math.min(newParents.length, oldParents.length)-1; i>=0; i--) {
								if (newParents[i] !== oldParents[i]) {
									zTree.expandNode(oldParents[i], false);
									break;
								}
							}
						}else {
							zTree.expandNode(oldParents[oldParents.length-1], false);
						}
					}
				}
			}
			curExpandNode = newNode;
		}
	
		function onExpand(event, treeId, treeNode) {
			curExpandNode = treeNode;
		}
		
		/** 用于捕获节点被点击的事件回调函数  **/
		function zTreeOnClick(event, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
			zTree.expandNode(treeNode, null, null, null, true);
	// 		zTree.expandNode(treeNode);
			// 规定：如果是父类节点，不允许单击操作
			if(treeNode.isParent){
	// 			alert("父类节点无法点击哦...");
				return false;
			}
			// 如果节点路径为空或者为"#"，不允许单击操作
			if(treeNode.accessPath=="" || treeNode.accessPath=="#"){
				//alert("节点路径为空或者为'#'哦...");
				return false;
			}
		    // 跳到该节点下对应的路径, 把当前资源ID(resourceID)传到后台，写进Session
		    rightMain(treeNode.accessPath);
		    
		    if( treeNode.isParent ){
			    $('#here_area').html('当前位置：'+treeNode.getParentNode().resourceName+'&nbsp;>&nbsp;<span style="color:#1A5CC6">'+treeNode.resourceName+'</span>');
		    }else{
			    $('#here_area').html('当前位置：系统&nbsp;>&nbsp;<span style="color:#1A5CC6">'+treeNode.resourceName+'</span>');
		    }
		};
		
		/* 上方菜单 */
		function switchTab(tabpage,tabid){
		var oItem = document.getElementById(tabpage).getElementsByTagName("li"); 
		    for(var i=0; i<oItem.length; i++){
		        var x = oItem[i];    
		        x.className = "";
			}
			if('left_tab1' == tabid){
				$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"业务模块"下的菜单
			  	loadMenu('YEWUMOKUAI', 'dleft_tab1');
			}else  if('left_tab2' == tabid){
				$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"系统管理"下的菜单
				loadMenu('XITONGMOKUAI', 'dleft_tab1');
			}else  if('left_tab3' == tabid){
				$(document).ajaxStart(onStart).ajaxSuccess(onStop);
				// 异步加载"其他"下的菜单
				loadMenu('QITAMOKUAI', 'dleft_tab1');
			} 
		}
		
		
		$(document).ready(function(){
			$(document).ajaxStart(onStart).ajaxSuccess(onStop);
			/** 默认异步加载"业务模块"目录  **/
			loadMenu('YEWUMOKUAI', "dleft_tab1");
			// 默认展开所有节点
			if( zTree ){
				// 默认展开所有节点
				zTree.expandAll(true);
			}
		});
		
		function loadMenu(resourceType, treeObj){
			/*$.ajax({
				type:"POST",
				url:"${dynamicURL}/authority/modelPart.action?resourceType=" + resourceType,
				dataType : "json",
				success:function(data){
					// 如果返回数据不为空，加载"业务模块"目录
					if(data != null){
						// 将返回的数据赋给zTree
						$.fn.zTree.init($("#"+treeObj), setting, data);
 						alert(treeObj);
						zTree = $.fn.zTree.getZTreeObj(treeObj);
						if( zTree ){
							// 默认展开所有节点
							zTree.expandAll(true);
						}
					}
				}
			});*/
			var path="${pageContext.request.contextPath }";
            data = [
					{"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":30,"resourceName":"用户管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/HOUTAI/lianjie/yuangong_list.jsp","checked":false,"delFlag":0,"parentID":30,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":31,"resourceName":"员工管理","resourceOrder":0,"resourceType":""},
            		{"accessPath":path+"/HOUTAI/lianjie/yuangong_list1.jsp","checked":false,"delFlag":0,"parentID":30,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":31,"resourceName":"员工招聘","resourceOrder":0,"resourceType":""},
          		    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":3,"resourceName":"客户管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/khgx","checked":false,"delFlag":0,"parentID":3,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":7,"resourceName":"客户关系查询","resourceOrder":0,"resourceType":""},
            
           		    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":16,"resourceName":"订单管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/getlistorder","checked":false,"delFlag":0,"parentID":16,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":17,"resourceName":"查询所有订单","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/getlistycorder","checked":false,"delFlag":0,"parentID":16,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":17,"resourceName":"异常订单处理","resourceOrder":0,"resourceType":""}, 
                                    
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":24,"resourceName":"计划管理","resourceOrder":0,"resourceType":""},
            		{"accessPath":path+"/admin/getlistorderdiaodu","checked":false,"delFlag":0,"parentID":24,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":26,"resourceName":"订单运输调度","resourceOrder":0,"resourceType":""},
            		
            		
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":55,"resourceName":"货物管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/getbylisthuowu","checked":false,"delFlag":0,"parentID":55,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":44,"resourceName":"商品管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/shangpingchuku","checked":false,"delFlag":0,"parentID":55,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":26,"resourceName":"商品出库管理","resourceOrder":0,"resourceType":""},
             		{"accessPath":path+"/admin/shangpingruku","checked":false,"delFlag":0,"parentID":55,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":26,"resourceName":"商品入库管理","resourceOrder":0,"resourceType":""},
             		{"accessPath":path+"/admin/chukujilu","checked":false,"delFlag":0,"parentID":55,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":26,"resourceName":"商品出库记录","resourceOrder":0,"resourceType":""},
                    {"accessPath":"","checked":false,"delFlag":0,"parentID":1,"resourceCode":"","resourceDesc":"","resourceGrade":2,"resourceID":33,"resourceName":"财务管理","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/getyuangongzi","checked":false,"delFlag":0,"parentID":33,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":31,"resourceName":"查看员工工资","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/getzhifujilu","checked":false,"delFlag":0,"parentID":33,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":31,"resourceName":"查看用户支付记录","resourceOrder":0,"resourceType":""},
                    {"accessPath":path+"/admin/gongsishouru","checked":false,"delFlag":0,"parentID":33,"resourceCode":"","resourceDesc":"","resourceGrade":3,"resourceID":31,"resourceName":"查看公司财务","resourceOrder":0,"resourceType":""}
                    
           
       

           ];
            // 如果返回数据不为空，加载"业务模块"目录
            if(data != null){
                // 将返回的数据赋给zTree
                $.fn.zTree.init($("#"+treeObj), setting, data);
//              alert(treeObj);
                zTree = $.fn.zTree.getZTreeObj(treeObj);
                if( zTree ){
                    // 默认展开所有节点
                    zTree.expandAll(true);
                }
            }
		}
		
		//ajax start function
		function onStart(){
			$("#ajaxDialog").show();
		}
		
		//ajax stop function
		function onStop(){
	// 		$("#ajaxDialog").dialog("close");
			$("#ajaxDialog").hide();
		}
	</script>
</head>
<body onload="getDate01()">
    <div id="top">
		<div id="top_logo" style="color: #087998;font-size: 24px;width: 300px;float: left;vertical-align: middle;height: 65px;line-height: 65px;padding: 1px 1px 1px 40px;">
			物流信息后台管理系统
		</div>
		<div id="top_links">
			<div id="top_op">
				<ul>
					<li>
						<img alt="当前用户" src="${pageContext.request.contextPath }/HOUTAI/images/common/user.jpg">：
						<span>${sessionScope.admin.realName}</span>
					</li>
					<li>
						<img alt="事务月份" src="${pageContext.request.contextPath }/HOUTAI/images/common/month.jpg">：
						<span id="yue_fen"></span>
					</li>
					<li>
						<img alt="今天是" src="${pageContext.request.contextPath }/HOUTAI/images/common/date.jpg">：
						<span id="day_day"></span>
					</li>
				</ul> 
			</div>
			<div id="top_close">
				<a href="${pageContext.request.contextPath }/admin/logout"  target="_parent">
					<img alt="退出系统" title="退出系统" src="${pageContext.request.contextPath }/HOUTAI/images/common/close.jpg" style="position: relative; top: 10px; left: 25px;">
				</a>
			</div>
		</div>
	</div>
    <!-- side menu start -->
	<div id="side">
		<div id="left_menu">			
			<div id="nav_show" style="position:absolute; bottom:0px; padding:10px;">
				<a href="javascript:;" id="show_hide_btn">
					<img alt="显示/隐藏" title="显示/隐藏" src="${pageContext.request.contextPath }/HOUTAI/images/common/nav_hide.png" width="35" height="35">
				</a>
			</div>
		 </div>
		 <div id="left_menu_cnt">
		 	<div id="nav_module">
		 		<img src="${pageContext.request.contextPath }/HOUTAI/images/common/module_1.png" width="210" height="58"/>
		 	</div>
		 	<div id="nav_resource">
		 		<ul id="dleft_tab1" class="ztree"></ul>
		 	</div>
		 </div>
	</div>
	<script type="text/javascript">
		$(function(){
			$('#TabPage2 li').click(function(){
				var index = $(this).index();
				$(this).find('img').attr('src', 'images/common/'+ (index+1) +'_hover.jpg');
				$(this).css({background:'#fff'});
				$('#nav_module').find('img').attr('src', 'images/common/module_'+ (index+1) +'.png');
				$('#TabPage2 li').each(function(i, ele){
					if( i!=index ){
						$(ele).find('img').attr('src', 'images/common/'+ (i+1) +'.jpg');
						$(ele).css({background:'#044599'});
					}
				});
				// 显示侧边栏
				switchSysBar(true);
			});
			
			// 显示隐藏侧边栏
			$("#show_hide_btn").click(function() {
		        switchSysBar();
		    });
		});
		
		/**隐藏或者显示侧边栏**/
		function switchSysBar(flag){
			var side = $('#side');
	        var left_menu_cnt = $('#left_menu_cnt');
			if( flag==true ){	// flag==true
				left_menu_cnt.show(500, 'linear');
				side.css({width:'280px'});
				$('#top_nav').css({width:'77%', left:'304px'});
	        	$('#main').css({left:'280px'});
			}else{
		        if ( left_menu_cnt.is(":visible") ) {
					left_menu_cnt.hide(10, 'linear');
					side.css({width:'60px'});
		        	$('#top_nav').css({width:'100%', left:'60px', 'padding-left':'28px'});
		        	$('#main').css({left:'60px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/common/nav_show.png');
		        } else {
					left_menu_cnt.show(500, 'linear');
					side.css({width:'280px'});
					$('#top_nav').css({width:'77%', left:'304px', 'padding-left':'0px'});
		        	$('#main').css({left:'280px'});
		        	$("#show_hide_btn").find('img').attr('src', 'images/common/nav_hide.png');
		        }
			}
		}
	</script>
    <!-- side menu start -->
    <div id="top_nav">
	 	<span id="here_area">当前位置：系统&nbsp;>&nbsp;系统介绍</span>
	</div>
    <div id="main">
      	<iframe name="right" id="rightMain" src="${pageContext.request.contextPath }/HOUTAI/lianjie/yuangong_list.jsp" frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true"/>
    </div>

</body>
</html>
   
 