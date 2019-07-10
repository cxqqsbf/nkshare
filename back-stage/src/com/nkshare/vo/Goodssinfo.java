package com.nkshare.vo;

public class Goodssinfo {
	private String goods_id;
	private String goods_name;
	private String image_path;
	private String rel_price;
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
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getRel_price() {
		return rel_price;
	}
	public void setRel_price(String rel_price) {
		this.rel_price = rel_price;
	}
	@Override
	public String toString() {
		return "Goodssinfo [goods_id=" + goods_id + ", goods_name=" + goods_name + ", image_path=" + image_path + ", rel_price=" + rel_price + "]";
	}
}
