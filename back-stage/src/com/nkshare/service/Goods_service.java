package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nkshare.dao.Operation;
import com.nkshare.vo.Goods_category;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Category;

@Service
public class Goods_service {
	@Autowired
	Operation oper;
@Transactional
public void insert_goods(Goods_info goods) {
	oper.insert_goods(goods);
}
public List<Category> show_category(){
	return oper.show_category();
}
@Transactional
public void insert_goods_category(Goods_category goods_category) {
	oper.insert_goods_category(goods_category);
}
}
