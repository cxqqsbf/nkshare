package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.UserCommentMapper;
import com.nkshare.vo.Goods;
import com.nkshare.vo.UserComment;

@Service
public class UserCommentService {
	@Autowired
	UserCommentMapper usercommentmapper;
	public List<UserComment> selectUserComment()
	{
		return usercommentmapper.selectUserComment();
	}
	public List<UserComment> selectGoodsNamebyId(String goods_id)
	{
		return usercommentmapper.selectGoodsNamebyId(goods_id);
	}
	public List<Goods> selectGoodsbyName(String goods_name)
	{
		return usercommentmapper.selectGoodsbyName(goods_name);
	}
	public List<UserComment> selectUserCommentbyId(String goods_id)
	{
		return usercommentmapper.selectUserCommentbyId(goods_id);
	}
	public List<UserComment> selectUserCommentbyTime(String comment_time)
	{
		return usercommentmapper.selectUserCommentbyTime(comment_time);
	}
	public List<UserComment> selectUserCommentbyUser(String user_id)
	{
		return usercommentmapper.selectUserCommentbyUser(user_id);
	}
	public int deleteComments(String comment_id)
	{
		return usercommentmapper.deleteComments(comment_id);
	}
}
