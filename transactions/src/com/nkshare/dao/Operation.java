package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Address;
import com.nkshare.vo.Comment;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;

public interface Operation {
public Goods_info show_goods_info(String goods_id);
public List<Comment> show_goods_comment(String goods_id);
public Goods_info show_order(String goods_id);
public List<Address> show_address(String user_id);
public void add_address(Address address);
public void insert_order(Order order);
public void insert_order_info(Order_info order_info);
public List<String> show_category(String goods_id);
public String show_category_name(String category_id);
}
