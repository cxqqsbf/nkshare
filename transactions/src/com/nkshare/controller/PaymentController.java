package com.nkshare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.OrderService;
import com.nkshare.service.PaymentService;
import com.nkshare.service.ShoppingcartService;
import com.nkshare.vo.Order;
import com.nkshare.vo.Order_info;
import com.nkshare.vo.Shoppingcart;
import com.nkshare.vo.User;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private HttpServletRequest req;
	@Autowired
	private HttpServletResponse response;
	
	@RequestMapping(value="/payment",method=RequestMethod.GET)
	public ModelAndView gotoPayment() {
		ModelAndView mv = new ModelAndView();
		String order_id = req.getParameter("order_id");
		System.out.println(order_id);
		Order order = paymentService.selectOrder(order_id);
		System.out.println(order);
		mv.addObject("order",order);
		mv.setViewName("payment");
		return mv;
	}
	
	@RequestMapping(value="/order_success",method=RequestMethod.POST)
	public String success(String order_id) throws IOException {
		order_id = req.getParameter("order_id");
		System.out.println(order_id);
		paymentService.updateOrder(order_id);
		ShoppingcartService shoppingcartService=new ShoppingcartService();
		//Logger log = Logger.getLogger(PaymentController.class);
		//log.info(String.format("%s;%s;%s;%s;%s;%s;%s","用户年龄","性别","消费金额","收货地址","销量","图书种类","时间"));
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		String user_id = user.getUser_id();
		Shoppingcart shoppingcart = new Shoppingcart();
		shoppingcart.setUser_id(user_id);
		OrderService orderservice=new OrderService();
		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		out.print("<script>alert('Success!');window.location.href='/transactions/myorder'</script>");
		return "myorder";
	}
}
