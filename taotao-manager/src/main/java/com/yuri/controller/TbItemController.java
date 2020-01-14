package com.yuri.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.TableStat.Mode;
import com.yuri.bean.TbItem;
import com.yuri.common.LayuiTableResult;
import com.yuri.common.TaotaoResult;
import com.yuri.service.TbItemService;

@Controller
@RequestMapping("/item")
public class TbItemController {
	@Autowired
	private TbItemService tbItemService;
	
	@RequestMapping("/{itemId}")
	@ResponseBody
	public TbItem findTbItemById(@PathVariable Long itemId){
		//@PathVariable接收请求路径中占位符的值
		TbItem tbItem = tbItemService.findTbItemById(itemId);
		return tbItem;
	}
	
	@RequestMapping("/showItemPage")
	@ResponseBody
	public LayuiTableResult findTbItemByPage(Integer page,Integer limit){
		LayuiTableResult result = tbItemService.findTbItemByPage(page, limit);
		return result;
	}
	
	@RequestMapping("/itemDelete")
	@ResponseBody
	public TaotaoResult deleteItemById(@RequestBody List<TbItem> items){
		//TaotaoResult result = tbItemService.deleteItemByIds(items);
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items,2,date);
		return result;
	}
	
	@RequestMapping("/upshelf")
	@ResponseBody
	public TaotaoResult upshelf(@RequestBody List<TbItem> items){
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items,1,date);
		return result;
	}
	
	@RequestMapping("/offshelf")
	@ResponseBody
	public TaotaoResult offshelf(@RequestBody List<TbItem> items){
		Date date = new Date();
		TaotaoResult result = tbItemService.updateItems(items,0,date);
		return result;
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public LayuiTableResult search(Integer page,Integer limit,String title,Integer minPrice,Integer maxPrice,Long cId){
		LayuiTableResult result = tbItemService.searchItems(page,limit,title,minPrice,maxPrice,cId);
		return result;
	}
}
