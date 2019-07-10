package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.GoodsSearch;
import com.nkshare.vo.Goodss;

public interface GoodssMapper {
	public List<Goodss> selectGoodssByName(GoodsSearch goodssearch);
	public Goodss selectGoodssById(String goods_id);
	public List<Goodss> selectGoodssByUserId(GoodsSearch goodssearch);
}
