package com.yuri.service;

import com.yuri.common.TaotaoResult;

public interface TbItemParamService {
	/**
	 * 根据分类id查询规格参数组和每一个组对应的规格参数项并且把数据封装到TaotaoResult里返回给页面
	 * @param cId 分类id
	 * @return 里面包含了规格参数组和规格参数项数据 以及状态码200 和描述信息msg
	 */
	TaotaoResult findTbItemGroupByCId(Long cId);
	/**
	 * 添加商品规格参数模板
	 * @param cId 分类id
	 * @param params 组和项的字符串 需要我们自己分割的
	 * @return 如果为200则表示添加成功，500为添加失败，消息在msg里面
	 */
	TaotaoResult addItemParamTemplate(Long cId, String params);

}
