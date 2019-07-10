package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.Operation;
import com.nkshare.vo.Comment;
import com.nkshare.vo.Goods_info;
@Service
public class Goods_service {
	@Autowired
	Operation oper;
	public  Goods_info goods_info(String goods_id) {	
		return oper.show_goods_info(goods_id);
	}
	public List<Comment> goods_comment(String goods_id) {
		return oper.show_goods_comment(goods_id);
	}
	public String show_category(String goods_id) {
		String name = "";
		System.out.println(oper.show_category(goods_id));
		for(String a:oper.show_category(goods_id)) {
			name+=oper.show_category_name(a)+" ";
		}
		System.out.println(name);
		return name;
	}
}
