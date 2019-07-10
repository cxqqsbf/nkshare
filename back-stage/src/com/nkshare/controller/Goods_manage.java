package com.nkshare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nkshare.service.Goods_service;
import com.nkshare.vo.Goods_category;
import com.nkshare.vo.Goods_info;

@Controller
public class Goods_manage {
	@Autowired
	Goods_service service;
	@RequestMapping(value="goods",method=RequestMethod.POST)
	public ModelAndView add_goods(HttpServletRequest request,MultipartFile image) throws IllegalStateException, IOException {
		ModelAndView mv = new ModelAndView();
		Goods_info goods = new Goods_info();
		String[] categorylist = request.getParameterValues("category");
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String goods_id = df.format(new Date());
		goods.setGoods_id(goods_id);
		goods.setGoods_name(request.getParameter("goods_name"));
		goods.setDetails_path(request.getParameter("details"));
		goods.setPre_price(request.getParameter("pre_price"));
		goods.setRel_price(request.getParameter("rel_price"));
		goods.setUser_id(request.getParameter("user_id"));

		/*插入goods_category 表*/
		for(int i=0;i<categorylist.length;i++) {
			Goods_category goods_category = new Goods_category();
			goods_category.setGoods_id(goods_id);
			goods_category.setCategory_id(categorylist[i]);
			switch(goods_category.getCategory_id())
			{
			case "1": 
				goods_category.setCategory_name("数码家电");
				break;
			case "2": 
				goods_category.setCategory_name("书籍");
				break;
			case "3": 
				goods_category.setCategory_name("服装");
				break;
			case "4": 
				goods_category.setCategory_name("运动");
				break;
			case "5": 
				goods_category.setCategory_name("日常用品");
				break;
			case "6": 
				goods_category.setCategory_name("美妆洗护");
				break;
			case "7":
				goods_category.setCategory_name("生鲜零食");
				break;
			}
			service.insert_goods_category(goods_category);
		}
		
		/*文件上传功能*/
		//1.创建上传文件路径
		String uploadPath = "D:\\javacode\\back-stage\\upload";
		System.out.println("uploadPath:" + uploadPath);
		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		//2.创建保存上传内容的文件
		//a.获取文件扩展名 例：.jpg
		String realFileName = image.getOriginalFilename();
		String[] tmp = realFileName.split("\\.");
		String type =tmp[tmp.length-1];
		//b.定义唯一的文件名 例：当前时间的毫秒值+a.获取的扩展名
		String fileName = ""+System.currentTimeMillis()+"."+type;
		//c.创建新文件
		String filePath = uploadPath + File.separator + fileName;
		System.out.println("filepath:"+filePath);
		//3.把文件内容写入文件
		image.transferTo(new File(filePath));
		//4.设置表示文件的src
		String displayFileName=request.getContextPath()+File.separator + "upload"+File.separator +fileName;
		System.out.println("displayFileName:"+displayFileName);
		
		/*插入goods_info表*/
		goods.setImage_path(displayFileName);
		service.insert_goods(goods);
		mv.setViewName("add_goods");
		return mv;
	}
}
