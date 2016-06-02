<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>模块介绍</title>
  	<link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/skin/default/css/main.css" media="all"/>
</head>

<body>
<form>
<div class="textbox"></div>

	<div class="modelDiv">

        <table class="modelTable" cellspacing="1">
        	<tr>
        		<td colspan="2" class="modelTitle">用户配置模块介绍</td>
        	</tr>
        	<tr>
				<td class="model_intro_left">角色管理：</td>
				<td class="model_intro_right"><br>租户进行企业内部角色划分，赋予角色响应的服务权限。<br><br>
				</td>
        	</tr>        	
			<tr>
				<td class="model_intro_left">用户管理：</td>
				<td class="model_intro_right"><br>租户进行企业员工账号配置，进行响应的角色分配。<br><br>
				</td>
        	</tr> 
			
			<tfoot>
				<tr>
					<td colspan="2" class="tableFooter"></td>
				</tr>
			</tfoot>
        </table>
 
	</div>
</form>
</body>

</html>