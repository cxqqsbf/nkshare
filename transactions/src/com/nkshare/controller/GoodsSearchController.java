package com.nkshare.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nkshare.service.AddressService;
import com.nkshare.service.GoodsSearchService;
import com.nkshare.vo.Address;
import com.nkshare.vo.GoodsSearch;
import com.nkshare.vo.Goodss;

@Controller
public class GoodsSearchController {
	@Autowired
	private GoodsSearchService searchService;
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping(value="/goodssearch",method=RequestMethod.GET)
	public ModelAndView gotoGoodsSearch(GoodsSearch goodssearch1,@RequestParam(value="pn",defaultValue="1") int pn,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		//HttpSession session = request.getSession();
		//String user_id = session.getAttribute("user_id").toString();
		List<Goodss> goodssList = new ArrayList<Goodss>() ;
		PageHelper.startPage(pn,10);
		GoodsSearch goodssearch=new GoodsSearch();
		goodssearch.setGoodsType(req.getParameter("type"));
		goodssearch.setSearchWord(req.getParameter("word"));
		System.out.print(req.getParameter("word"));
		if(goodssearch.getSearchWord() == null)
		{
			System.out.print("12346");
		}
		if(goodssearch.getSearchWord() != "") {
			if(goodssearch.getGoodsType().equals("s_goodsName")) {
				goodssList = searchService.selectGoodssByName(goodssearch);
			} else if(goodssearch.getGoodsType().equals("s_user")) {
				goodssList = searchService.selectGoodssByUser(goodssearch);
			} else if(goodssearch.getGoodsType().equals("s_category")) {
				goodssList = searchService.selectGoodssByCategory(goodssearch);
			} else if(goodssearch.getGoodsType().equals("s_all")) {
				goodssList = searchService.selectGoodssByAll(goodssearch);
			}
			PageInfo page = new PageInfo(goodssList);
			mv.addObject("pageInfo",page);
	 		/*mv.addObject("goodssList", goodssList);*/
			mv.addObject("goodssearch",goodssearch);
		}
		mv.setViewName("goodssearch");
		return mv;
	}
	
	@RequestMapping(value="/goodssearch",method=RequestMethod.POST)
	public ModelAndView getGoodsSearch(GoodsSearch goodssearch,@RequestParam(value="pn",defaultValue="1") int pn) {
		ModelAndView mv = new ModelAndView();
		//HttpSession session = request.getSession();
		//String user_id = session.getAttribute("user_id").toString();
		List<Goodss> goodssList = new ArrayList<Goodss>() ;
		PageHelper.startPage(pn,10);
		if(goodssearch.getSearchWord() == "")
		{
			System.out.print("12346");
		}
		if(goodssearch.getSearchWord() != "") {
			if(goodssearch.getGoodsType().equals("s_goodsName")) {
				goodssList = searchService.selectGoodssByName(goodssearch);
			} else if(goodssearch.getGoodsType().equals("s_user")) {
				goodssList = searchService.selectGoodssByUser(goodssearch);
			} else if(goodssearch.getGoodsType().equals("s_category")) {
				goodssList = searchService.selectGoodssByCategory(goodssearch);
			}else if(goodssearch.getGoodsType().equals("s_all")) {
				goodssList = searchService.selectGoodssByAll(goodssearch);
			}
			PageInfo page = new PageInfo(goodssList);
			mv.addObject("pageInfo",page);
	 		/*mv.addObject("goodssList", goodssList);*/
			mv.addObject("goodssearch",goodssearch);
		}
		mv.setViewName("goodssearch");
		return mv;
	}
	
	
}
