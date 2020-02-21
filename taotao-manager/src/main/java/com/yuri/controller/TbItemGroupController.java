package com.yuri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuri.common.TaotaoResult;
import com.yuri.service.TbItemParamService;

@Controller
@RequestMapping("/itemGroup")
public class TbItemGroupController {
	@Autowired
	private TbItemParamService tbItemParamService;
	
	@RequestMapping("/showItemGroup")
	@ResponseBody
	public TaotaoResult findTbItemGroupByCId(Long cId){
		TaotaoResult result = tbItemParamService.findTbItemGroupByCId(cId);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/addGroup")
	@ResponseBody
	public TaotaoResult addItemParamTemplate(Long cId,String params){
		TaotaoResult result = tbItemParamService.addItemParamTemplate(cId,params);
		return result;
	}
}
