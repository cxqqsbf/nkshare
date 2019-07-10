package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.PaymentMapper;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;

@Service
public class PaymentService {
	@Autowired
	PaymentMapper paymentMapper;
	
	public Order selectOrder(String order_id) {
		Order order = paymentMapper.selectOrder(order_id);
		return order;
	}
	
	public List<Order_info> selectOrderInfoById(String order_id){
		return paymentMapper.selectOrderInfoById(order_id);
	}
	
	public Goods_info selectGoodsById(String goods_id) {
		return paymentMapper.selectGoodsById(goods_id);
	}
	
	public void updateOrder(String order_id) {
		paymentMapper.updateOrder(order_id);
	}
}
