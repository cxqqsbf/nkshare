package com.nkshare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.UserManaService;
import com.nkshare.vo.User;

@Controller
public class UserManaController {
	@Autowired
	UserManaService usermanaservice;
	@RequestMapping(value="usermana",method=RequestMethod.GET)
	public String userlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		String user_id=req.getParameter("seluser_id");
		if(user_id!=null&&user_id!="")
		{
			System.out.println("1");
			PageHelper.startPage(pn,10);
			List<User> list=usermanaservice.selectUserbyId(user_id);
			PageInfo<User> page = new PageInfo<User>(list);
			model.addAttribute("pageInfo",page);
		}
		else
		{
			System.out.println("2");
			PageHelper.startPage(pn,10);
			List<User> list=usermanaservice.selectUser();
			PageInfo<User> page = new PageInfo<User>(list);
			model.addAttribute("pageInfo",page);
		}
		return "usersmanage";
	}
	
	@RequestMapping(value="usermana",method=RequestMethod.POST)
	@ResponseBody
	public void deletecomment(HttpServletRequest req) throws IllegalStateException, IOException {
		String user_id=req.getParameter("user_id");
		usermanaservice.deleteUser(user_id);
	}
}
