package com.nkshare.vo;

public class Goods_info {
private String goods_name;
private String pre_price;
private String rel_price;
private String image_path;
private String details_path;
private String goods_id;
private String user_id;
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
public String getPre_price() {
	return pre_price;
}
public void setPre_price(String pre_price) {
	this.pre_price = pre_price;
}
public String getRel_price() {
	return rel_price;
}
public void setRel_price(String rel_price) {
	this.rel_price = rel_price;
}
public String getImage_path() {
	return image_path;
}
public void setImage_path(String image_path) {
	this.image_path = image_path;
}
public String getDetails_path() {
	return details_path;
}
public void setDetails_path(String details_path) {
	this.details_path = details_path;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
@Override
public String toString() {
	return "Goods_info [goods_name=" + goods_name + ", pre_price=" + pre_price + ", rel_price=" + rel_price + ", image_path=" + image_path + ", details_path=" + details_path + ", goods_id=" + goods_id + ", user_id=" + user_id + "]";
}
}