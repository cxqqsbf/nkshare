package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.CommentMapper;
import com.nkshare.vo.Comment;

@Service
public class CommentService {
	@Autowired
	CommentMapper commentMapper;
	
	public int insertComment(Comment comment) {
		return commentMapper.insertComment(comment);
	}
	public List<Comment> selectUserComment(String user_id){
		return commentMapper.selectUserComment(user_id);
	}
	public List<Comment> selectGoodsComment(String goods_id){
		return commentMapper.selectGoodsComment(goods_id);
	}
	public int deleteComment(String comment_id) {
		return commentMapper.deleteComment(comment_id);
	}
}
