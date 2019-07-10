package com.nkshare.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.Admin_service;
import com.nkshare.vo.Admin_info;

@Controller
public class Login_Register {
	@Autowired
	Admin_service service;
	@RequestMapping(value="register",method=RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		Admin_info admin_info = new Admin_info();
		admin_info.setTelephone(request.getParameter("telephone"));
		admin_info.setEmail(request.getParameter("email"));
		admin_info.setNickname(request.getParameter("nickname"));
		admin_info.setPassword(request.getParameter("password"));
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		admin_info.setAdmin_id(df.format(new Date()));
		service.insert_admin(admin_info);
		mv.setViewName("login");
		return mv;
	}
	@RequestMapping(value="login",method=RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("1");
		ModelAndView mv = new ModelAndView();
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("password");
		System.out.println(password);
		System.out.println(service.show_password(nickname));
		if(service.show_password(nickname)!=null) {
			if(password.equals(service.show_password(nickname))) {
				List<Admin_info> admin = service.show_admin();
				mv.addObject("goods_sum", service.show_goods_num());
				mv.addObject("admin_num",admin.size());
				mv.addObject("adminlist", admin);
				mv.setViewName("admin_manage");
			}
			else {
				mv.addObject("data","密码错误");
				mv.setViewName("login");
			}
		}else {
			mv.addObject("data", "该用户名不存在");
			mv.setViewName("login");
		}
		return mv;
	}
}
