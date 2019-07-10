package com.nkshare.vo;

public class Record {
	private String record_id;
	private String user_id;
	private String goods_id;
	private String record_time;
	private Goodssinfo goodssinfo;
	public String getRecord_id() {
		return record_id;
	}
	public void setRecord_id(String record_id) {
		this.record_id = record_id;
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
	public String getRecord_time() {
		return record_time;
	}
	public void setRecord_time(String record_time) {
		this.record_time = record_time;
	}
	public Goodssinfo getGoodssinfo() {
		return goodssinfo;
	}
	public void setGoodssinfo(Goodssinfo goodssinfo) {
		this.goodssinfo = goodssinfo;
	}
	@Override
	public String toString() {
		return "Record [record_id=" + record_id + ", user_id=" + user_id + ", goods_id=" + goods_id + ", record_time="
				+ record_time + ", goodssinfo=" + goodssinfo + "]";
	}
}
