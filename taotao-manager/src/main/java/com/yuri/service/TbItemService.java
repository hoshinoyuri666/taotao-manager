package com.yuri.service;

import com.yuri.bean.TbItem;

public interface TbItemService {
	/**
	 * 根据商品id查询指定商品信息
	 * @param tbItemId 商品id
	 * @return 指定商品id的商品信息
	 */
	TbItem findTbItemById(Long tbItemId);
}
