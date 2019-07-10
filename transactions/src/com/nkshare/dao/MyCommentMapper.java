package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.MyComment;

public interface MyCommentMapper {
  public List<MyComment> selectComment(String user_id);
  public int deleteComment(String comment_id);
}
