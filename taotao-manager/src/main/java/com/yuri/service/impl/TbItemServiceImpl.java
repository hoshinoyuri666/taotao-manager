package com.yuri.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuri.bean.TbItem;
import com.yuri.common.LayuiTableResult;
import com.yuri.mapper.TbItemMapper;
import com.yuri.service.TbItemService;
@Service
public class TbItemServiceImpl implements TbItemService {
	@Autowired
	private TbItemMapper tbItemMapper;
	
	@Override
	public TbItem findTbItemById(Long tbItemId) {
		TbItem tbItem = tbItemMapper.findTbItemById(tbItemId);
		return tbItem;
	}

	@Override
	public int findTbItemCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public LayuiTableResult findTbItemByPage(Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		result.setCode(0);
		result.setMsg("");
		int count = tbItemMapper.findTbItemCount();
		result.setCount(count);
		//分页的集合对象
		List<TbItem> data = tbItemMapper.findTbItemByPage((page-1)*limit, limit);
		result.setData(data);
		return result;
	}



	

	


}
