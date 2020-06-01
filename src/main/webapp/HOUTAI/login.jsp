<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>物流信息管理系统</title>
<meta name="viewport" content="width=device-width">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${pageContext.request.contextPath }/HOUTAI/layer/layer.js"></script>
<link href="${pageContext.request.contextPath }/HOUTAI/public/css/base.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/HOUTAI/public/css/login.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="login">
<form action="${pageContext.request.contextPath }/admin/login" method="post" id="form">
	<div class="logo"></div>
    <div class="login_form">
    	<div class="user">
        	<input class="text_value"  id="username" name="username" type="text" >
            <input class="text_value"  id="password" name="password" type="password">
        </div>
        <button class="button" onclick="login();" id="submit" type="submit">登录</button>
    </div>
    
    <div id="tip"><span style="color: #FF0000">${error}</span></div>

    </form>
</div>
<script>var basedir='public/ui/';</script>
<script src="${pageContext.request.contextPath }/HOUTAI/public/ui/do.js"></script>
<script src="${pageContext.request.contextPath }/HOUTAI/public/ui/config.js"></script>
<script>
	function login(){
		$("#submit").submit();
	}
</script>
</body>
</html>
