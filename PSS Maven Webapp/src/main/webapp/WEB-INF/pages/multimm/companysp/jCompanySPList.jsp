<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../baselist.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>企业月销售/采购情况表</title>
	 <link rel="stylesheet" type="text/css" href="${ctx}/skin/default/css/table.css">
	 <script type="text/javascript" src="${ctx}/js/datepicker/WdatePicker.js"></script>
	  <script type="text/javascript">
     	//给打印 链接 添加参数 saleTime
     	function setProfitLossExport(month){
     		var obj = document.getElementById("profitLoss");
     		obj.href = obj.href +"?month="+month +""; 
     	}
     </script>
</head>

<body>
<form name="icform" method="post">
<br>
<!-- 查询条件 -->
	<span style="width:300px;font-size:15px;color:blue;">输入查询月份：</span>
	<input type="text" name="month" readonly ="true"  style="width:90px;" onchange="setProfitLossExport(this.value)"
	            		onclick="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM'})"/>
	&nbsp;&nbsp;&nbsp;&nbsp;<a id = "profitLoss" href="${ctx}/multimm/companysp/list.action"><font color="red" size="3">查询</font></a>

<!-- 页面主体部分（列表等） -->  
<div class="textbox" id="centerTextbox">
  <div class="textbox-header">
  <div class="textbox-inner-header">
  <div class="textbox-title">

	企业月销售/采购情况表（单位：元）
	   
  </div> 
  </div>
  </div>
  
<div>
	
<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">企业名称</td>
		<td class="tableHeader">销售总金额</td>
		<td class="tableHeader">采购总金额</td>
	</tr>
	</thead>
	<tbody class="tableBody">
	
	<c:forEach items="${dataList}" var="o" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'" >
		<td>${status.index+1}</td>
		<td><a href="toview.action?tenantId=${o.tenantId}">${o.company}</a></td>
		<td>${o.saleAmount}</td>
		<td>${o.purchaseAmount}</td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

