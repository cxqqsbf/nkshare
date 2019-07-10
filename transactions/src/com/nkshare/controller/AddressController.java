package com.nkshare.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.AddressService;
import com.nkshare.vo.MyAddress;
import com.nkshare.vo.User;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/address",method=RequestMethod.GET)
	public ModelAndView gotoAddress(MyAddress address) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		List<MyAddress> addressList = addressService.selectAddress(user_id);
		mv.addObject("addressList", addressList);
		mv.setViewName("address");
		return mv;
	}
	
	@RequestMapping(value="/address",method=RequestMethod.POST)
	public ModelAndView manageAddress(@Valid MyAddress address,Errors errors) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String user_id = user.getUser_id();
		if(errors.hasErrors()) {
			List<MyAddress> addressList = addressService.selectAddress(user_id);
			mv.addObject("addressList", addressList);
			mv.setViewName("address");
		} else {
			address.setUser_id(user_id);
			address.setAddress_id(user_id+new Date().getTime());
			addressService.insertAddress(address);
			List<MyAddress> addressList = addressService.selectAddress(user_id);
			mv.addObject("addressList", addressList);
			mv.setViewName("address");
		}
		return mv;
	}
}
