package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.OrderManaMapper;
import com.nkshare.vo.Order;

@Service
public class OrderManaService {
	@Autowired
	OrderManaMapper ordermanamapper;
	public List<Order> selectOrder()
	{
		return ordermanamapper.selectOrder();
	}
	public int deleteOrder(String order_id)
	{
		return ordermanamapper.deleteOrder(order_id);
	}
	public List<Order> selectOrderbyId(String order_id)
	{
		return ordermanamapper.selectOrderbyId(order_id);
	}
}
