package com.mall.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mall.dao.notice.NoticeDao;
import com.mall.vo.notice.NoticeVo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class NoticeController {

	public static int pageSIZE = 10;
	public static int totalRecord = 0;
	public static int totalPage = 1;

	private final NoticeDao dao;

	// 목록 조회+페이징
	@RequestMapping("/listNotice.do")
	public ModelAndView listNotice(String searchType, String searchKeyword, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		HashMap map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		
		totalRecord = dao.totBoard(map);
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);

		// 우리는 한화면에 10개씩 보여주고 싶어요 ==> pageSIZE
		// 만약 현재페이지가 1페이지라면 보여줘야 할 시작레코드는 1
		// 만약 현재페이지가 2페이지라면 보여줘야 할 시작레코드는 11

		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		map.put("start", start);
		map.put("end", end);


		System.out.println("시작레코드:" + start);
		System.out.println("끝나는레코드:" + end);
		System.out.println("-------------------------------");

		

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listNotice(map));
		mav.addObject("totalPage", totalPage);
		return mav;
	}

	// 글 쓰기
	@RequestMapping(value = "/admin/insertNotice.do", method = RequestMethod.GET)
	public String insertNoticeForm() {
		return "admin/insertNotice";
	}

	// 글 쓰기 완료
	@RequestMapping(value = "/admin/insertNotice.do", method = RequestMethod.POST)
	public ModelAndView insertNoticeSubmit(NoticeVo n) {
		ModelAndView mav = new ModelAndView();
		int re = dao.insertNotice(n);
		if (re == 1) {
			mav.setViewName("redirect:/listNotice.do");
		} else {
			mav.addObject("msg", "게시물 등록에 실패하였습니다.");
			mav.setViewName("error");
		}
		mav.setViewName("admin/insertNotice");
		return mav;
	}

	// 글 상세 조회
	@RequestMapping("/detailNotice.do")
	public ModelAndView detailNotice(int no) {
		//조회수 증가
		dao.updateHit(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", dao.detailNotice(no));
		return mav;
	}
	
	// 관리자 페이지용 목록 조회+페이징
	@RequestMapping("/admin/listNotice.do")
	public ModelAndView listNoticeAdmin(String searchType, String searchKeyword, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		
		HashMap map = new HashMap();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		totalRecord = dao.totBoard(map);
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);

		// 우리는 한화면에 10개씩 보여주고 싶어요 ==> pageSIZE
		// 만약 현재페이지가 1페이지라면 보여줘야 할 시작레코드는 1
		// 만약 현재페이지가 2페이지라면 보여줘야 할 시작레코드는 11

		int start = (pageNUM - 1) * pageSIZE + 1;
		int end = start + pageSIZE - 1;
		map.put("start", start);
		map.put("end", end);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.listNotice(map));
		mav.addObject("totalPage", totalPage);
		mav.setViewName("admin/listNoticeAdmin");
		return mav;
	}
	
	// 관리자 페이지용 글 상세 조회
	@RequestMapping("/admin/detailNotice.do")
	public ModelAndView detailNoticeAdmin(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", dao.detailNotice(no));
		mav.setViewName("admin/detailNoticeAdmin");
		return mav;
	}
		
	
	// 글 수정
	@RequestMapping(value = "/admin/updateNotice.do", method = RequestMethod.GET)
	public ModelAndView updateNoticeForm(HttpServletRequest request, int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("n", dao.detailNotice(no));
		mav.setViewName("admin/updateNotice");
		return mav;
	}

	// 글 수정완료
	@RequestMapping(value = "/admin/updateNotice.do", method = RequestMethod.POST)
	public ModelAndView updateNoticeSubmit(NoticeVo n) {
		ModelAndView mav = new ModelAndView();
		int re = dao.updateNotice(n);
		if (re == 1) {
			mav.setViewName("redirect:/listNotice.do");
		} else {
			mav.addObject("msg", "삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		mav.setViewName("admin/updateNotice");
		return mav;
	}
	
	// 글 삭제
	@RequestMapping(value = "/admin/deleteNotice.do", method = RequestMethod.GET)
	public ModelAndView deleteNoticeForm(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("no", no);
		mav.setViewName("admin/deleteNotice");
		return mav;
	}

	// 글 삭제 완료
	@RequestMapping(value = "/admin/deleteNotice.do", method = RequestMethod.POST)
	public ModelAndView deleteSubmit(int no) {
		ModelAndView mav = new ModelAndView();
		int re = dao.deleteNotice(no);
		if (re == 1) {
			mav.setViewName("redirect:/listNotice.do");
		} else {
			mav.addObject("msg", "삭제에 실패하였습니다.");
			mav.setViewName("error");
		}
		mav.setViewName("admin/deleteNotice");
		return mav;
	}


}
