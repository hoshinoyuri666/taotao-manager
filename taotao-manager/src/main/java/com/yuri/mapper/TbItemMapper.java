package com.yuri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yuri.bean.TbItem;
import com.yuri.common.LayuiTableResult;

public interface TbItemMapper {
	/**
	 * 查询数据库中tbitem表 根据商品id查询商品信息
	 * @param tbItemId
	 * @return
	 */
	TbItem findTbItemById(Long tbItemId);
	/**
	 * 查询商品表总记录条数
	 * @return 商品表总记录条数
	 */
	int findTbItemCount();
	/**
	 * 分页显示商品信息
	 * @param index 当前索引
	 * @param pageSize 每一页显示的条数
	 * @return 分页的商品信息集合对象
	 * index 外界传进来的参数
	 */
	List<TbItem> findTbItemByPage(@Param("index") Integer index,@Param("pageSize") Integer pageSize);
	/**
	 * 根据商品id删除商品信息
	 * @param ids
	 * @return 如果返回的数据大于0表示删除成功
	 */
	int deleteItemByIds(@Param("ids") List<Long> ids);//写了@Param不用写parameterType
	/**
	 * 上架下架和删除方法 但是这个删除不是真的删除数据而是修改商品状态
	 * @param ids
	 * @param type
	 * @return 如果返回的数据大于0表示修改成功
	 */
	int updateItemByIds(@Param("ids") List<Long> ids,@Param("type") Integer type);
	
	List<TbItem> searchByKeyWord(@Param("keyWord") String keyWord,@Param("price") Long price);
	
	List<TbItem> searchByKeyWordByPage(@Param("keyWord") String keyWord,@Param("price") Long price,@Param("index") Integer index,@Param("pageSize") Integer pageSize);
}
