<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../baselist.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<script type="text/javascript" src="${ctx}/components/jquery-ui/jquery-1.2.6.js"></script>
</head>
 
<body id="left_frame">
<div class="PositionFrame_black" id="PositionFrame"></div>
 
 
<!-- begin1  -->
<div id="sidebar" class="sidebar">
	<div class="sidebar_t">
		<div class="sidebar_t_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_t_r"></div>
	</div>
        <div class="panel">
        <div class="panel_icon"><img src="${ctx}/skin/default/images/icon/document_into.png"/></div>
        <div class="panel-header">
        <div class="panel-title">库存管理</div>
        <div class="panel-content">
			<ul>
				<li><a href="${ctx}/cargo/stock/list.action" onclick="linkHighlighted(this)" target="main" id="aa_1">库存管理</a></li>
				<li><a href="${ctx}/cargo/stockwarning/list.action" onclick="linkHighlighted(this)" target="main" id="aa_1">库存预警</a></li>
				<li><a href="${ctx}/baseinfo/repository/list.action" onclick="linkHighlighted(this)" target="main" id="aa_1">仓库信息</a></li>
			</ul>
        </div>
        </div>
    </div>
    <div class="sidebar_t">
		<div class="sidebar_b_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_b_r"></div>
	</div>  
</div>	



</body>
</html>
