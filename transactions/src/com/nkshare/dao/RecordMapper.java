package com.nkshare.dao;

import java.util.List;

import com.nkshare.vo.Comment;
import com.nkshare.vo.Goodssinfo;
import com.nkshare.vo.Record;

public interface RecordMapper {
	public List<Record> selectRecord(String user_id);
	 public int deleteRecord(String record_id);
	 public Goodssinfo selectGoodsfor(String goods_id);
	 public List<Record> selecttimeRecord(String record_time);
	 public int insertRecord(Record record);
}
