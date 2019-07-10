package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nkshare.dao.Operation;
import com.nkshare.vo.Admin_info;

@Service
public class Admin_service {
	@Autowired
	Operation oper;
	public List<Admin_info> show_admin(){
		return oper.show_admin();
	}
	public int show_goods_num() {
		return oper.show_goods_num().size();
	}
	@Transactional
	public void insert_admin(Admin_info admin_info) {
		oper.insert_admin(admin_info);
	}
	public String show_password(String nickname) {
		return oper.show_password(nickname);
	}
}
