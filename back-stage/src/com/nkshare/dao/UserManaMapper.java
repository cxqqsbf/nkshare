package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.User;

public interface UserManaMapper {
	public List<User> selectUser();
	public int  deleteUser(String user_id);
	public List<User> selectUserbyId(String user_id);
}
