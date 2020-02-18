package com.yuri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuri.bean.TbItemParamGroup;
import com.yuri.bean.TbItemParamValue;

public interface TbItemParamMapper {
	/**
	 * 根据分类id多表查询规格参数组和每个组对应的规格参数项
	 * @param cId 分类id
	 * @return 规格参数组和每一项对应的值
	 */
	List<TbItemParamGroup> findTbItemGroupByCId(Long cId);
	/**
	 * 往商品规格参数值表里写入数据
	 * @param tbItemParamValues
	 * @return
	 */
	int saveTbItemParamValue(@Param("tbItemParamValues")List<TbItemParamValue> tbItemParamValues);

}
