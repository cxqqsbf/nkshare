package com.nkshare.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.ShoppingcartService;
import com.nkshare.vo.Shoppingcart;
import com.nkshare.vo.User;

@Controller
public class ShoppingcartController {
	@Autowired
	private ShoppingcartService shoppingcartService;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/shoppingcart",method=RequestMethod.GET)
	public ModelAndView goinShoppingcart(Shoppingcart shoppingcart,@RequestParam(value="pn",defaultValue="1") int pn) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(user==null)
		{
			mv.setViewName("login");
			return mv;
		}
		else 
		{
			String user_id = user.getUser_id();
			shoppingcart.setUser_id(user_id);
			PageHelper.startPage(pn,10);
			List<Shoppingcart> shoppingcartList = shoppingcartService.selectShoppingcart(shoppingcart);
			PageInfo page = new PageInfo(shoppingcartList);
			mv.addObject("pageInfo",page);
			mv.setViewName("shoppingcart");
			return mv;
		}
	}
	
	@RequestMapping(value="/shoppingcart",method=RequestMethod.POST)
	public ModelAndView getShoppingcart(Shoppingcart shoppingcart,@RequestParam(value="pn",defaultValue="1") int pn) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		shoppingcart.setUser_id(user_id);
		PageHelper.startPage(pn,10);
		List<Shoppingcart> shoppingcartList = shoppingcartService.selectShoppingcart(shoppingcart);
		PageInfo page = new PageInfo(shoppingcartList);
		mv.addObject("pageInfo",page);
		mv.setViewName("shoppingcart");
		return mv;
	}
	
	@RequestMapping(value="/insertShoppingcart",method=RequestMethod.GET)
	@ResponseBody
	public void gotoShoppingcart(Shoppingcart shoppingcart) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		String goods_id = request.getParameter("goods_id");
		String goods_num = request.getParameter("goods_num");
		shoppingcart.setUser_id(user_id);
		shoppingcart.setGoods_id(goods_id);
		shoppingcart.setGoods_num(goods_num);
		System.out.println(shoppingcart.toString());
		shoppingcartService.insertShoppingcart(shoppingcart);
	}
	
	@RequestMapping(value="/updateGoods_num",method=RequestMethod.POST)
	public void updateGoods_num() {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		Shoppingcart shoppingcart = new Shoppingcart();
		String goods_id = request.getParameter("goods_id");
		String goods_num = request.getParameter("goods_num");
		shoppingcart.setUser_id(user_id);
		shoppingcart.setGoods_id(goods_id);
		shoppingcart.setGoods_num(goods_num);
		shoppingcartService.updateGoods_num(shoppingcart);
	}
	
	@RequestMapping(value="/deleteShoppingcart.action",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView deleteShoppingcart(String[] goodss_id) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		Shoppingcart shoppingcart = new Shoppingcart();
		shoppingcart.setUser_id(user_id);
		for(int i=0;i<goodss_id.length;i++)
		{
			shoppingcart.setGoods_id(goodss_id[i]);
			shoppingcartService.deleteShoppingcart(shoppingcart);
		}
		mv.setViewName("shoppingcart");
		return mv;
	}
	
	@RequestMapping(value="/insertShoppingcart.action")
	public  void insertShoppingcart(String goods_id,String goods_num) {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		Shoppingcart shoppingcart = new Shoppingcart();
		shoppingcart.setUser_id(user_id);
		shoppingcart.setGoods_id(goods_id);
		shoppingcart.setGoods_num(goods_num);	
	}
	
	@RequestMapping(value="/shop_order",method=RequestMethod.POST)
	public ModelAndView generateOrder(String[] goodss_id,int[] goodss_num) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("goodss_id",goodss_id);
		mv.addObject("goodss_num",goodss_num);
		mv.setViewName("order");
		return mv;
	}
}
