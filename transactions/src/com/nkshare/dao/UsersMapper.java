package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.GoodsSearch;
import com.nkshare.vo.User;

public interface UsersMapper {
	public String selectUserByGoodsId(String id);
	public List<User> selectUsersById(GoodsSearch booksearch);
}
