package com.nkshare.controller;

import java.io.IOException;
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
import com.nkshare.service.OrderManaService;
import com.nkshare.vo.Order;

@Controller
public class OrderManaController {
	@Autowired
	OrderManaService ordermanaservice;
	@RequestMapping(value="ordermana",method=RequestMethod.GET)
	public String orderlist(@RequestParam(value="pn",defaultValue="1") int pn,Model model,HttpServletRequest req) throws IOException {
		String order_id=req.getParameter("selorder_id");
		if(order_id!=null&&order_id!="")
		{
			System.out.println("1");
			PageHelper.startPage(pn,10);
			List<Order> list=ordermanaservice.selectOrderbyId(order_id);
			PageInfo<Order> page=new PageInfo<Order>(list);
			model.addAttribute("pageInfo",page);
		}
		else
		{
			System.out.println("2");
			PageHelper.startPage(pn,10);
			List<Order> list=ordermanaservice.selectOrder();
			PageInfo<Order> page=new PageInfo<Order>(list);
			model.addAttribute("pageInfo",page);
		}
		return "ordersmanage";
	}
	@RequestMapping(value="ordermana",method=RequestMethod.POST)
	@ResponseBody
	public void delete(HttpServletRequest req) throws IllegalStateException, IOException {
		String order_id=req.getParameter("order_id");
		ordermanaservice.deleteOrder(order_id);
	}
}
