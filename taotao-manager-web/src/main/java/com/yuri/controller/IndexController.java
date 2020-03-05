package com.yuri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuri.common.ItemCatResult;
import com.yuri.common.JsonUtils;
import com.yuri.service.TbItemCatService;

@Controller
public class IndexController {
	@Autowired
	private TbItemCatService tbItemCatService;
	
	@RequestMapping("/index")
	public String showIndex(){
		/**
		 * 查询数据库 得到url 得到宽高
		 * 然后组装成web程序员需要的数据变成json格式发送到页面
		 * 由web程序员解析json数据 绑定数据
		 */
		return "index";
	}
	
	@RequestMapping("/itemcat/all")
	@ResponseBody
	public String getItemCats(){
		//html页面直接响应对象的json格式 响应不了 会报406
		//但是web.xml里必须要拦截.html 这是伪静态化的技术 因为网站seo优化 静态页面会排名靠前
		//这个对象 是我想要返回给页面的json格式的字符串
		//默认id=0 请求一级分类数据 遍历也是遍历一级分类数据
		ItemCatResult result = tbItemCatService.getItemCats(0L);
		/**
		 * string返回类型配合@ResponseBody注解以后
		 * 返回什么字符串 他就不会跳转页面 而是把这个字符串 输出到页面上面
		 * 那么我的想法是 把这个对象 自己改变json格式的字符串 返回到页面就行了
		 * jackson帮我们做好了的
		 */
		String json = JsonUtils.objectToJson(result);
		
		return json;
	}
}
