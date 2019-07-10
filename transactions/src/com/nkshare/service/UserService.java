package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.UserMapper;
import com.nkshare.vo.User;


@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	public User selectUser(String id){
		return userMapper.selectUser(id);
	}
	public int updateUser(User user)
	{
		return userMapper.updateUser(user);
	}
	public int insertUser(User user)
	{
		return userMapper.insertUser(user);
	}
	public int updatePwd(User user)
	{
		return userMapper.updatePwd(user);
	}
}
