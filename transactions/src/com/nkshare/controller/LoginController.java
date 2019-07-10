package com.nkshare.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.UserService;
import com.nkshare.vo.User;

@Controller
public class LoginController {
	@Autowired
	UserService userservice;
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String gotoLogin(Model model,HttpServletRequest req) throws IOException{
		User user=new User();
		model.addAttribute("user", user);
		return "login";
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ModelAndView Login(Model model,HttpServletRequest req,HttpServletResponse resp) throws IOException{
		ModelAndView mv=new ModelAndView();
		User user=new User();
		req.setCharacterEncoding("utf-8");
		String name= req.getParameter("username");
		String pwd= req.getParameter("password");
		String flag=req.getParameter("remember");
		User user1=userservice.selectUser(name);
		if(user1!=null)
		{
			if(!BCrypt.checkpw(pwd,user1.getPassword()))
			{
				req.setAttribute("message", "密码输入错误");
				mv.setViewName("login");
			}
			else
			{
				HttpSession session=req.getSession();
				session.setAttribute("user", user1);
				mv.setViewName("homepage");	
			}
		}
		else
		{
			req.setAttribute("message", "用户名不存在");
			mv.setViewName("login");
		}
		return mv;
	}
}
