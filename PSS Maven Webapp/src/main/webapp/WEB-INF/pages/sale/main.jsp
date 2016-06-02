<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
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
        		<td colspan="2" class="modelTitle">销售管理服务介绍</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">商品销售:</td>
        		<td class="model_intro_right"><br>当客户订购商品时，销售人员进行货物销售订单的构建，在订单中
        		添加客户订购货物的信息。此时，销售订单只是草稿，销售人员可以进行订单的上报。当订单状态为审核通过时，<br>
        		销售人员才可以进行实际的商品销售操作。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">货物上下限:</td>
        		<td class="model_intro_right"><br>销售人员根据实际情况进行仓库中货物存储量的上下限设置。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">货物信息:</td>	
        		<td class="model_intro_right"><br>销售人员进行货物进本信息的管理。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">客户信息:</td>
        		<td class="model_intro_right"><br>销售人员进行商品销售客户信息的管理。<br><br>
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