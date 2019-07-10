package com.nkshare.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.CategoriesMapper;
import com.nkshare.dao.GoodssMapper;
import com.nkshare.dao.UserMapper;
import com.nkshare.dao.UsersMapper;
import com.nkshare.vo.Categories;
import com.nkshare.vo.GoodsSearch;
import com.nkshare.vo.Goodss;
import com.nkshare.vo.User;


@Service
public class GoodsSearchService {
	@Autowired
	GoodssMapper goodssMapper;				
	public List<Goodss> selectGoodssByName(GoodsSearch goodssearch){
		return goodssMapper.selectGoodssByName(goodssearch);
	}
	
	@Autowired
	UsersMapper userMapper;
	public List<Goodss> selectGoodssByUser(GoodsSearch goodssearch) {
		return goodssMapper.selectGoodssByUserId(goodssearch);
	}
	
	@Autowired
	CategoriesMapper categoriesMapper;
	public List<Goodss> selectGoodssByCategory(GoodsSearch goodssearch) {
		List<Categories> cList =  categoriesMapper.selectCategoriesByName(goodssearch);
		List<Goodss> bList = new ArrayList<Goodss>();
		for(Categories categories:cList) {
			bList.add(goodssMapper.selectGoodssById(categories.getGoods_id()));
		}
		return bList;
	}
	
	
	
	public List<Goodss> selectGoodssByAll(GoodsSearch goodssearch) {
		List<User> aList =  userMapper.selectUsersById(goodssearch);
		List<Goodss> bList = goodssMapper.selectGoodssByName(goodssearch);
		List<Categories> cList =  categoriesMapper.selectCategoriesByName(goodssearch);
		List<Goodss> goodsList = new ArrayList<Goodss>();
		goodsList=goodssMapper.selectGoodssByUserId(goodssearch);
		for(Goodss goods:bList) {
			goodsList.add(goodssMapper.selectGoodssById(goods.getGoods_id()));
		}
		for(Categories categories:cList) {
			goodsList.add(goodssMapper.selectGoodssById(categories.getGoods_id()));
		}
		for (int i = 0; i < goodsList.size() - 1; i++) {
			for (int j = goodsList.size() - 1; j > i; j--) {
				if (goodsList.get(j).getGoods_id().equals(goodsList.get(i).getGoods_id())) {
					goodsList.remove(j);
				}
			}
		}
		return goodsList;
	}
}
