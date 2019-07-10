package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.User;

public interface UserMapper {
	public User selectUser(String id);
	public int  updateUser(User user);
	public int  insertUser(User user);
	public int  updatePwd(User user);
}
