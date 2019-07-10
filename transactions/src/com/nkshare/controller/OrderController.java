package com.nkshare.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.OrderService;
import com.nkshare.vo.Order;
import com.nkshare.vo.User;

@Controller
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/myorder",method=RequestMethod.GET)
	public ModelAndView gotomyorder(@RequestParam(value="pn",defaultValue="1") int pn) throws IOException{
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
			String pay_state = request.getParameter("pay_state");
			Order order = new Order();
			order.setUser_id(user_id);
			if(pay_state != "")
				order.setPay_state(pay_state);
			PageHelper.startPage(pn,5);
			List<Order> ordersList = orderService.selectOrder(order);
			PageInfo page = new PageInfo(ordersList);
			mv.addObject("pageInfo",page);
			mv.setViewName("myorder");
			return mv;
		}
	}
	
	@RequestMapping(value="/myorder", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView getmyorder(@RequestParam(value="pn",defaultValue="1") int pn) throws IOException{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		String pay_state = request.getParameter("pay_state");
		Order order = new Order();
		order.setUser_id(user_id);
		order.setPay_state(pay_state);
		PageHelper.startPage(pn,5);
		List<Order> ordersList = orderService.selectOrder(order);
		PageInfo page = new PageInfo(ordersList);
		mv.addObject("pageInfo",page);
		mv.setViewName("myorder");
        return mv;
	}
}
