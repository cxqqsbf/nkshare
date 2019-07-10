package com.nkshare.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.Goods_service;
import com.nkshare.service.RecordService;
import com.nkshare.vo.Comment;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Record;
import com.nkshare.vo.User;

@Controller
public class Goods {
	@Autowired
	Goods_service service;
	@Autowired
	RecordService recordService;
	@RequestMapping(value="showgoods",method=RequestMethod.GET)
	public ModelAndView show_book(HttpServletRequest request,@RequestParam(value="pn",defaultValue="1") int pn) {
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pn,15);
		String goods_id=request.getParameter("goods_id");
		Goods_info goods=service.goods_info(goods_id);
		List<Comment> comment=service.goods_comment(goods_id);
		goods.setCategory_id(service.show_category(goods_id));
		if(goods != null) {
			mv.addObject("data", goods);
		}
		else {
			mv.addObject("goods_message", "none");
		}
		if(comment.size()!=0) {
			PageInfo page = new PageInfo(comment);
			mv.addObject("comment", page);
		}
		else {
			mv.addObject("comment_message", "none");
		}
		Record record = new Record();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user==null)
		{
			mv.setViewName("login");
			return mv;
		}
		else
		{
			String user_id = user.getUser_id();
			record.setUser_id(user_id);
			record.setGoods_id(goods_id);
			SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			record.setRecord_time(ft.format(new Date()));
			recordService.insertRecord(record);
			System.out.println(record.getRecord_time());
			mv.setViewName("goods_details");
			return mv;
		}
	}
}
