package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Categories;
import com.nkshare.vo.Goods;

public interface GoodsMapper {
	public List<Goods> selectGoods();
	public int deleteGoods(String goods_id);
	public List<Categories> selectCategories(String goods_id);
	public int deleteCategories(String goods_id);
	public Goods selectGoodsbyId(String goods_id);
	public List<Goods> selectGoodsbyName(String goods_name);
	public List<Goods> selectGoodsbyUserId(String user_id);
	public List<Categories> selectCategoriesbyName(String cate_name);
}
