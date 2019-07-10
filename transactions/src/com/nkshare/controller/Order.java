package com.nkshare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.nkshare.service.Goods_service;
import com.nkshare.service.Order_service;
import com.nkshare.vo.Address;
import com.nkshare.vo.Goods_info;
import com.nkshare.vo.Order_info;
import com.nkshare.vo.User;

@Controller
public class Order {
	@Autowired
	Order_service service;
	@RequestMapping(value="showorder",method=RequestMethod.POST)
	public ModelAndView show(HttpServletRequest request) throws ServletException, IOException{
		ModelAndView  mv = new ModelAndView();
		String goods_id=request.getParameter("goods_id");
		User user=(User) request.getSession().getAttribute("user");
		
		String goods_num=request.getParameter("goods_num");
		Order_info order=service.show_order(goods_id);
		List<Order_info> orderlist = new ArrayList<Order_info>();
		
		if(user==null) {
			mv.setViewName("login");
		}else {
			String user_id = user.getUser_id();
			List<Address> address=service.show_address(user_id);
			order.setGoods_num(goods_num);
			order.setGoods_id(goods_id);
			Double number =new Double(goods_num);
			Double price = new Double(order.getGoods().getRel_price());
			DecimalFormat df = new DecimalFormat("0.00");
			String sum = df.format(number * price);
			order.setGoods_price(sum);
			orderlist.add(order);
			mv.addObject("addresslist", address);
			mv.addObject("orderlist", orderlist);
			mv.setViewName("order");
		}
		return mv;
	}
	@RequestMapping(value="showshoppingcart",method=RequestMethod.GET)
	public ModelAndView show_shopping_cart(HttpServletRequest request) throws ServletException, IOException{
		ModelAndView  mv = new ModelAndView();
		String[] goodss_id = request.getParameterValues("goodss_id");
		String[] goodss_num = request.getParameterValues("goodss_num");
		String[] goods_id = goodss_id[0].split(",");
		String[] goods_num = goodss_num[0].split(",");
		List<Order_info> orderlist = new ArrayList<Order_info>();
		User user=(User) request.getSession().getAttribute("user");
		String user_id = user.getUser_id();
		for(int i=0;i<goods_id.length;i++) {
			Order_info order = new Order_info();
			order = service.show_order(goods_id[i]);
			order.setGoods_id(goods_id[i]);
			order.setGoods_num(goods_num[i]);
			Double number =new Double(goods_num[i]);
			Double price = new Double(order.getGoods().getRel_price());
			DecimalFormat df = new DecimalFormat("0.00");
			String sum = df.format(number * price);
			order.setGoods_price(sum);
			orderlist.add(order);
		}
		List<Address> address=service.show_address(user_id);
		mv.addObject("addresslist", address);
		mv.addObject("orderlist", orderlist);
		mv.setViewName("order");
		return mv;
	}
	@RequestMapping(value="add_address",method=RequestMethod.POST)
	@ResponseBody
	public Address add_newaddress(HttpServletRequest request) throws ServletException, IOException{
		User user=(User) request.getSession().getAttribute("user");
		String user_id = user.getUser_id();
		String username=request.getParameter("username");
		String tel=request.getParameter("Telephone");
		Address add_address = new Address();
		add_address.setProvinces(request.getParameter("provinces"));
		add_address.setCity(request.getParameter("city"));
		add_address.setCountry(request.getParameter("country"));
		add_address.setStreet(request.getParameter("street"));
		add_address.setZipcode(request.getParameter("zipcode"));
		add_address.setName(username);
		add_address.setTelephone(tel);
		add_address.setUser_id(user_id);
		add_address.setAddress_id(request.getParameter("address_id"));
		service.add_address(add_address);
		return add_address;
	}
}
