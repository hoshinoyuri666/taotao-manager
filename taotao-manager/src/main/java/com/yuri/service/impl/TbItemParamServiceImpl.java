package com.yuri.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuri.bean.TbItemParamGroup;
import com.yuri.common.TaotaoResult;
import com.yuri.mapper.TbItemParamMapper;
import com.yuri.service.TbItemParamService;
@Service
public class TbItemParamServiceImpl implements TbItemParamService {
	@Autowired
	private TbItemParamMapper tbItemParamMapper;
	
	@Override
	public TaotaoResult findTbItemGroupByCId(Long cId) {
		TaotaoResult result = new TaotaoResult();
		List<TbItemParamGroup> group= tbItemParamMapper.findTbItemGroupByCId(cId);
		if(group.size()<=0){
			result.setStatus(500);
			result.setMsg("该分类没有规格参数模板，请去创建规格参数模板");
			return result;
		}
		result.setStatus(200);
		result.setMsg("有规格参数模板");
		result.setData(group);
		return result;
	}

}
