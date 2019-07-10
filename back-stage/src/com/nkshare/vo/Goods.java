package com.nkshare.vo;

import java.util.List;

public class Goods {
	private String goods_id;
	private String goods_name;
	private String rel_price;
	private String category_id;
	private String user_id;
	private List<Categories> cate;
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getRel_price() {
		return rel_price;
	}
	public void setRel_price(String rel_price) {
		this.rel_price = rel_price;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public List<Categories> getCate() {
		return cate;
	}
	public void setCate(List<Categories> cate) {
		this.cate = cate;
	}
	@Override
	public String toString() {
		return "Goods [goods_id=" + goods_id + ", goods_name=" + goods_name + ", rel_price=" + rel_price + ", category_id=" + category_id + ", user_id=" + user_id + ", cate=" + cate + "]";
	}
}
