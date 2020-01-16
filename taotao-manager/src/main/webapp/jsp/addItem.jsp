<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品添加</title>
<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath}/kindeditor/lang/zh-CN.js"></script>
</head>
<body>
<br/>
<br/>
	<form class="layui-form" action="/item/addItem" method="post">
		<div class="layui-form-item">
			<label class="layui-form-label">商品分类</label>
			<div class="layui-input-block">
				<button id="addItemSelectItemCat" type="button" class="layui-btn">
					<i class="layui-icon">&#xe608;</i> 选择分类
				</button>
				<span style="display: none;" id="addItemSpan"></span> 
				<input id="addItemId" type="hidden" name="cId" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品卖点</label>
			<div class="layui-input-inline">
				<input style="height: 76px; width: 270px" type="text"
					name="sellPoint" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品价格</label>
			<div class="layui-input-inline">
				<input type="text" name="price" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品库存</label>
			<div class="layui-input-inline">
				<input type="text" name="num" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">条形码</label>
			<div class="layui-input-inline">
				<input type="text" name="barcode" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品图片</label>
			<div class="layui-input-block">
				<div class="layui-upload">
					<button type="button" class="layui-btn" id="test2">上传图片</button>
					<blockquote class="layui-elem-quote layui-quote-nm"
						style="margin-top: 10px;">
						预览图：
						<div class="layui-upload-list" id="demo2"></div>
					</blockquote>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-inline">
				<!-- 富文本编辑器把里面的内容变成一个个div包裹起来 -->
				<textarea id="editor_id" name="content"
					style="width: 700px; height: 300px;">
				</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class="layui-btn" lay-submit=""
					lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>

<script>
layui.use(['form', 'layedit', 'laydate','upload'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate
  ,upload = layui.upload;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
 /*  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  }); */
 
  //表单赋值
  layui.$('#LAY-component-form-setval').on('click', function(){
    form.val('example', {
      "username": "贤心" // "name": "value"
      ,"password": "123456"
      ,"interest": 1
      ,"like[write]": true //复选框选中状态
      ,"close": true //开关状态
      ,"sex": "女"
      ,"desc": "我爱 layui"
    });
  });
  
  //表单取值
  layui.$('#LAY-component-form-getval').on('click', function(){
    var data = form.val('example');
    alert(JSON.stringify(data));
  });
  
//多图片上传 这里一定是 layui的ajax请求 发送图片 controller回传json格式的数据给我们 提示上传成功或者失败
  upload.render({
    elem: '#test2'
    ,url: '/item/fileUpload' //改成您自己的上传接口
    ,multiple: true
    ,before: function(obj){
      //预读本地文件示例，不支持ie8
      obj.preview(function(index, file, result){
        $('#demo2').append('<img style="height: 100px;width: 100px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
      });
    }
    ,done: function(res){
    	//点上传图片先到controller里去把图片存到图片服务器中 把这个路径返回到页面这边
    	//res就是图片路径 把这个路径 绑定到 input输入框中的image这个隐藏域里面去
		//form表单里面有个隐藏域 名字叫做  name="image" value="controller发送过来的图片路径"
		//点击提交的时候才真正的把图片路径存到数据库中去
      	//上传完毕
    }
  });
});




	$("#addItemSelectItemCat").click(function() {
		/**
			success:function是当用户点击了按钮以后 成功打开了模态框以后 会执行的function函数
			我们在这个函数里面 执行了一个代码 就是 传递一个参数 到showZtree.jsp页面中去
			是一个唯一标识符 用于区分是谁点击的 这个按钮
			yes:function是当用户点击了模态框上面的确定按钮以后 才会执行的方法
			但是这里有个坑， 主要在业务逻辑上面
			在官网查询得到的资料里面 我可以知道 layer.close(index);
		 	是关闭这个模态框的，我关闭不了 关不了的原因是因为
			success:function里面的index == yes:function里面的layero
		 */
		layer.open({
			type : 2,
			title : '商品分类选择',
			shadeClose : true,
			shade : 0.8,
			area : [ '380px', '90%' ],
			content : '/jsp/showZtree.jsp',
			btn : [ '确定', '取消' ],
			yes : function(layero, index) {
				$("#addItemSpan").show();
				layer.close(layero);
			},
			success : function(layero, index) {
				var iframe = window['layui-layer-iframe' + index];
				iframe.child('addItem.jsp');
			}
		});
	})
	
	 //根据文本域的id来创建富文本编辑器 进行初始化
	 window.editor = KindEditor.create("#editor_id");
</script>

</body>
</html>