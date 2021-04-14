package com.mall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mall.dao.faq.FaqDao;
import com.mall.vo.faq.FaqVo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class FaqController {

	public static int pageSIZE = 10;
	public static int totalRecord = 0;
	public static int totalPage = 1;

	
	private final FaqDao dao;


	// 목록 조회+페이징
	@RequestMapping("/listFAQ.do")
	public ModelAndView listFAQ(String searchType, String searchKeyword, HttpServletRequest request, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		System.out.println("검색 컬럼: "+searchType);
		System.out.println("검색어: "+searchKeyword);
		
		HashMap map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		
		totalRecord = dao.totBoard(map); // 총 게시글 수
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);

		System.out.println("pageNUM:" + pageNUM);

		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;

		map.put("start", start);
		map.put("end", end);
		
		System.out.println("시작레코드:" + start);
		System.out.println("끝나는레코드:" + end);
		System.out.println("-------------------------------");


		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listFAQ(map));
		mav.addObject("totalPage", totalPage);
		return mav;
	}
	
	// 관리자용 목록 조회+페이징
	@RequestMapping("/admin/listFAQ.do")
	public ModelAndView listFAQAdmin(String searchType, String searchKeyword, HttpServletRequest request, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		HashMap map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		totalRecord = dao.totBoard(map); // 총 게시글 수
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);
		
		System.out.println("pageNUM:" + pageNUM);
		
		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		map.put("start", start);
		map.put("end", end);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listFAQ(map));
		mav.addObject("totalPage", totalPage);
		mav.setViewName("admin/listFAQAdmin");
		return mav;
	}
	

	// 글 쓰기
	@RequestMapping(value = "/admin/insertFAQ.do", method = RequestMethod.GET)
	public String insertFAQForm() {
		return "admin/insertFAQ";
	}

	// 글 쓰기 완료
	@RequestMapping(value = "/admin/insertFAQ.do", method = RequestMethod.POST)
	public ModelAndView insertFAQSubmit(FaqVo f) {
		ModelAndView mav = new ModelAndView();
		int re = dao.insertFAQ(f);
		if (re == 1) {
			mav.setViewName("redirect:/admin/listFAQ.do");
			System.out.println("등록 성공");
		} else {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	// 글 상세 조회
	@RequestMapping("/detailFAQ.do")
	public ModelAndView detailBoard(HttpServletRequest request, int no) {
		//조회수 증가
		dao.updateHit(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("f", dao.detailFAQ(no));
		return mav;
	}
	
	// 관리자용 글 상세 조회
	@RequestMapping("/admin/detailFAQ.do")
	public ModelAndView detailBoardAdmin(HttpServletRequest request, int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("f", dao.detailFAQ(no));
		mav.setViewName("admin/detailFAQAdmin");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/admin/updateFAQ.do", method = RequestMethod.GET)
	public ModelAndView updateForm(HttpServletRequest request, int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("f", dao.detailFAQ(no));
		mav.setViewName("admin/updateFAQ");
		return mav;
	}

	// 글 수정완료
	@RequestMapping(value = "/admin/updateFAQ.do", method = RequestMethod.POST)
	public ModelAndView updateSubmit(FaqVo f) {
		ModelAndView mav = new ModelAndView();
		int re = dao.updateFAQ(f);
		if (re == 1) {
			mav.setViewName("redirect:/admin/listFAQ.do");
		} else {
			mav.addObject("msg", "삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}
	
	// 글 삭제
	@RequestMapping(value = "/admin/deleteFAQ.do", method = RequestMethod.GET)
	public ModelAndView deleteForm(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		return mav;
	}

	// 글 삭제 완료
	@RequestMapping(value = "/admin/deleteFAQ.do", method = RequestMethod.POST)
	public ModelAndView deleteSubmit(int no) {
		ModelAndView mav = new ModelAndView();
		int re = dao.deleteFAQ(no);
		if (re == 1) {
			mav.setViewName("redirect:/admin/listFAQ.do");
		} else {
			mav.addObject("msg", "삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		return mav;
	}

	
	


}
