package com.yuri.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yuri.bean.TbItem;
import com.yuri.common.LayuiTableResult;
import com.yuri.common.TaotaoResult;
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

	@Override
	public TaotaoResult deleteItemByIds(List<TbItem> items) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem item : items) {
			ids.add(item.getId());
		}
		int count = tbItemMapper.deleteItemByIds(ids);
		if(count>0){
			return TaotaoResult.ok();
		}
		return TaotaoResult.build(500, "删除有误");
	}

	@Override
	public TaotaoResult updateItems(List<TbItem> items, Integer type) {
		List<Long> ids = new ArrayList<Long>();
		for (TbItem item : items) {
			ids.add(item.getId());
		}
		int count = tbItemMapper.updateItemByIds(ids, type);
		if(count>0&&type==0){
			return TaotaoResult.build(200, "商品下架成功");
		}else if(count>0&&type==1){
			return TaotaoResult.build(200, "商品上架成功");
		}else if(count>0&&type==2){
			return TaotaoResult.build(200, "商品删除成功");
		}
		return TaotaoResult.build(500, "操作有误");
	}

	@Override
	public List<TbItem> searchByKeyWord(String keyWord,Long price) {
		List<TbItem> items = tbItemMapper.searchByKeyWord(keyWord,price);
		return items;
	}

	@Override
	public LayuiTableResult searchByKeyWordByPage(String keyWord, Long price, Integer page, Integer limit) {
		LayuiTableResult result = new LayuiTableResult();
		result.setCode(0);
		result.setMsg("");
		List<TbItem> items = searchByKeyWord(keyWord,price);
		int count = 0;
		for (TbItem tbItem : items) {
			count++;
		}
		result.setCount(count);
		//分页的集合对象
		List<TbItem> data = tbItemMapper.searchByKeyWordByPage(keyWord,price,(page-1)*limit, limit);
		result.setData(data);
		return result;
	}

	



	

	


}
