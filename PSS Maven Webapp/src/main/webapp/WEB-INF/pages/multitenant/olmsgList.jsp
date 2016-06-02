<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<title></title>
     <link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css"/>
	<script language="javascript" src="${ctx}/js/bootstrap.min.js"></script> 
	<script language="javascript" src="${ctx}/js/jquery-1.7.2.min.js"></script> 
	<script type="text/javascript">
		function formSubmit(url,sTarget){
		    document.forms[0].target = sTarget
		    document.forms[0].action = url;
		    document.forms[0].submit();
		    return true;
		}
		function sms(url){
			var phone  = $("#telephone").attr("value");
			if(/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/i.test(phone)){
				$.ajax({
					   type: "POST",
					   url: url,
					   data: "phone="+phone,
					   success: function(msg){
					     alert( "验证码发送成功" );
					   }
					});
			}else{
				alert("请输入正确的手机号");
			}	
		}
	</script>
<style> 
	.curbody{ CURSOR: url(${ctx}/images/olmsg/shubiao.ani);background:url(${ctx}/images/olmsg/pic738x571.jpg); }
	.msgcontent{ width:218px;overflow:hidden;word-break:break-all;padding:10px;font-size:14px;color:#339966;font-family:Tahoma;line-height:180%; }
	.msgcontent p{ text-indent:0px;}
	.msgcontent ul( margin:0px;}
	.msgbackcontent{ width:218px;overflow:hidden;word-break:break-all;padding:10px;font-size:14px;color:#339966;font-family:Tahoma;line-height:180%; }
	.msgbackcontent p{ text-indent:0px;}
	.msgbackcontent ul( margin:0px;}
	li{ text-indent:0px;margin:0px;list-style:default; }
</style>
	
</head>
 
<body class="curbody">
 
<div class = "container">
<div style="height:100px;"></div>
<form class="form-horizontal" method="post">
	   
	  	   <div class="form-group">
	    <label for="newPass" class="col-sm-4 control-label">新密码:</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="newPass" name="newPass" placeholder="newPass" >
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="confirmPass" class="col-sm-4 control-label">确认密码:</label>
	    <div class="col-sm-4">
	      <input type="text" class="form-control" id="confirmPass" name="confirmPass" placeholder="confirmPass" >
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="telephone" class="col-sm-4 control-label">手机号:</label>
	    <div class="col-sm-4">
	      <input type="telephone" class="form-control" id="telephone" name="telephone" placeholder="telephone">
	    </div>
	  </div>
	    <div class="form-group">
	    <label for="tenantcode" class="col-sm-4 control-label">验证码:</label>
	    <div class="col-sm-2">
	      <input type="text" class="form-control" id="tenantcode" name="tenantcode" placeholder="code">
	    </div>
	   	  <a id ="sms" class="btn btn-info" onclick="sms('${ctx}/code.action')">发送手机验证码</a>
	  </div>
	  
	    <div class="form-group">
	    <div class="col-sm-4 col-sm-offset-5">
	      <button id = "submit"  class="btn btn-primary" onclick="formSubmit('${ctx}/multitenant/tenantadmin/tenant/updatepass.action','_self')">Update</button>
	    </div>
	  </div>
	  <br>
	  <div class = "form-group">
	  	<div class="col-sm-8 col-sm-offset-3">
	  		<h3>${msg}</h3>
	  	</div>
	  </div>
</form>

</body>
</html>

