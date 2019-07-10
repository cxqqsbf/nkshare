package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.MyCommentMapper;
import com.nkshare.dao.MyGoodssMapper;
import com.nkshare.dao.UserMapper;
import com.nkshare.vo.Goodssinfo;
import com.nkshare.vo.MyComment;
import com.nkshare.vo.User;

@Service
public class MyCommentService {
	@Autowired
	MyCommentMapper commentMapper;
	@Autowired
	MyGoodssMapper goodssMapper;
	public List<MyComment> selectComment(String user_id){
		return commentMapper.selectComment(user_id);
	}
	public int deletecomment(String comment_id)
	{
		return commentMapper.deleteComment(comment_id);
	}
	public Goodssinfo selectgoods(String goods_id)
	{
		return goodssMapper.selectGoodsById(goods_id);
	}
}
