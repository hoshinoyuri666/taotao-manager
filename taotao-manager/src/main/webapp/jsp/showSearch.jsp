<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索商品展示页面</title>

</head>
<body>
	<div>
		<br/>
		<input class="layui-input" placeholder="请输入商品名称" type="text" id="searchContent" />
		<button type="button" class="layui-btn" id="search">
		  <i class="layui-icon">&#xe615;</i> 搜索
		</button>
	</div>
	<table class="layui-hide" id="showItemPage" lay-filter="itemToolBar"></table>
	
	<!-- display: none先默认隐藏 -->
	<div id="toolbarDemo" style="display: none;"  class="layui-btn-container">
		<!-- 要批量删除或者上架下架步骤：
		1.先获取选中的数据 2.自己写ajax请求 发送到服务器 3.服务器controller接收参数
		4.controller调用service 5.service调用dao 6.controller回传一个json告诉用户成功还是失败 -->
		<button class="layui-btn layui-btn-sm" lay-event="itemDelete">删除所选</button>
		<button class="layui-btn layui-btn-sm" lay-event="addItem">新增商品</button>
		<button class="layui-btn layui-btn-sm" lay-event="updateItem">修改商品</button>
		<button class="layui-btn layui-btn-sm" lay-event="upshelf">商品上架</button>
		<button class="layui-btn layui-btn-sm" lay-event="offshelf">商品下架</button>
	</div>
	<div style="display: none;" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> 
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	
	<script>
		var table;
		layui.use(['jquery','layer','table'], function() {//table的作用范围
			var $ = layui.jquery;
			var layer = layui.layer;
			table = layui.table;
			/**
				layui的核心思想是
				当用户访问这个showItem.jsp页面的时候  发现有一个table标签
				这个table标签 又发现了一个 script方法 
				这个script方法 里面有layui的render方法 实际上 做一个事情
				当页面一旦被加载了以后 他会根据url去请求一个服务器地址 
				从服务器地址上面 获取一段json格式数据 但是json格式的数据 他的格式 必须是这样的
				{code:0,msg:"",count:10000,data:[{},{}]}
				code:传入0就行了
				msg:传入空字符串就行了
				count:总记录条数就行了
				data:每一页显示商品信息json格式  这就是 那十条记录信息
			*/
			table.render({
				elem : '#showItemPage',//绑定哪个table表 可以以id选择器绑定 可以以class选择器 还可以以 name选择器
				url : '/item/showSearchPage',//请求服务器的url路径 默认会自动传递两个参数：?page=1&limit=30（该参数可通过 request 自定义） page 代表当前页码、limit 代表每页数据量
				toolbar : '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
				,
				defaultToolbar : [ 'filter', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
					layEvent : 'LAYTABLE_TIPS',
					icon : 'layui-icon-tips'
				} ],
				title : '商品表',
				cols : [ 
				         [ 
				{
					type : 'checkbox',//复选框
					fixed : 'left'//固定在左侧
				}, {
					field : 'id',
					title : 'ID',
					width : 80,
					fixed : 'left'
				}, {
					field : 'title',
					title : '商品名称',
					width : 100
				}, {
					field : 'sellPoint',
					title : '商品卖点',
					width : 100
				}, {
					field : 'price',
					title : '商品价格',
					//edit: 'text'编辑单元格
					width : 100
				}, {
					field : 'num',
					title : '商品数量',
					width : 100
				}, {
					field : 'cid',
					title : '商品类目',
					width : 100
				}, {
					field : 'status',
					title : '商品状态',
					width : 100,
					templet: '#titleTpl',//templet自定义列模板，可借助它实现逻辑处理，以及将原始数据转化成其它格式，如时间戳转化为日期字符等。
					sort : true//排序
				},{
					field : 'created',
					title : '创建时间',
					templet:'<div>{{ layui.util.toDateString(d.created, "yyyy-MM-dd HH:mm:ss") }}</div>',//参数 d，包含接口返回的所有字段和数据。
					width : 200
				},{
					field : 'updated',
					title : '更新时间',
					templet:'<div>{{ layui.util.toDateString(d.updated, "yyyy-MM-dd HH:mm:ss") }}</div>',
					width : 200
				},
				{
					fixed: 'right', 
					title:'操作', 
					toolbar: '#barDemo', 
					width:150
				}
					]
				],
				page : true
			});

			 //头工具栏事件
			table.on('toolbar(itemToolBar)', function(obj){
			   var checkStatus = table.checkStatus(obj.config.id);
			    switch(obj.event){
			      case 'itemDelete':
			        var data = checkStatus.data;
			        //layer.alert(JSON.stringify(data));获取json格式的数据
			             $.ajax({
				            type: "POST",
				            url: "/item/itemDelete",
				            contentType: "application/json;charset=utf-8",
				            data:JSON.stringify(data),//发过去的json格式
				            dataType: "json",//返回值类型//要封装一个工具类 因为修改删除添加商品都要ajax请求 返回json数据格式 提示修改成功或失败 
				            success:function (message) {
				               if(message.status==200){
				            	   layer.alert('删除商品成功');
				            	   table.reload('showItemPage',{  });//重新渲染表格
				               }else{
				            	   layer.alert(message.msg);
				               }
				            }
				        });
			      break;
			      case 'upshelf':
				        var data = checkStatus.data;
				             $.ajax({
					            type: "POST",
					            url: "/item/upshelf",
					            contentType: "application/json;charset=utf-8",
					            data:JSON.stringify(data),
					            dataType: "json",
					            success:function (message) {
					               if(message.status==200){
					            	   layer.alert(message.msg);
					            	   table.reload('showItemPage',{  });
					               }else{
					            	   layer.alert(message.msg);
					               }
					            }
					        });
				      break;
			      case 'offshelf':
				        var data = checkStatus.data;
				             $.ajax({
					            type: "POST",
					            url: "/item/offshelf",
					            contentType: "application/json;charset=utf-8",
					            data:JSON.stringify(data),
					            dataType: "json",
					            success:function (message) {
					               if(message.status==200){
					            	   layer.alert(message.msg);
					            	   table.reload('showItemPage',{  });
					               }else{
					            	   layer.alert(message.msg);
					               }
					            }
					        });
				      break;
			    
			    };
			  });

			 $("#search").click(function(){
				 //layer.alert('加了个图标', {icon: 1}); 
				 var searchContent = $("#searchContent").val();
				 //layer.alert(searchContent);
				 location.href = "/item/search/"+searchContent;
			 })
			
		});
		
		
		
	</script>
	<script type="text/html" id="titleTpl">
    {{#  if(d.status ==0){ }}
        	下架 
    {{#  }  else if(d.status==1){ }}
       	上架
 	{{#  }  else if(d.status==2){ }}
       	删除
    {{#  } }}
	</script>

</body>
</html>