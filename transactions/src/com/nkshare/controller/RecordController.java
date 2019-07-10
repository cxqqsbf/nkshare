package com.nkshare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.MyCommentService;
import com.nkshare.service.RecordService;
import com.nkshare.vo.Comment;
import com.nkshare.vo.Record;
import com.nkshare.vo.User;

@Controller
public class RecordController {
	@Autowired
	RecordService recordservice;
	@RequestMapping(value="allrecord",method=RequestMethod.POST)
	public String gotomyrecord(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		System.out.println("hello");
		HttpSession session=req.getSession();
		User user1=(User) session.getAttribute("user"); 
		PageHelper.startPage(pn,5);
		List<Record> recordlist=recordservice.selectRecord(user1.getUser_id());
		PageInfo page = new PageInfo(recordlist);
		model.addAttribute("pageInfo",page);
		return "record";
	}
	
	@RequestMapping(value="record",method=RequestMethod.POST)
	@ResponseBody
	public void deletecomment(HttpServletRequest req) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		String record_id=req.getParameter("record_id");
		int result=recordservice.deleterecord(record_id);
	}
	@RequestMapping(value="myrecord",method=RequestMethod.GET)
	public  ModelAndView seltimerecord(@RequestParam(value="pn",defaultValue="1") int pn,HttpServletRequest req) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		String record_time=req.getParameter("recorddate");
		System.out.println(record_time);
		HttpSession session=req.getSession();
		User user1=(User) session.getAttribute("user"); 
		if(record_time!=null&&record_time!="")
		{
			PageHelper.startPage(pn,5);
			List<Record> recordlist=recordservice.selecttimeRecord(record_time);
			PageInfo page = new PageInfo(recordlist);
			mv.addObject("pageInfo", page);
			req.setAttribute("date", record_time);
		}
		else
		{
			System.out.println(1);
			PageHelper.startPage(pn,5);
			List<Record> recordlist=recordservice.selectRecord(user1.getUser_id());
			PageInfo page = new PageInfo(recordlist);
			mv.addObject("pageInfo", page);
		}
		mv.setViewName("record");
		return mv;
	}
}
