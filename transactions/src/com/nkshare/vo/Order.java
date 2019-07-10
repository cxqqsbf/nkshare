package com.nkshare.vo;

import java.util.List;

public class Order {
	private String order_id;
	private String user_id;
	private String address_id;
	private String pay_state;
	private String create_time;
	private String money;
	private List<Orders_info> orders_info;
	private String operation;
	private String signal;
	private String goods_operation;

	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getAddress_id() {
		return address_id;
	}
	public void setAddress_id(String address_id) {
		this.address_id = address_id;
	}
	public String getPay_state() {
		return pay_state;
	}
	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public List<Orders_info> getOrders_info() {
		return orders_info;
	}
	public void setOrders_info(List<Orders_info> orders_info) {
		this.orders_info = orders_info;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getSignal() {
		return signal;
	}
	public void setSignal(String signal) {
		this.signal = signal;
	}
	public String getGoods_operation() {
		return goods_operation;
	}
	public void setGoods_operation(String goods_operation) {
		this.goods_operation = goods_operation;
	}
	
	
}
