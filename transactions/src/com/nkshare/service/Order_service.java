package com.nkshare.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.Operation;
import com.nkshare.vo.Address;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;
@Service
public class Order_service {
	@Autowired
	Operation oper;
	public Order_info show_order(String goods_id) {
		Order_info order = new Order_info();
		order.setGoods(oper.show_order(goods_id));
		return order;
	}
	public List<Address> show_address(String user_id){
		return oper.show_address(user_id);
	}
	public void add_address(Address address) {
		oper.add_address(address);
	}
	public String create_number(String user_id) {
		SimpleDateFormat df = new SimpleDateFormat("MMddHHmmss");
		String order_number = df.format(new Date())+user_id;
		return order_number;
	}
	public void insert_order(Order order) {
		oper.insert_order(order);
	}
	public void insert_order_info(List<Order_info> orderlist) {
		for(Order_info order_info:orderlist) {
			oper.insert_order_info(order_info);
		}
	}
}
