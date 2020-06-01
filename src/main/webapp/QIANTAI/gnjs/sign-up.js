function adduser1(){		 
		var usercode = $("#usercode").val();
		var realname = $("#realname").val();
		var password = $("#password").val();
		var phone = $("#phone").val();
		alert(usercode);
	 	 $.ajax({
			type: "POST",
			url:contextPath+"/user/insert",
			contentType:"application/json;charset=UTF-8", //必须有
			data: {"userCode":usercode,"realName":realname,"passWord":password,"phone":phone},
			dataType: "json",
			success: function(req){
				if(req){										
				    layer.open({
	                content: "注册成功",
	                btn: ['前往登陆', '留在本页'],
	                offset:320,
	                yes: function(index, layero) {
	                    window.location.href=contextPath+"/QIANTAI/login.jsp";
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