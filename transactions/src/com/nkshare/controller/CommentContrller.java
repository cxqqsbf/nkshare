package com.nkshare.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.CommentService;
import com.nkshare.vo.Comment;
import com.nkshare.vo.User;

@Controller
public class CommentContrller {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/order_comment",method=RequestMethod.GET)
	public ModelAndView gotoAddress(Comment comment) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		String goods_id = request.getParameter("goods_id");
		comment.setUser_id(user_id);
		comment.setGoods_id(goods_id);
		comment.setComment_id(user_id+new Date().getTime());
		comment.setScore(5.0);
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd");
		comment.setComment_time(ft.format(new Date()));
		commentService.insertComment(comment);
		mv.setViewName("myorder");
		return mv;
	}
	
	@RequestMapping(value="/order_comment",method=RequestMethod.POST)
	public ModelAndView getComment(Comment comment) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		System.out.println(request.getParameter("scores"));
		double scores = new Double(request.getParameter("scores"));
		comment.setUser_id(user_id);
		comment.setScore(scores);
		comment.setComment_id(user_id+new Date().getTime());
		SimpleDateFormat ft = new SimpleDateFormat("yyyy/MM/dd");
		comment.setComment_time(ft.format(new Date()));
		commentService.insertComment(comment);
		mv.setViewName("myorder");
		return mv;
	}
}
