<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-2.1.0.min.js"></script>
</head>
<body>
	<input type="button" id="button1" value="点我查询手机对应的规格参数组和项">
</body>
<script type="text/javascript">
$("#button1").click(function(){
	$.ajax({
			//get请求会中文乱码
            type: "GET",
            url: "/test",
            //contentType: "application/json", //必须有  
            dataType: "json", //表示返回值类型 
            data: "itemCatId=560",
            success: function (msg) {
            	console.log(msg);
            }
	});
})
</script>
</html>