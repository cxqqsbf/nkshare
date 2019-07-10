package com.nkshare.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.nkshare.service.UserService;
import com.nkshare.vo.User;


@Controller
public class UserController {
	
	@Autowired
	UserService userservice;
	
	@RequestMapping(value="indivi",method=RequestMethod.GET)
	public String Indivicenter(Model model,HttpServletRequest req) throws IOException{
		HttpSession session=req.getSession();
		User user=(User) session.getAttribute("user");
		if(user==null)
		{
			return "login";
		}
		else
		{
			user=userservice.selectUser(user.getUser_id());
			model.addAttribute("user",user);
			return "indivi";
		}
	}
	
	@RequestMapping(value="indivi",method=RequestMethod.POST)
	public ModelAndView Save(@Valid User user,Errors errors,HttpServletRequest req) throws IllegalStateException, IOException {
		ModelAndView mv=new ModelAndView();
		HttpSession session=req.getSession();
		User user1=(User) session.getAttribute("user");
		user.setBirthday(req.getParameter("birthday"));
		user.setUser_id(user1.getUser_id());
		mv.addObject("user",user);
		user.setUser_id(user1.getUser_id());
		userservice.updateUser(user);
		mv.addObject("user",user);
		mv.addObject("right", "right");
		System.out.println("正常执行完毕"+user);
		mv.setViewName("indivi");
		return mv;
	}
	@RequestMapping(value="register",method=RequestMethod.GET)
	public String Register(Model model,HttpServletRequest req) throws IOException{
		User user=new User();
		model.addAttribute("user", user);
		return "register";
	}
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	public ModelAndView Register(HttpServletRequest req, HttpServletResponse resp) throws IllegalStateException, IOException, ServletException {
		String action=req.getParameter("action");
		ModelAndView mv=new ModelAndView();
		if("log".equals(action))
		{
			mv.setViewName("login");
			doregister(req,resp);
		}
		else if("checkUser".equals(action))
		{
			mv.setViewName("register");
			checkUser(req,resp);
		}
		else if("checkTel".equals(action))
		{
			mv.setViewName("register");
			checkTel(req,resp);
		}
		else if("checkEma".equals(action))
		{
			mv.setViewName("register");
			checkEma(req,resp);
		}
		else if("checkPwd".equals(action))
		{
			mv.setViewName("register");
			checkPwd(req,resp);
		}
		return mv;
	}
	private void doregister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ModelAndView mv=new ModelAndView();
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
		String tel=request.getParameter("telephone");
		String email=request.getParameter("email");
		String pwd=request.getParameter("password");
		pwd=BCrypt.hashpw(pwd, BCrypt.gensalt(12));
		User user=new User();
		user.setUser_id(name);
		user.setTelephone(tel);
		user.setEmail(email);
		user.setPassword(pwd);
		userservice.insertUser(user);
	}
	private void checkUser(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("username");
		String message="";
		if(userservice.selectUser(name)!=null) 
		message="用户名已存在，请重新输入";	
		else
		message="用户名可用";
		String jsonStr=JSON.toJSONString(message);
		resp.setCharacterEncoding("UTF-8");  
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();	
	}
	private void checkTel(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		req.setCharacterEncoding("utf-8");
		String Tel=req.getParameter("tel");
		String message="";
		Pattern p =Pattern.compile("^1(3|4|5|7|8)\\d{9}$");
		Matcher m = p.matcher(Tel);
		if(!m.matches())
		message="请输入正确电话号码";	
		else
		message="正确";
		String jsonStr=JSON.toJSONString(message);
		resp.setCharacterEncoding("UTF-8");  
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();	
	}
	private void checkEma(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		req.setCharacterEncoding("utf-8");
		String email=req.getParameter("email");
		String message="";
		Pattern p =Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
		Matcher m = p.matcher(email);
		if(!m.matches())
		message="请输入正确邮箱地址";	
		else
		message="正确";
		String jsonStr=JSON.toJSONString(message);
		resp.setCharacterEncoding("UTF-8");  
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();	
	}
	private void checkPwd(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		req.setCharacterEncoding("utf-8");
		String pwd=req.getParameter("password");
		String message="";
		Pattern p =Pattern.compile("^[a-zA-Z]\\w{5,11}$");
		Matcher m = p.matcher(pwd);
		if(!m.matches())
		message="密码以字母开头，长度在6-12位之间， 只能包含字符、数字和下划线";	
		else
		message="正确";
		String jsonStr=JSON.toJSONString(message);
		resp.setCharacterEncoding("UTF-8");  
		resp.setContentType("application/json; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.write(jsonStr);
		out.flush();
		out.close();	
	}
	@RequestMapping(value="changepwd",method=RequestMethod.GET)
	public String gotopwd(Model model,HttpServletRequest req) throws IOException{
		User user=new User();
		user=userservice.selectUser("cxq");
		model.addAttribute("user",user);
		return "password";
	}
	@RequestMapping(value="changepwd",method=RequestMethod.POST)
	public ModelAndView changePwd(HttpServletRequest req,HttpServletResponse resp) throws IOException{
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		User user1=(User) session.getAttribute("user");
		String pwd=req.getParameter("oldpass");
		String checkpwd=req.getParameter("checkpass");
		String newpwd=req.getParameter("newpass");
		ModelAndView mv=new ModelAndView();
		User user=userservice.selectUser(user1.getUser_id());
		if(!BCrypt.checkpw(pwd,user.getPassword()))
		{
			req.setAttribute("message", "原密码输入错误");
			mv.setViewName("password");
			return mv;
		}
		else if(!checkpwd.equals(newpwd))
		{
			req.setAttribute("message2", "确认密码输入错误");
			mv.setViewName("password");
			return mv;
		}
		newpwd=BCrypt.hashpw(newpwd, BCrypt.gensalt(12));
		user.setPassword(newpwd);
		userservice.updatePwd(user);
		System.out.println(user);
		req.setAttribute("msg", "修改成功");
		mv.setViewName("password");
		return mv;
	}
}
