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
        		<td colspan="2" class="modelTitle">服务订购模块介绍</td>
        	</tr>
        	<tr>
				<td class="model_intro_left">服务查询：</td>
				<td class="model_intro_right"><br>租户（企业）进行系统开放服务的查询，进行服务的订购。<br><br>
				</td>
        	</tr>        	
			<tr>
				<td class="model_intro_left">我的服务：</td>
				<td class="model_intro_right"><br>查询当前租户已经订购的服务。<br><br>
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