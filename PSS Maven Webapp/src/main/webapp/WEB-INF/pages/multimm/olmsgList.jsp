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
	 		<input type = "hidden" name = "id" value = "${sessionScope['CUR_TENANT'].id }"/>
	 		<input type = "hidden" name = "tenantNo" value = "${sessionScope['CUR_TENANT'].tenantNo }"/>
	 		<input type = "hidden" name = "password" value = "${sessionScope['CUR_TENANT'].password }"/>
	 		<input type = "hidden" name = "state" value = "${sessionScope['CUR_TENANT'].state }"/>
			<div class="form-group">
			    <label for="tenantNo" class="col-sm-4 control-label">管理员账号:</label>
			    <div class="col-sm-4">
			      <input type="text" value="${sessionScope['CUR_TENANT'].tenantNo }" class="form-control" id="tenantNo" name="tenantNo" placeholder="TenantNo" disabled="disabled">
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="name" class="col-sm-4 control-label">管理员名称:</label>
			    <div class="col-sm-4">
			      <input type="name" value="${sessionScope['CUR_TENANT'].name }" class="form-control" id="name" name="name" placeholder="Admin Name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="company" class="col-sm-4 control-label">所属企业:</label>
			    <div class="col-sm-4">
			      <input type="company"  value="${sessionScope['CUR_TENANT'].company }"  class="form-control" id="company" name="company" placeholder="Company">
			    </div>
			  </div>
			     <div class="form-group">
			    <label for="address" class="col-sm-4 control-label">地址:</label>
			    <div class="col-sm-4">
			      <input type="telephone" value="${sessionScope['CUR_TENANT'].address }" class="form-control" id="address" name="address" placeholder="Address">
			    </div>
			  </div>
			     <div class="form-group">
			    <label for="contactor" class="col-sm-4 control-label">联系人:</label>
			    <div class="col-sm-4">
			      <input type="telephone" value="${sessionScope['CUR_TENANT'].contactor }" class="form-control" id="contactor" name="contactor" placeholder="Contactor">
			    </div>
			  </div>
			     <div class="form-group">
			    <label for="telephone" class="col-sm-4 control-label">电话:</label>
			    <div class="col-sm-4">
			      <input type="telephone" value="${sessionScope['CUR_TENANT'].telephone }" class="form-control" id="telephone" name="telephone" placeholder="Telephone">
			    </div>
			  </div>
			     <div class="form-group">
			    <div class="col-sm-4 col-sm-offset-5">
			      <button type="button" class="btn btn-primary" onclick="formSubmit('${ctx}/multitenant/tenantadmin/tenant/tenantInfoUpdate.action','_main')">Update</button>
			    </div>
			  </div>
		</form>
 	</div>

</body>
</html>

