package com.nkshare.vo;

public class Orders_info {
	private String orders_id;
	private String goods_id;
	private int goods_num;
	private Goods_info goodss;
	public String getOrders_id() {
		return orders_id;
	}
	public void setOrders_id(String orders_id) {
		this.orders_id = orders_id;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public Goods_info getGoodss() {
		return goodss;
	}
	public void setGoodss(Goods_info goodss) {
		this.goodss = goodss;
	}
	@Override
	public String toString() {
		return "Orders_info [orders_id=" + orders_id + ", goods_id=" + goods_id + ", goods_num=" + goods_num + ", goodss="
				+ goodss + "]";
	}
	
	
}
