<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
	<title></title>
    <link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/skin/default/css/default.css" media="all"/>
<script type="text/javascript" src="/components/jquery-ui/jquery-1.2.6.js"></script>
	<script language="javascript" src="${ctx}/js/common.js"></script> 
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
	    <div class="col-sm-4 col-sm-offset-5">
	      <button type="button" class="btn btn-primary" onclick="formSubmit('${ctx}/sysadmin/user/updateuserinfo.action','_main')">Update</button>
	    </div>
	  </div>
</form>
</body>
</html>

