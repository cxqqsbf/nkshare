package com.nkshare.vo;

public class MyComment {
	private String comment_id;
	private String user_id;
	private String goods_id;
	private String comment_time;
	private String content;
	private Goodssinfo goodssinfo;
	double score;
	
	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getComment_time() {
		return comment_time;
	}

	public void setComment_time(String comment_time) {
		this.comment_time = comment_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Goodssinfo getGoodssinfo() {
		return goodssinfo;
	}

	public void setGoodssinfo(Goodssinfo goodssinfo) {
		this.goodssinfo = goodssinfo;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "MyComment [comment_id=" + comment_id + ", user_id=" + user_id + ", goods_id=" + goods_id
				+ ", comment_time=" + comment_time + ", content=" + content + ", goodssinfo=" + goodssinfo + ", score="
				+ score + "]";
	}
}

