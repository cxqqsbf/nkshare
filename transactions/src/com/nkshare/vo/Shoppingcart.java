package com.nkshare.vo;

import java.util.List;

public class Shoppingcart {
	private String user_id;
	private String goods_id;
	private String goods_num;
	private List<Goodss> goodssList;
	private List<Categories> categoriesList;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public List<Goodss> getGoodssList() {
		return goodssList;
	}
	public void setGoodssList(List<Goodss> goodssList) {
		this.goodssList = goodssList;
	}
	public List<Categories> getCategoriesList() {
		return categoriesList;
	}
	public void setCategoriesList(List<Categories> categoriesList) {
		this.categoriesList = categoriesList;
	}
	@Override
	public String toString() {
		return "Shoppingcart [user_id=" + user_id + ", goods_id=" + goods_id + ", goods_num=" + goods_num + ", goodssList="
				+ goodssList + ",  categoriesList=" + categoriesList + "]";
	}
	
}
