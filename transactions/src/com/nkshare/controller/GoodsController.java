package com.nkshare.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.GoodsService;
import com.nkshare.vo.Goodss;

@Controller
public class GoodsController {
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/recommend", method=RequestMethod.POST)
	@ResponseBody
	public List<Goodss> getGoods(@RequestBody String category_id) {
		category_id = category_id.split("=")[1];
//		System.out.println(category_id);
		List<Goodss> goodss = goodsService.selectGoods(category_id);
//		for(Books books2:books) {
//			System.out.println(books2.getBook_id());
//		}
		return goodss;
	}
	@RequestMapping(value="/homepage",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView gotomyhomepage(HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("homepage");
        return mv;
	}
}
