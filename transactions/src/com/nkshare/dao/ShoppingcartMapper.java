package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Shoppingcart;

public interface ShoppingcartMapper {
	public List<Shoppingcart> selectShoppingcart(Shoppingcart shoppingcart);
	public void updateGoods_num(Shoppingcart shoppingcart);
	public void deleteShoppingcart(Shoppingcart shoppingcart);
	public void insertShoppingcart(Shoppingcart shoppingcart);
	public String selectGoods_num(Shoppingcart shoppingcart);
	public List<Goods_info> selectGoodssById(String book_id);
}
