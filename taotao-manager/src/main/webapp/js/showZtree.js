$(function(){
	var setting = {
		async : {
			enable : true,//true 表示 开启 异步加载模式。如果设置为 true，请务必设置 setting.async 内的其它参数。即url和autoParam。
			url : "/itemCat/showZtree",//Ajax 获取数据的 URL 地址。[setting.async.enable = true 时生效]
			autoParam : [ "id" ]//异步加载时需要自动提交父节点属性的参数。[setting.async.enable = true 时生效]
		},
		callback: {
			onClick: zTreeOnClick
		}
		
	};
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting);
	});
	function zTreeOnClick(event, treeId, treeNode) {
	    //console.log(treeNode);//treeNode被点击的节点 JSON 数据对象
		parent.$("#selectCid").val(treeNode.name);//子弹出层通过这个代码给父弹出层传递值
		parent.$("#cidContent").val(treeNode.id);
	};
})
