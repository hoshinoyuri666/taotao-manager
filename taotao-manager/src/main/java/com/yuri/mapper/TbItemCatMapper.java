package com.yuri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuri.bean.TbItemCat;

public interface TbItemCatMapper {
	/**
	 * 根据parentid 查询商品分类信息
	 * @param parentId 商品分类信息parentid 或者是页面传递过来的id
	 * @return 商品分类信息集合对象
	 */
	List<TbItemCat> findTbItemCatById(Long parentId);

	/**
	 * 根据商品分类id查询商品分类信息
	 * @param id
	 * @return
	 */
	TbItemCat getTbItemCatById(@Param("id")Long id);

}
