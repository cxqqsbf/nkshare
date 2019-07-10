package com.nkshare.dao;
import com.nkshare.vo.Goodssinfo;
public interface MyGoodssMapper {
	public Goodssinfo selectGoodsById(String goods_id);
}
