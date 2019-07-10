package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;

public interface PaymentMapper {
	public Order selectOrder(String order_id);
	public List<Order_info> selectOrderInfoById(String orders_id);
	public Goods_info selectGoodsById(String goods_id);
	public void updateOrder(String order_id);
}
