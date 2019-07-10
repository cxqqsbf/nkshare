package com.nkshare.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.Order_service;
import com.nkshare.service.PaymentService;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;
import com.nkshare.vo.User;
@Controller
public class Payment {
	@Autowired
	Order_service service;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private HttpServletRequest req;
	@Autowired
	private HttpServletResponse response;
	
	@RequestMapping(value="showpayment",method=RequestMethod.POST)
	public ModelAndView show(HttpServletRequest request) throws ServletException, IOException{
		ModelAndView mv = new ModelAndView();
		List<Order_info> orderlist = new ArrayList<Order_info>();
		Order order = new Order();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		String[] money = request.getParameterValues("goods_price");
		String[] goods_num = request.getParameterValues("goods_num");
		String[] goods_id = request.getParameterValues("goods_id");
		String address_id = request.getParameter("address");
		String order_number=service.create_number(user_id);
		order.setOrder_id(order_number);
		order.setUser_id(user_id);
		order.setAddress_id(address_id);
		order.setPay_state("0");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		order.setCreate_time(df.format(new Date()));
		double sum=0;
		for(int i=0;i<money.length;i++) {
			Order_info order_info = new Order_info();
			order_info.setGoods_id(goods_id[i]);
			order_info.setGoods_num(goods_num[i]);
			order_info.setOrder_id(order_number);
			orderlist.add(order_info);
			sum+= new Double(money[i]);
		}
		order.setMoney(""+sum);
		service.insert_order(order);
		service.insert_order_info(orderlist);
		Order order1 = paymentService.selectOrder(order_number);
		mv.addObject("order",order1);
		mv.setViewName("payment");
		return mv;
	}
}
