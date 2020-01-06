package com.yuri.service;

import java.util.List;

import com.yuri.bean.TbItem;
import com.yuri.common.LayuiTableResult;

public interface TbItemService {
	/**
	 * 根据商品id查询指定商品信息
	 * @param tbItemId 商品id
	 * @return 指定商品id的商品信息
	 */
	TbItem findTbItemById(Long tbItemId);
	
	//查询商品表的总记录条数
	int findTbItemCount();
	
	/**
	 * 分页显示商品信息
	 * @param page 当前页 需要计算索引的
	 * @param limit 每一页显示的条数
	 * @return layui指定的json格式
	 */
	LayuiTableResult findTbItemByPage(Integer page,Integer limit);
}
