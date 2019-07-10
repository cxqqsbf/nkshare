package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.GoodsMapper;
import com.nkshare.vo.Goodss;

@Service
public class GoodsService {
	@Autowired
	GoodsMapper goodsMapper;

	public List<Goodss> selectGoods(String categorie_id) {
		return goodsMapper.selectGoods(categorie_id);
	}
	
}
