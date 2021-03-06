<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>内容管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/showContent.js"></script>
</head>
<body>
<br/>
	<div class="layui-row layui-col-space15">
	    <div class="layui-col-md2" style="padding: 16px">
			<div style="border: 1px solid #009688;" class="zTreeDemoBackground left">
				<ul id="showContentTree" class="ztree" style="height: 780px"></ul>
			</div>
		</div>
	    <div class="layui-col-md10">
	    	<table class="layui-hide" id="showContentTable" lay-filter="contentToolBar"></table>
			
			<!-- display: none先默认隐藏 等初始化表格的时候才去开启它-->
			<div id="toolbarHead" style="display: none;" class="layui-btn-container">
				<button class="layui-btn layui-btn-sm" lay-event="deleteContent">选中删除</button>
				<button class="layui-btn layui-btn-sm" lay-event="addContent">新增内容</button>
				<button class="layui-btn layui-btn-sm" lay-event="updateContent">修改内容</button>
			</div>
		</div>
	</div>

</body>
</html>