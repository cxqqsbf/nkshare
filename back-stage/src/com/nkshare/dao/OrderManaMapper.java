package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Order;

public interface OrderManaMapper {
	public List<Order> selectOrder();
	public int deleteOrder(String order_id);
	public List<Order> selectOrderbyId(String order_id);
}
