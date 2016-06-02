<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../base.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改出库单信息</title>
     <link rel="stylesheet" type="text/css" href="${ctx}/skin/default/css/table.css">
     <script type="text/javascript" src="${ctx}/js/datepicker/WdatePicker.js"></script>
     <script type="text/javascript">
     function setProductName(opt){
		 var obj = document.getElementById("productName");
		 obj.value = opt.text ; 
		}
     </script>
</head>
<body>
<form method="post">

	<input type="hidden" name="id" value="${obj.id}"/>
	<!-- 租户ID -->
	<input type = "hidden" name ="tenantId" value="${obj.tenantId}"/>


<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
    <div id="navMenubar">
<ul>
<li id="save"><a href="#" onclick="formSubmit('update.action','_self');">确定</a></li>
<li id="back"><a href="list.action">返回</a></li>
</ul>
    </div>
</div>
</div>
</div>
     
<div class="textbox" id="centerTextbox">
    
    <div class="textbox-header">
    <div class="textbox-inner-header">
    <div class="textbox-title">
		修改出库单信息
    </div> 
    </div>
    </div>
</div>
 
    <div>
		<table class="commonTable" cellspacing="1">
    		<tr>
	            <td class="columnTitle_mustbe">货物编号：</td>
	            <td class="tableContent">
	            	<select name="productNo" onchange="setProductName(this.options[this.selectedIndex])">
						<option value="">----请选择----</option>
						<c:forEach items="${productList}" var="s">
							<option value="${s.productNo}" <c:if test="${obj.productName == s.name}">selected</c:if> >${s.name }</option>
						</c:forEach>	  
	            	</select>
	            	<!-- 货物名称 -->
	            	<input type="hidden" name="productName" id = "productName" value="${obj.productName}"/>
	            </td>
	            <td class="columnTitle_mustbe">货物数量：</td>
	            <td class="tableContent"><input type="text" name="productAmount" value="${obj.productAmount }" /></td>
	        </tr>
	        <tr>
	            <td class="columnTitle_mustbe">经办人：</td>
	            <td class="tableContent"><input type="text" name="operator"  value="${obj.operator }" /></td>
	            <td class="columnTitle_mustbe">出库仓库：</td>
	            <td class="tableContent">
	            	<select name="repositoryNo">
						<option value="">----请选择----</option>
						<c:forEach items="${repositoryList}" var="s">
							<option value="${s.repositoryNo}" <c:if test="${obj.repositoryNo == s.repositoryNo}">selected</c:if> >${s.name }</option>
						</c:forEach>	  
	            	</select>
	            </td>
	        </tr>
	        <tr>
	            <td class="columnTitle_mustbe">出库时间：</td>
	            <td class="tableContent">
	            	
	            	<input type="text" name="outTime" value="<fmt:formatDate value='${obj.outTime }' pattern='yyyy-MM-dd'/>"  readonly ="true"  style="width:90px;"
	            		onclick="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'})"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="columnTitle_mustbe">备注：</td>
	            <td class="tableContent">
	            	<textarea name = "memo" style="height:120px;">${obj.memo }</textarea>
	            </td>
	        </tr>
		</table>
	</div>
</div>
 
 
</form>
</body>
</html>

