package com.yuri.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuri.bean.TbItem;
import com.yuri.bean.TbItemCat;
import com.yuri.common.EchartsResult;
import com.yuri.common.ZtreeNodeResult;
import com.yuri.mapper.TbItemCatMapper;
import com.yuri.mapper.TbItemMapper;
import com.yuri.service.TbItemCatService;

@Service
public class TbItemCatServiceImpl implements TbItemCatService{

	@Autowired
	private TbItemCatMapper tbItemCatMapper;
	@Autowired
	private TbItemMapper tbItemMapper;
	
	private String name;
	
	@Override
	public List<ZtreeNodeResult> findTbItemCatById(Long parentId) {
		List<TbItemCat> tbItemCats = tbItemCatMapper.findTbItemCatById(parentId);
		List<ZtreeNodeResult> result = new ArrayList<ZtreeNodeResult>();
		for (TbItemCat tbItemCat : tbItemCats) {
			ZtreeNodeResult node = new ZtreeNodeResult();
			node.setId(tbItemCat.getId());
			node.setName(tbItemCat.getName());
			node.setIsParent(tbItemCat.getIsParent());
			result.add(node);
		}
		return result;
	}

	@Override
	public List<EchartsResult> statisticsItemCat() {
		List<EchartsResult> results = new ArrayList<EchartsResult>();
		List<TbItem> tbItems = tbItemMapper.statisticsItemCId();
		for (TbItem tbItem : tbItems) {
			EchartsResult result = new EchartsResult();
			TbItemCat tbItemCat = tbItemCatMapper.getTbItemCatById(tbItem.getCid());
			getFirstItemCat(tbItemCat);
			result.setName(name+"类");
			int value = tbItemMapper.findTbItemCountByCId(tbItem.getCid());
			result.setValue(value);
			results.add(result);
		}
		return results;
	}
	
	private String getFirstItemCat(TbItemCat tbItemCat) {
		TbItemCat cat = tbItemCatMapper.getTbItemCatById(tbItemCat.getParentId());
		if(cat!=null){
			name = cat.getName();
			getFirstItemCat(cat);
		}
		return null;
	}
}
