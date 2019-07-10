package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Admin_info;
import com.nkshare.vo.Goods_category;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Category;

public interface Operation {
public List<Category> show_category();
public void insert_goods(Goods_info goods);
public void insert_goods_category(Goods_category goods_category);
public List<Admin_info> show_admin();
public List<String> show_goods_num();
public void insert_admin(Admin_info admin_info);
public String show_password(String nickname);
}
