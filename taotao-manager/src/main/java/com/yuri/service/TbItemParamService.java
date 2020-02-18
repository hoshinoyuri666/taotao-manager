package com.yuri.service;

import com.yuri.common.TaotaoResult;

public interface TbItemParamService {
	/**
	 * 根据分类id查询规格参数组和每一个组对应的规格参数项并且把数据封装到TaotaoResult里返回给页面
	 * @param cId 分类id
	 * @return 里面包含了规格参数组和规格参数项数据 以及状态码200 和描述信息msg
	 */
	TaotaoResult findTbItemGroupByCId(Long cId);

}
