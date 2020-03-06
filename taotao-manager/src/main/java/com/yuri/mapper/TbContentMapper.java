package com.yuri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuri.bean.TbContent;
import com.yuri.bean.TbContentCategory;


public interface TbContentMapper {
	
	/**
	 * 根据父级id查询内容分类信息 得到内容分类信息集合对象
	 * @param parentId 内容分类父级id
	 * @return 内容分类信息集合对象
	 */
	List<TbContentCategory> findTbContentByParentId(Long parentId);

	/**
	 * 根据分类id来查询内容总记录条数
	 * @param categoryId 分类id
	 * @return 该分类id所属内容的总记录条数
	 */
	int findTbContentCountByCategoryId(Long categoryId);

	/**
	 * 根据内容分类id查询内容信息
	 * @param categoryId 分类id
	 * @param index 当前索引
	 * @param pageSize 每页显示条数
	 * @return 指定内容分类id下的内容信息
	 */
	List<TbContent> findTbContentByCategoryId(@Param("categoryId")Long categoryId,@Param("index") Integer index,@Param("pageSize") Integer pageSize);
	
	/**
	 * 根据内容id 删除内容信息 
	 * @param ids 需要删除的id集合
	 * @return
	 */
	int deleteContent(@Param("ids")List<Long> ids);
}
