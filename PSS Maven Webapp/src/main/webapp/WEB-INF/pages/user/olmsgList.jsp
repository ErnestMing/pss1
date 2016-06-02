<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title></title>
    <link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/css/bootstrap.css"/>
	<script language="javascript" src="${ctx}/js/bootstrap.min.js"></script> 
	<script language="javascript" src="${ctx}/js/jquery-1.7.2.min.js"></script> 
	<script type="text/javascript">
		function formSubmit (url,sTarget){
		    document.forms[0].target = sTarget
		    document.forms[0].action = url;
		    document.forms[0].submit();
		    return true;
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
	    <label for="userNo" class="col-sm-4 control-label">用户账号:</label>
	    <div class="col-sm-4">
	      <input type="text" value="${sessionScope['CURUSER'].userNo }" class="form-control" id="userNo" name="userNo" placeholder="userNo" disabled>
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="password" class="col-sm-4 control-label">密码:</label>
	    <div class="col-sm-4">
	      <input type="text" value="${sessionScope['CURUSER'].password }" class="form-control" id="password" name="password" placeholder="Password" disabled>
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="telephone" class="col-sm-4 control-label">手机号:</label>
	    <div class="col-sm-4">
	      <input type="telephone" value="${sessionScope['CURUSER'].telephone }" class="form-control" id="telephone" name="telephone" placeholder="telephone">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="email" class="col-sm-4 control-label">邮箱:</label>
	    <div class="col-sm-4">
	      <input type="email"  value="${sessionScope['CURUSER'].email }"  class="form-control" id="email" name="email" placeholder="Email">
	    </div>
	  </div>
	     <div class="form-group">
	    <label for="address" class="col-sm-4 control-label">地址:</label>
	    <div class="col-sm-4">
	      <input type="telephone" value="${sessionScope['CURUSER'].address }" class="form-control" id="address" name="address" placeholder="telephone">
	    </div>
	  </div>
	     <div class="form-group">
	    <div class="col-sm-4 col-sm-offset-5">
	      <button type="button" class="btn btn-primary" onclick="formSubmit('${ctx}/sysadmin/user/updateuserinfo.action','_main')">Update</button>
	    </div>
	  </div>
</form>
	
</div>
</body>
</html>

