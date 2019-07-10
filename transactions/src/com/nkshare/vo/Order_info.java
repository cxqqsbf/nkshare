package com.nkshare.vo;


public class Order_info {
	private String goods_num;
	private String order_id;
	private String goods_id;
	private String goods_price;
	private Goods_info goods;
	private Address address;
	public String getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(String goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public Goods_info getGoods() {
		return goods;
	}
	public void setGoods(Goods_info goods) {
		this.goods = goods;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Order_info [goods_num=" + goods_num + ", order_id=" + order_id + ", goods_id=" + goods_id + ", goods_price="
				+ goods_price + ", goods=" + goods + ", address=" + address + "]";
	}



}
