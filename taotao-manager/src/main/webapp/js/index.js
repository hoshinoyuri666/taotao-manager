$(function(){
		//JavaScript代码区域
		layui.use('element', function(){
		  var element = layui.element;
		  
		});
		$("#showItem").click(function(){
			//jquery的load()方法从服务器加载数据，并把返回的数据放置到指定的元素中。
			$("#content").load("/jsp/showItem.jsp");
		})
		$("#addItemCat").click(function(){
			$("#content").load("/jsp/addItemCat.jsp");
		})
})