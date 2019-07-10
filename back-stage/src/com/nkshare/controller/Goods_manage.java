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

		/*����goods_category ��*/
		for(int i=0;i<categorylist.length;i++) {
			Goods_category goods_category = new Goods_category();
			goods_category.setGoods_id(goods_id);
			goods_category.setCategory_id(categorylist[i]);
			switch(goods_category.getCategory_id())
			{
			case "1": 
				goods_category.setCategory_name("����ҵ�");
				break;
			case "2": 
				goods_category.setCategory_name("�鼮");
				break;
			case "3": 
				goods_category.setCategory_name("��װ");
				break;
			case "4": 
				goods_category.setCategory_name("�˶�");
				break;
			case "5": 
				goods_category.setCategory_name("�ճ���Ʒ");
				break;
			case "6": 
				goods_category.setCategory_name("��ױϴ��");
				break;
			case "7":
				goods_category.setCategory_name("������ʳ");
				break;
			}
			service.insert_goods_category(goods_category);
		}
		
		/*�ļ��ϴ�����*/
		//1.�����ϴ��ļ�·��
		String uploadPath = "D:\\javacode\\back-stage\\upload";
		System.out.println("uploadPath:" + uploadPath);
		// ���Ŀ¼�������򴴽�
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		//2.���������ϴ����ݵ��ļ�
		//a.��ȡ�ļ���չ�� ����.jpg
		String realFileName = image.getOriginalFilename();
		String[] tmp = realFileName.split("\\.");
		String type =tmp[tmp.length-1];
		//b.����Ψһ���ļ��� ������ǰʱ��ĺ���ֵ+a.��ȡ����չ��
		String fileName = ""+System.currentTimeMillis()+"."+type;
		//c.�������ļ�
		String filePath = uploadPath + File.separator + fileName;
		System.out.println("filepath:"+filePath);
		//3.���ļ�����д���ļ�
		image.transferTo(new File(filePath));
		//4.���ñ�ʾ�ļ���src
		String displayFileName=request.getContextPath()+File.separator + "upload"+File.separator +fileName;
		System.out.println("displayFileName:"+displayFileName);
		
		/*����goods_info��*/
		goods.setImage_path(displayFileName);
		service.insert_goods(goods);
		mv.setViewName("add_goods");
		return mv;
	}
}
