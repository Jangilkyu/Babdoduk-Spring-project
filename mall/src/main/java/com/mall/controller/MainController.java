package com.mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mall.dao.event.EventDao;
import com.mall.dao.product.ProductDao;
import com.mall.dao.sale.SaleDao;
import com.mall.util.AdminUtil;
import com.mall.vo.event.EventVo;
import com.mall.vo.product.ProductVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	private final ProductDao productDao;
	private final SaleDao saleDao;
	private final EventDao eventDao;

	@RequestMapping("/")
	public ModelAndView mainpage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		//관리자 페이지에서 넘어왔자면 세션 초기화
		if(request.getSession().getAttribute("admin") != null) {
			request.getSession().invalidate();
		}
		
		mav.addObject("eventList", eventDao.selectValid());
		mav.addObject("newProducts", productDao.selectNew(8));
		mav.setViewName("main");
		return mav;
	}
	
	//상품명 검색 결과를 반환하고 검색 결과 페이지로 넘김
	@RequestMapping("/search")
	public ModelAndView searchPage(HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		
		//검색 결과가 비어있을 시 안내 문구를 보이기 위해 결과값 추가
		List<ProductVo> resultList = productDao.searchByName(keyword);
		mav.addObject("resultCount", resultList.size());
		if(resultList.isEmpty()) {
			mav.addObject("notFound", "true");
		}else {
			mav.addObject("resultList", resultList);
		}
		
		mav.setViewName("searchResult");
		return mav;
	}
	
	//카테고리 검색 결과를 반환하고 목록 페이지로 넘김
	@RequestMapping("/category")
	public ModelAndView searchCategory(HttpServletRequest request) {
		String[] keywords = request.getParameterValues("key");
		ModelAndView mav = new ModelAndView();
		String title = "";
		
		//각 키워드에 해당하는 상품 목록을 받아서 추가
		List<ProductVo> categoryList = new ArrayList<ProductVo>();
		for(String key : keywords) {
			title += ("/" + key);
			categoryList.addAll(productDao.selectCategory(key));
		}
		
		//상품 목록에서 중복 제거
		List<ProductVo> list = new ArrayList<ProductVo>();
		for(ProductVo pv : categoryList) {
			if(!list.contains(pv)) {
				list.add(pv);
			}
		}
		
		mav.addObject("list", list);
		mav.addObject("title", title.substring(1));
		mav.addObject("saleMap", saleDao.selectValidMap());
		mav.setViewName("listProducts");
		return mav;
	}
	
	//현재 진행중인 이벤트 목록을 보여줌
	@RequestMapping("/events")
	public ModelAndView eventList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventList", eventDao.selectValid());
		mav.setViewName("listEvent");
		return mav;
	}
	
	//현재 진행중인 이벤트 게시글을 보여줌
	@RequestMapping("/events/{eventNo}")
	public ModelAndView eventDetail(@PathVariable String eventNo) {
		ModelAndView mav = new ModelAndView();
		EventVo ev = eventDao.selectEvent(Integer.parseInt(eventNo));
		ev.setEvent_start(ev.getEvent_start().substring(0, ev.getEvent_start().indexOf(" ")));
		ev.setEvent_end(ev.getEvent_end().substring(0, ev.getEvent_end().indexOf(" ")));
		mav.addObject("event", ev);
		mav.addObject("eventList", eventDao.selectValid());
		mav.setViewName("detailEvent");
		return mav;
	}
	
}
