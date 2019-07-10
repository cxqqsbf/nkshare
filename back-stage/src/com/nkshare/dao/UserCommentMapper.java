package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Goods;
import com.nkshare.vo.UserComment;

public interface UserCommentMapper {
	public List<UserComment> selectUserComment();
	public List<UserComment> selectGoodsNamebyId(String goods_id);
	public List<Goods> selectGoodsbyName(String goods_name);
	public List<UserComment> selectUserCommentbyId(String goods_id);
	public List<UserComment> selectUserCommentbyTime(String comment_time);
	public List<UserComment> selectUserCommentbyUser(String user_id);
	public int deleteComments(String comment_id);
}
