package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Comment;

public interface CommentMapper {
	public int insertComment(Comment comment);
	public List<Comment> selectUserComment(String user_id);
	public List<Comment> selectGoodsComment(String goods_id);
	public int deleteComment(String comment_id);
}
