package com.nkshare.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.Goods_service;
import com.nkshare.vo.Category;

@Controller
public class Show_category {
	@Autowired
	Goods_service service;
	@RequestMapping(value="add_goods")
	public ModelAndView showcategory(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Category> categorylist = service.show_category();
		mv.addObject("categorylist", categorylist);
		mv.setViewName("add_goods");
		return mv;
	}
}
