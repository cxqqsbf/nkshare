package com.nkshare.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.UserCommentService;
import com.nkshare.vo.Goods;
import com.nkshare.vo.UserComment;

@Controller
public class UserCommentController {
	@Autowired
	UserCommentService usercommentservice;
	@RequestMapping(value="usercomment",method=RequestMethod.GET)
	public String commentlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		PageHelper.startPage(pn,10);
		List<UserComment> commentlist=usercommentservice.selectUserComment();
		PageInfo<UserComment> page = new PageInfo<UserComment>(commentlist);
		model.addAttribute("pageInfo",page);
		return "usercomment";
	}
	@RequestMapping(value="usercomment",method=RequestMethod.POST)
	public String showlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		String comment_id=req.getParameter("comment_id");
		usercommentservice.deleteComments(comment_id);
		return "usercomment";
	}
	@RequestMapping(value="usercomment1",method=RequestMethod.POST)
	public String searchlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		String search_word=req.getParameter("select");
		String selcomments=req.getParameter("selcomments");
		if(search_word.equals("1")) 
		{
			PageHelper.startPage(pn,10);
			List<Goods> goodlist=usercommentservice.selectGoodsbyName(selcomments);
			List<UserComment> commentlist=new ArrayList<UserComment>();
			if(!goodlist.isEmpty())
			{		
				for(Goods good:goodlist)
				{
					List<UserComment> comment=usercommentservice.selectUserCommentbyId((String)good.getGoods_id());
					for(UserComment com:comment)
					{
						commentlist.add(com);
					}
				}
			}
			PageInfo<UserComment> page = new PageInfo<UserComment>(commentlist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selcomments);
		}
		else if(search_word.equals("2"))
		{
			PageHelper.startPage(pn,10);
			List<UserComment> commentlist=usercommentservice.selectUserCommentbyTime(selcomments);
			PageInfo<UserComment> page = new PageInfo<UserComment>(commentlist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selcomments);
		}
		else if(search_word.equals("3"))
		{
			PageHelper.startPage(pn,10);
			List<UserComment> commentlist=usercommentservice.selectUserCommentbyUser(selcomments);
			PageInfo<UserComment> page = new PageInfo<UserComment>(commentlist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selcomments);
		}
		return "usercomment";
	}
}
