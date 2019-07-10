package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nkshare.dao.GoodsMapper;
import com.nkshare.vo.Categories;
import com.nkshare.vo.Goods;

@Service
public class GoodsService {
	@Autowired
	GoodsMapper goodsmapper;
	public List<Goods> selectGoods(){
		return goodsmapper.selectGoods();
	}
	@Transactional(rollbackFor={RuntimeException.class, Exception.class})
	public void deleteGoods(String goods_id)
	{
		goodsmapper.deleteGoods(goods_id);
		goodsmapper.deleteCategories(goods_id);
	}
	public Goods selectGoodsbyId(String goods_id)
	{
		return goodsmapper.selectGoodsbyId(goods_id);
	}
	public List<Categories> selectCategories(String goods_id)
	{
		return goodsmapper.selectCategories(goods_id);
	}
	public List<Categories> selectCategoriesbyName(String cate_name)
	{
		return goodsmapper.selectCategoriesbyName(cate_name);
	}
	public List<Goods> selectGoodsbyName(String goods_name)
	{
		return goodsmapper.selectGoodsbyName(goods_name);
	}
	public List<Goods> selectGoodsbyUserId(String user_id)
	{
		return goodsmapper.selectGoodsbyUserId(user_id);
	}
}
