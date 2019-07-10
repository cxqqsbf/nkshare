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
import com.nkshare.service.UserService;
import com.nkshare.vo.MyComment;
import com.nkshare.vo.User;

@Controller
public class MyCommentController {
	@Autowired
	MyCommentService commentservice;
	@RequestMapping(value="mycomment",method=RequestMethod.GET)
	public String gotomycomment(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		HttpSession session=req.getSession();
		User user1=(User) session.getAttribute("user"); 
		PageHelper.startPage(pn,5);
		List<MyComment> commentlist=commentservice.selectComment(user1.getUser_id());
		PageInfo page = new PageInfo(commentlist);
		model.addAttribute("pageInfo",page);
	/*	model.addAttribute("commentlist",commentlist);*/
		return "mycomment";
	}
	
	@RequestMapping(value="mycomment",method=RequestMethod.POST)
	@ResponseBody
	public int deletecomment(HttpServletRequest req) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		String comment_id=req.getParameter("comment_id");
		int result=commentservice.deletecomment(comment_id);
		return result;
	}
}
