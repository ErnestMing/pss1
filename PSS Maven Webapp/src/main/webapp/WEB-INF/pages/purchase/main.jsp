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
        		<td colspan="2" class="modelTitle">采购管理服务介绍</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">原材料采购:</td>
        		<td class="model_intro_right"><br>当企业原材料不足时，采购人员进行原材料订单的构建，在订单中
        		添加要采购的原材料信息。此时，原材料订单只是草稿，采购人员可以进行订单的上报，当订单状态为审核通过时，<br>
        		采购人员才可以进行实际的原材料采购操作。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">原材料上下限:</td>
        		<td class="model_intro_right"><br>原材料负责人根据实际情况，进行原材料在仓库中存储量上下限的设置。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">原材料信息:</td>
        		<td class="model_intro_right"><br>原材料负责人进行原材料基本信息的管理。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">供应商信息:</td>
        		<td class="model_intro_right"><br>原材料负责人进行原材料供应商基本信息的管理。<br><br>
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