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
        		<td colspan="2" class="modelTitle">订单审核模块介绍</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">订单审核:</td>
        		<td class="model_intro_right"><br>进销存系统中主要存在两种订单：货物销售订单和原材料采购订单。<br>
        		两种订单产生之后必须通过审核才可以进行实际的销售和采购操作。
					<br>
				</td>
        	</tr>
			<tr>
        		<td class="subModelTitle">报表统计:</td>
        		<td class="model_intro_right"><br>主要进行货物的月销售报表和原材料月采购报表的统计。<br>
        			<br>
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