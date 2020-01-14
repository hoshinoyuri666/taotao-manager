<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淘淘商城后台</title>
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css">
<script src="${pageContext.request.contextPath  }/layui/layui.js"></script>
<script src="${pageContext.request.contextPath }/js/index.js"></script>
<script src="${pageContext.request.contextPath }/js/echarts-en.common.min.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">-----
		<div class="layui-header">
			<div class="layui-logo">淘淘商城后台</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="http://t.cn/RCzsdCq" class="layui-nav-img"> admin
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">个人中心</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<br/>
					<li class="layui-nav-item"><a class="" href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="addItemCat" href="javascript:;">商品分类添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品分类查询</a>
							</dd>
							<dd>
								<a id="addItem" href="javascript:;">商品添加</a>
							</dd>
							<dd>
								<a id="showItem" >商品查询</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">cms内容管理系统</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">cms内容模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容模板查询</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询订单</a>
							</dd>
							<dd>
								<a href="javascript:;">订单统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询用户</a>
							</dd>
							<dd>
								<a href="javascript:;">用户统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">权限管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查看权限</a>
							</dd>
							<dd>
								<a href="javascript:;">分配权限</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">活动管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">新增活动</a>
							</dd>
							<dd>
								<a href="javascript:;">查看活动</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域
				 $("#content").load("/jsp/showItem.jsp");
			 -->
			 <!-- 内容主体区域 -->
				<div id="content"> <!--  style="background-color: #F2F2F2; height: 100%" -->
				<div style="padding: 20px; background-color: #F2F2F2;">
					<div class="layui-row layui-col-space15"><!-- layui-col-space15代表列之间间隔 15px -->
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>访问量</span>
										<span><font style="background: blue;color: white;padding: 2px 5px;">周</font></span>
									</div>
								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">99999</span></br> </br> <span
										style="color: #676767">总访问量</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>每天收入</span> <span class="layui-badge">天</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">6666</span></br> </br> <span
										style="color: #676767">总收入</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>用户总数</span> <span class="layui-badge layui-bg-green">月</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">9666</span></br> </br> <span
										style="color: #676767">总用户数</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md3">
							<div class="layui-card">
								<div class="layui-card-header">
									<div>
										<span>新增用户</span> <span class="layui-badge">天</span>
									</div>

								</div>
								<div class="layui-card-body">
									<span style="font-size: 36px; color: #676767">668</span></br> </br> <span
										style="color: #676767">新增人数</span>
								</div>
							</div>
						</div>
						<div class="layui-col-md12">
							<div class="layui-col-md6">
								<div class="layui-card">
									<div class="layui-card-header">商品分类统计</div>
									<div class="layui-card-body">
										 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
										<div id="echartsMain1" style="width: 800px;height:560px;"></div>
									</div>
							</div>
							</div>
							<div class="layui-col-md6">
								<div class="layui-card">
									<div class="layui-card-header">商品分类统计</div>
									<div class="layui-card-body">
										<div id="echartsMain2" style="width: 800px;height:560px;"></div>
									</div>
								</div>
							</div>
						</div>
						
						
					</div>
				</div>

			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© 欢迎来到淘淘商城后台管理系统
		</div>
	</div>
	
	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart1 = echarts.init(document.getElementById('echartsMain1'));

       	// 指定图表的配置项和数据var option = {}
       	// 异步请求数据
       	// setOption使用刚指定的配置项和数据显示图表。
       	 $.get('/itemCat/statisticsItemCat').done(function (result) {
            myChart1.setOption({
            	title : {
    				text : '商品分类统计',
    				left : 'center'
    			},
    			tooltip : {
    				trigger : 'item',
    				formatter : '{a} <br/>{b} : {c} ({d}%)'
    			},
    			legend : {
    				orient : 'vertical',
    				left : 'left',
    				data : result.name
    			},
    			series : [ {
    				name : '访问来源',
    				type : 'pie',
    				radius : '72%',
    				center : [ '50%', '60%' ],
    				data : result,
    				emphasis : {
    					itemStyle : {
    						shadowBlur : 10,
    						shadowOffsetX : 0,
    						shadowColor : 'rgba(0, 0, 0, 0.5)'
    					}
    				}
    			} ]
            });
        })
	</script>

</body>
</html>