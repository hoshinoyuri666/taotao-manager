package com.yuri.service;

import java.util.List;

import com.yuri.bean.TbContent;
import com.yuri.common.LayuiTableResult;
import com.yuri.common.ZtreeNodeResult;

public interface TbContentService {
	
	/**
	 * 根据parentId得到内容分类信息，并且把内容分类信息组装好ztree需要的数据
	 * @param parentId 分类父级类目id
	 * @return zTree需要的结果集
	 */
	List<ZtreeNodeResult> findTbContentById(Long parentId);

	/**
	 * 根据内容分类id查询内容信息
	 * @param categoryId 内容分类id
	 * @param page
	 * @param limit
	 * @return layui table表固定的json格式的数据
	 */
	LayuiTableResult findTbContentByCategoryId(Long categoryId, Integer page, Integer limit);

	/**
	 * 根据内容分类id删除内容信息 可以批量删除
	 * @param tbContents 需要删除的内容id 和 分类id
	 * @param page 当前页
	 * @param limit 每一页显示条数
	 * @return layui table表固定的json格式的数据
	 */
	LayuiTableResult deleteContentByCategroyIds(List<TbContent> tbContents, Integer page, Integer limit);

}
