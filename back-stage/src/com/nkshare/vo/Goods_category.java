package com.nkshare.vo;

public class Goods_category {
private String goods_id;
private String category_id;
private String category_name;
public String getCategory_name() {
	return category_name;
}
public void setCategory_name(String category_name) {
	this.category_name = category_name;
}
public String getGoods_id() {
	return goods_id;
}
public void setGoods_id(String goods_id) {
	this.goods_id = goods_id;
}
public String getCategory_id() {
	return category_id;
}
public void setCategory_id(String category_id) {
	this.category_id = category_id;
}
@Override
public String toString() {
	return "Goods_category [goods_id=" + goods_id + ", category_id=" + category_id + "]";
}
}
