package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Goodss;

public interface GoodsMapper {
	public List<Goodss> selectGoods(String categorie_id);
}
