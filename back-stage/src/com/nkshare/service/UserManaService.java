package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.UserManaMapper;
import com.nkshare.vo.User;

@Service
public class UserManaService {
	@Autowired
	UserManaMapper usermanamapper;
	public List<User> selectUser(){
		return usermanamapper.selectUser();
	}
	public int deleteUser(String user_id)
	{
		return usermanamapper.deleteUser(user_id);
	}
	public List<User> selectUserbyId(String user_id)
	{
		return usermanamapper.selectUserbyId(user_id);
	}
}
