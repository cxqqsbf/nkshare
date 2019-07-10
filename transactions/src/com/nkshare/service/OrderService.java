package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.OrderMapper;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;

@Service
public class OrderService {
	@Autowired
	OrderMapper orderMapper;
	
	public List<Order> selectOrder(Order order) {
		List<Order> orderList = orderMapper.selectOrder(order);
		for(Order order1:orderList) {
			if(order1.getPay_state().equals("0")) {
				order1.setOperation("支付订单");
				order1.setGoods_operation("none");
				order1.setSignal("未支付");
			}
			else {
				order1.setOperation("none");
				order1.setGoods_operation("图书评价");
				order1.setSignal("已支付");
			}
		}
		return orderList;
	}
	
	public List<Order_info> selectOrderInfoById(String order_id){
		return orderMapper.selectOrderInfoById(order_id);
	}
	
	public Goods_info selectGoodsById(String goods_id) {
		return orderMapper.selectGoodsById(goods_id);
	}
}
