package com.nkshare.vo;

public class Order {
	private String order_id;
	private String user_id;
	private String address_id;
	private String pay_state;
	private String create_time;
	private String money;
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
	public String toString() {
		return "Order [order_id=" + order_id + ", user_id=" + user_id + ", address_id=" + address_id + ", pay_state=" + pay_state + ", create_time=" + create_time + ", money=" + money + "]";
	}
}
