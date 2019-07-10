package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;

public interface OrderMapper {
	public List<Order> selectOrder(Order order);
	public List<Order_info> selectOrderInfoById(String order_id);
	public Goods_info selectGoodsById(String goods_id);
}
