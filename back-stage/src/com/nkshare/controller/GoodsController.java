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
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.GoodsService;
import com.nkshare.vo.Categories;
import com.nkshare.vo.Goods;

@Controller
public class GoodsController {
	@Autowired
	GoodsService goodsservice;
	@RequestMapping(value="goodsmanage",method=RequestMethod.GET)
	public String goodslist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		PageHelper.startPage(pn,10);
		List<Goods> goodslist=goodsservice.selectGoods();
		PageInfo<Goods> page = new PageInfo<Goods>(goodslist);
		model.addAttribute("pageInfo",page);
		return "goodsmanage";
	}
	@RequestMapping(value="goodsmanage2",method=RequestMethod.POST)
	public String showlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		PageHelper.startPage(pn,10);
		List<Goods> goodslist=goodsservice.selectGoods();
		PageInfo<Goods> page = new PageInfo<Goods>(goodslist);
		model.addAttribute("pageInfo",page);
		return "goodsmanage";
	}
	@RequestMapping(value="goodsmanage",method=RequestMethod.POST)
	@ResponseBody
	public void deletecomment(HttpServletRequest req) throws IllegalStateException, IOException {
		String goods_id=req.getParameter("goods_id");
		goodsservice.deleteGoods(goods_id);
	}
	@RequestMapping(value="goodsmana1",method=RequestMethod.POST)
	public String searchlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException{
		String search_word=req.getParameter("select");
		String selgoods=req.getParameter("selgoodss");
		if(search_word.equals("1")) 
		{
			PageHelper.startPage(pn,10);
			List<Goods> goodslist=goodsservice.selectGoodsbyName(selgoods);
			PageInfo<Goods> page = new PageInfo<Goods>(goodslist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selgoods);
		}
		else if(search_word.equals("2"))
		{
			PageHelper.startPage(pn,10);
			List<Goods> goodlist=goodsservice.selectGoodsbyUserId(selgoods);
			PageInfo<Goods> page = new PageInfo<Goods>(goodlist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selgoods);
		}
		else if(search_word.equals("3"))
		{
			PageHelper.startPage(pn,10);
			List<Categories> catelist=goodsservice.selectCategoriesbyName(selgoods);
			List<Goods> goodlist=new ArrayList<Goods>();
			for(Categories cate:catelist)
			{
				Goods goods=goodsservice.selectGoodsbyId(cate.getGoods_id());
				goodlist.add(goods);
			}
			PageInfo<Goods> page = new PageInfo<Goods>(goodlist);
			model.addAttribute("pageInfo",page);
			model.addAttribute("msg",selgoods);
		}
		return "goodsmanage";
	}
}
