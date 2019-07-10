package com.nkshare.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class MyAddress {
	
	private String user_id;
	private String address_id;
	@NotBlank(message="收货人不能为空")
	private String name;
	@Pattern(regexp = "^1(3|4|5|7|8)\\d{9}$",message = "手机号码格式错误")
	private String telephone;
	private String province;
	private String city;
	private String details;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	@Override
	public String toString() {
		return "Address [user_id=" + user_id + ", address_id=" + address_id + ", name=" + name + ", telephone="
				+ telephone + ", provice=" + province + ", city=" + city + ", details=" + details + "]";
	}
}
