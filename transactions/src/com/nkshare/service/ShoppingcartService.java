package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.ShoppingcartMapper;
import com.nkshare.vo.Shoppingcart;

@Service
public class ShoppingcartService {
	@Autowired
	ShoppingcartMapper shoppingcartMapper;
	
	public List<Shoppingcart> selectShoppingcart(Shoppingcart shoppingcart) {
		return shoppingcartMapper.selectShoppingcart(shoppingcart);
	}
	
	public void updateGoods_num(Shoppingcart shoppingcart) {
		shoppingcartMapper.updateGoods_num(shoppingcart);
	}
	
	public void deleteShoppingcart(Shoppingcart shoppingcart) {
		shoppingcartMapper.deleteShoppingcart(shoppingcart);
	}
	
	public void insertShoppingcart(Shoppingcart shoppingcart) {
		String check = selectGoods_num(shoppingcart);
		if(check!= null) {
			shoppingcartMapper.updateGoods_num(shoppingcart);
		}
		else {
			shoppingcartMapper.insertShoppingcart(shoppingcart);
		}
	}
	
	public String selectGoods_num(Shoppingcart shoppingcart) {
		return shoppingcartMapper.selectGoods_num(shoppingcart);
	}
}
