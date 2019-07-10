package com.nkshare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nkshare.dao.MyCommentMapper;
import com.nkshare.dao.MyGoodssMapper;
import com.nkshare.dao.RecordMapper;
import com.nkshare.vo.Comment;
import com.nkshare.vo.Goodssinfo;
import com.nkshare.vo.Record;

@Service
public class RecordService {
	@Autowired
	RecordMapper recordmapper;
	public List<Record> selectRecord(String user_id){
		return recordmapper.selectRecord(user_id);
	}
	public int deleterecord(String record_id)
	{
		return recordmapper.deleteRecord(record_id);
	}
	public Goodssinfo selectGoodsfor(String goods_id)
	{
		return recordmapper.selectGoodsfor(goods_id);
	}
	public List<Record> selecttimeRecord(String record_time)
	{
		return  recordmapper.selecttimeRecord(record_time);
	}
	public int insertRecord(Record record) {
		return recordmapper.insertRecord(record);
	}
}
