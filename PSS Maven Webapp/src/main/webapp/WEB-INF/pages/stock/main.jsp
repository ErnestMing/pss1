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
        		<td colspan="2" class="modelTitle">库存管理服务介绍</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">库存管理:</td>
        		<td class="model_intro_right"><br>库存管理是进销存管理的核心。在库存管理中主要包括原材料的入/出库和货物的入/出库操作。<br>
        		在进行原材料和货物的入库出库操作时，必须填写相应的入库/出库单，在入库出库单中添加相应的原材料和货物。<br><br>
				</td>
        	</tr>
			<tr>
        		<td class="subModelTitle">库存预警:</td>
        		<td class="model_intro_right"><br>库存预警实现了对库存情况的监控，库存管理人员执行相应的操作，生成相应的原材料/货物上下限预警报表。<br><br>
				</td>
        	</tr>
        	<tr>
        		<td class="subModelTitle">仓库信息:</td>
        		<td class="model_intro_right"><br>根据企业内部具体的情况进行仓库信息的管理。<br><br>
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