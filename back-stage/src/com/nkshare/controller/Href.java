package com.nkshare.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Href {
	@RequestMapping(value="gotoregister")
	public ModelAndView gotoregister(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	@RequestMapping(value="gotoaddgoods")
	public ModelAndView gotoaddgoods(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("add_goods");
		return mv;
	}
	@RequestMapping(value="gotoadminmanage")
	public ModelAndView gotoadminmanage(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin_manage");
		return mv;
	}
	@RequestMapping(value="gotogoodsmanage")
	public ModelAndView gotogoodsmanage(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("goodsmanage");
		return mv;
	}
	@RequestMapping(value="gotousercomment")
	public ModelAndView gotorusercomment(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("usercomment");
		return mv;
	}
	@RequestMapping(value="gotousersmanage")
	public ModelAndView gotousersmanage(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("usersmanage");
		return mv;
	}
	@RequestMapping(value="gotoordersmanage")
	public ModelAndView gotoordersmanage(HttpServletRequest request) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ordersmanage");
		return mv;
	}
}
