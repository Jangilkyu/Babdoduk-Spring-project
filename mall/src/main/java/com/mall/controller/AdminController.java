package com.mall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mall.dao.event.EventDao;
import com.mall.dao.product.ProductDao;
import com.mall.dao.sale.SaleDao;
import com.mall.dao.set.SetDao;
import com.mall.util.AdminUtil;
import com.mall.vo.event.EventVo;
import com.mall.vo.product.ProductVo;
import com.mall.vo.sale.SaleVo;
import com.mall.vo.set.SetComponentVo;
import com.mall.vo.set.SetVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {
	
	private final ProductDao dao;
	private final SaleDao sdao;
	private final SetDao setdao;
	private final EventDao eventdao;
	private final AdminUtil util;
	
	
	
	//관리자 메인 페이지로 이동
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String adminEnterpage() {
		return "/admin/adminEnter";
	}
	
	
	
	//관리자 로그인이 유효한지 검증 후 관리자 페이지로 입장
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String enterAdminMainpage(HttpServletRequest request) {
		
		//입력받은 비밀번호를 서버의 txt파일과 비교하여 검증
		String inputPwd = request.getParameter("inputPwd");
		String pwdPath = request.getRealPath("/adminPassword.txt");
		
		//일치할 경우 세션에 값을 저장, 관리자페이지 인터셉터에서 사용된다 
		if(util.checkPassword(inputPwd, pwdPath)) {
			request.getSession().setAttribute("admin", "true");
		}
		
		return "redirect:/admin/main";
	}
	
	
	
	//관리자 대문 페이지
	@RequestMapping("/main")
	public String adminMainPage() {
		return "/admin/adminMain";
	}
	
	
	
	//GET 방식 접근일 때, 상품 등록 페이지로 이동
	@RequestMapping(value = "/product-register", method = RequestMethod.GET)
	public String registerProductForm(HttpServletRequest request) {
		request.getSession().setAttribute("category", "product");
		request.getSession().setAttribute("function", "productRegister");
		request.setAttribute("nextNo", dao.getNextNo());
		return "/admin/productRegister";
	}

	

	//POST 방식 접근일 때, 입력된 정보의 상품을 등록함
	@RequestMapping(value = "/product-register", method = RequestMethod.POST)
	public ModelAndView registerProduct(ProductVo pv, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		//상품 이미지를 등록할 webapp/img 경로
		String path = request.getRealPath("/img");
		
		//파일 데이터를 받아와서 변수에 저장
		MultipartFile uploadImg = pv.getMainImgFile();
		MultipartFile uploadDetailImg1 = pv.getDetailImgFile1();
		MultipartFile uploadDetailImg2 = pv.getDetailImgFile2();
	
		//이미지 파일 이름 수정
		String mainImgName = "";
		String detailImgName1 = "";
		String detailImgName2 = "";
		
		//이미지 파일 이름을 product상품번호 형태로 수정하고, 필수 이미지가 없을 시 안내 메세지와 함께 돌려 보냄
		try {
			mainImgName = util.renameImg(pv.getProduct_no(), uploadImg, "");
			detailImgName1 = util.renameImg(pv.getProduct_no(), uploadDetailImg1, "_detail1");
			//상세이미지2가 존재하는지 확인
			if(uploadDetailImg2.getSize() != 0) {
				detailImgName2 = util.renameImg(pv.getProduct_no(), uploadDetailImg2, "_detail2");
			}
		}catch(Exception e){
			mav.addObject("result", "메인이미지와 상세이미지1은 필수입니다.");	
			mav.setViewName("productRegister");
			return mav;
		}
		
		//DB에 수정된 이미지 파일 이름을 저장
		pv.setProduct_main_img(mainImgName);
		pv.setProduct_detail_img1(detailImgName1);
		pv.setProduct_detail_img2(detailImgName2);

		
		try {
			byte []data = uploadImg.getBytes();
			
			//webapp/img 경로에 이미지 파일을 차례로 저장
			FileOutputStream fos = new FileOutputStream(path + "/" + mainImgName);
			fos.write(data);
			fos.flush();
			data = uploadDetailImg1.getBytes();
			fos = new FileOutputStream(path + "/" + detailImgName1);
			fos.write(data);
			fos.flush();
			
			//상세이미지2가 있는지 확인
			if(uploadDetailImg2.getSize() != 0) {
				data = uploadDetailImg2.getBytes();
				fos = new FileOutputStream(path + "/" + detailImgName2);
				fos.write(data);
				fos.flush();
			}
			
			fos.close();
			
		} catch (IOException e) {
			mav.addObject("result", "이미지 등록 중 문제가 발생하였습니다. 다시 시도하세요.");	
			mav.setViewName("productRegister");
			return mav;
		}
		
		//쿼리문을 실행하고, 결과값을 확인
		int re = dao.registerProduct(pv);
		
		//등록 성공:1 , 실패:0
		if(re == 1) {
			mav.addObject("result", "등록 성공");
		}else {
			mav.addObject("result", "DB 등록 실패. 상품번호를 확인해주세요.");			
		}
		
		request.setAttribute("nextNo", dao.getNextNo());
		mav.setViewName("/admin/productRegister");
		return mav;
	}
	
	
	
	//GET 방식 접근, 상품 목록 창
	@RequestMapping(value = "/product-edit", method = RequestMethod.GET)
	public ModelAndView editProductForm(HttpServletRequest request) {
		request.getSession().setAttribute("category", "product");
		request.getSession().setAttribute("function", "productEdit");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/productEdit");
		mav.addObject("list", dao.findAll());
		return mav;
	}
	
	
	
	//GET 방식 접근일 때, 수정 대상 상품의 상세 정보 보기
	@RequestMapping(value = "/product-edit/{productNo}", method = RequestMethod.GET)
	public ModelAndView editProductFormDetail(@PathVariable String productNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(productNo);
		mav.addObject("product", dao.selectOne(no));
		mav.setViewName("/admin/productEditDetail");
		return mav;
	}
	
	
	
	//POST 방식, 해당 상품의 DB 정보와 서버에 저장된 이미지 파일 수정
	@RequestMapping(value = "/product-edit/{productNo}", method = RequestMethod.POST)
	@ResponseBody
	public String updateProduct(ProductVo pv, HttpServletRequest request) {
		//상품 이미지를 등록할 webapp/img 경로
		String path = request.getRealPath("/img");
		
		String mainImgName = "";
		String detailImgName1 = "";
		String detailImgName2 = ""; 
				
		//메인이미지와 상세이미지1이 변경되었는지 확인
		if(pv.getMainImgFile().getSize() != 0) {
			//메인이미지가 변경되었다면 파일 삭제 후 새로운 이미지 파일명 지정
			String oldMainImgPath = path + "/" + pv.getProduct_main_img();
			util.deleteImg(oldMainImgPath);			
			mainImgName = util.renameImg(pv.getProduct_no(), pv.getMainImgFile(), "");
			pv.setProduct_main_img(mainImgName);
			
			try {
				util.uploadImg(path, pv.getMainImgFile(), mainImgName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(pv.getDetailImgFile1().getSize() != 0) {
			String oldDetailImgPath1 = path + "/" + pv.getProduct_detail_img1();
			util.deleteImg(oldDetailImgPath1);
			detailImgName1 = util.renameImg(pv.getProduct_no(), pv.getDetailImgFile1(), "_detail1");
			pv.setProduct_detail_img1(detailImgName1);
			
			try {
				util.uploadImg(path, pv.getDetailImgFile1(), detailImgName1);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(pv.getDetailImgFile2().getSize() != 0) {
			if(pv.getProduct_detail_img2() != null) {
				String oldDetailImgPath2 = path + "/" + pv.getProduct_detail_img2();
				util.deleteImg(oldDetailImgPath2);
			}
			detailImgName2 = util.renameImg(pv.getProduct_no(), pv.getDetailImgFile2(), "_detail2");
			pv.setProduct_detail_img2(detailImgName2);
			try {
				util.uploadImg(path, pv.getDetailImgFile2(), detailImgName2);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int re = dao.updateProduct(pv);
		
		return re+"";
	}
	
	
	
	//특정 상품의 DB 데이터와 서버에 저장된 관련 이미지를 삭제
	@RequestMapping("/product-edit/delete")
	public String deleteProduct(int no, HttpServletRequest request) {
		//서버에서 해당 상품의 관련 이미지를 삭제
		ProductVo pv = dao.selectOne(no);
		
		//해당 상품의 이미지 경로를 배열에 담고, 차례로 삭제
		List<String> imgList = new ArrayList<>();
		imgList.add(request.getRealPath("/img") + "/" + pv.getProduct_main_img());
		imgList.add(request.getRealPath("/img") + "/" + pv.getProduct_detail_img1());
		if(pv.getProduct_detail_img2() != null) {
			imgList.add(request.getRealPath("/img") + "/" + pv.getProduct_detail_img2());			
		}
		
		for(String path : imgList) {
			util.deleteImg(path);
		}
		
		//DB에서 해당 상품의 데이터를 삭제
		dao.deleteProduct(no);
		return "redirect:/admin/product-edit";
	}
	

	
	//GET 방식 접근, 검색 팝업창을 띄움
	@RequestMapping(value = "/product-search", method = RequestMethod.GET)
	public String searchProduct(HttpServletRequest request) {
		return "/admin/productSearch";
	}
	
	
	
	//POST 방식 접근, 검색 결과를 갱신
	@RequestMapping(value = "/product-search", method = RequestMethod.POST)
	@ResponseBody
	public List<ProductVo> updateSearchList(HttpServletRequest request) {
		String keyword = request.getParameter("keyword");
		List<ProductVo> searchList = new ArrayList<>();
		searchList = dao.searchByName(keyword);			
		return searchList;
	}
	
	
	
	//GET 방식 접근, 세일 정보를 등록
	@RequestMapping(value = "/sale-register", method = RequestMethod.GET)
	public String registerSaleForm(HttpServletRequest request) {
		request.getSession().setAttribute("category", "sale");
		request.getSession().setAttribute("function", "saleRegister");
		return "/admin/saleRegister";
	}
	
	
	
	//POST 방식 접근, 받은 정보를 세일정보 테이블에 입력
	@RequestMapping(value = "/sale-register", method = RequestMethod.POST)
	public String registerSaleDetail(HttpServletRequest request) {
		int productNo = Integer.parseInt(request.getParameter("productNo"));
		String startDate = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00";
		String endDate = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00";
		int salePrice = Integer.parseInt(request.getParameter("salePrice"));
		
		SaleVo sv = new SaleVo(productNo, startDate, endDate, salePrice);
		sdao.registerSale(sv);
		
		return "/admin/saleRegister";
	}


	
	//GET 방식 접근, 세일 상품의 목록을 보여줌
	@RequestMapping(value = "/sale-edit", method = RequestMethod.GET)
	public String editSale(Model model, HttpServletRequest request) {
		request.getSession().setAttribute("category", "sale");
		request.getSession().setAttribute("function", "saleEdit");
		model.addAttribute("list", sdao.findAll());
		return "/admin/saleEdit";
	}
	

	//GET 방식 접근, 해당 세일 상품의 상세 정보를 보여줌
	@RequestMapping(value = "/sale-edit/{productNo}", method = RequestMethod.GET)
	public ModelAndView editSaleDetail(@PathVariable String productNo) {
		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(productNo);
		mav.addObject("product", dao.selectOne(no));
		mav.addObject("sale", sdao.selectOne(no));
		mav.setViewName("/admin/saleEditDetail");
		return mav;
	}
	


	//POST 방식 접근, 해당 세일 상품의 DB 정보를 수정
	@RequestMapping(value = "/sale-edit/{productNo}", method = RequestMethod.POST)
	@ResponseBody
	public String updateSale(@PathVariable String productNo, HttpServletRequest request) {
		int no = Integer.parseInt(productNo);
		String startDate = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00";
		String endDate = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00";
		int salePrice = Integer.parseInt(request.getParameter("salePrice"));
		SaleVo sv = new SaleVo(no, startDate, endDate, salePrice);
		int re = sdao.updateSale(sv);
		
		return re+"";
	}
	

	//특정 세일 상품의 DB 데이터를 삭제
	@RequestMapping("/sale-edit/delete")
	public String deleteSale(int no) {
		//DB에서 해당 세일의 데이터를 삭제
		sdao.deleteSale(no);
		return "redirect:/admin/sale-edit";
	}
	
	
	
	//GET 방식 접근, 세트 등록 페이지로 이동
	@RequestMapping(value = "/set-register", method = RequestMethod.GET)
	public String registerSetForm(HttpServletRequest request) {
		request.getSession().setAttribute("category", "set");
		request.getSession().setAttribute("function", "setRegister");
		request.getSession().setAttribute("nextNo", setdao.getNextNo());
		return "/admin/setRegister";
	}
	
	//POST 방식 접근, 입력된 세트 정보를 DB에 입력
	@RequestMapping(value = "/set-register", method = RequestMethod.POST)
	public ModelAndView registerSet(SetVo sv, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		//세트 이미지를 등록할 webapp/img 경로
		String path = request.getRealPath("/img");
		
		//파일 데이터를 받아와서 변수에 저장
		MultipartFile uploadImg = sv.getImgFile();
	
		//이미지 파일 이름을 set + 세트번호로 지정
		String mainImgName = util.renameSetImg(sv.getSet_no(), uploadImg);

		//DB에 수정된 이미지 파일 이름을 저장
		sv.setSet_img(mainImgName);
	
		try {
			util.uploadImg(path, uploadImg, mainImgName);
		} catch (IOException e) {

		}
		
		//세트 정보를 저장하는 쿼리문을 실행하고, 결과값을 확인
		int re = setdao.registerSet(sv);
		
		//등록 성공:1 , 실패:0
		if(re == 1) {
			mav.addObject("result", "등록 성공");
		}else {
			mav.addObject("result", "DB 등록 실패. 상품번호를 확인해주세요.");			
		}
		
		//해당 세트에 포함된 상품 번호를 리스트로 가져옴
		String[] arr = request.getParameterValues("productNo");
		
		for(String no:arr) {
			SetComponentVo cv = new SetComponentVo(sv.getSet_no(), Integer.parseInt(no));
			int re2 = setdao.registerSetComponent(cv);
		}
		
		request.setAttribute("nextNo", setdao.getNextNo());
		mav.setViewName("/admin/setRegister");
		return mav;
	}
	
	
	//GET 방식 접근, 세트 목록 페이지로 이동
	@RequestMapping(value= "/set-edit", method = RequestMethod.GET)
	public ModelAndView editSet(HttpServletRequest request) {
		request.getSession().setAttribute("category", "set");
		request.getSession().setAttribute("function", "setEdit");
		ModelAndView mav = new ModelAndView();
		mav.addObject("setList", setdao.findAll());
		mav.addObject("compList", setdao.findAllComponents());
		mav.setViewName("/admin/setEdit");
		return mav;
	}
	
	//GET 방식 접근, 세트 수정 페이지로 이동
	@RequestMapping(value= "/set-edit/{setNo}", method = RequestMethod.GET)
	public ModelAndView editSetDetail(@PathVariable int setNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("set", setdao.selectOne(setNo));
		mav.addObject("compList", setdao.findComponents(setNo));
		mav.setViewName("/admin/setEditDetail");
		return mav;
	}
	
	//POST 방식 접근, 세트 수정 페이지로 이동
	@RequestMapping(value= "/set-edit/{setNo}", method = RequestMethod.POST)
	@ResponseBody
	public String updateSet(@PathVariable int setNo, SetVo sv, HttpServletRequest request) {
		String path = request.getRealPath("/img");
		String imgName = "";
		
		if(sv.getImgFile().getSize() != 0) {
			//메인이미지가 변경되었다면 파일 삭제 후 새로운 이미지 파일명 지정
			String oldImgPath = path + "/" + sv.getSet_img();
			util.deleteImg(oldImgPath);			
			imgName = util.renameSetImg(sv.getSet_no(), sv.getImgFile());
			sv.setSet_img(imgName);
			
			try {
				util.uploadImg(path, sv.getImgFile(), imgName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int re = setdao.updateSet(sv);
		
		//하위 상품의 상품번호를 배열로 가져옴
		String[] arr = request.getParameterValues("productNo");
		re = setdao.deleteComponents(sv.getSet_no());
		
		for(String no: arr) {
			SetComponentVo cv = new SetComponentVo(sv.getSet_no(), Integer.parseInt(no));
			int re2 = setdao.registerSetComponent(cv);
		}

		return "";
	}
	
	//특정 세트 상품의 DB 데이터와 하위 상품 DB 데이터 삭제
	@RequestMapping("/set-edit/delete")
	public String deleteSet(int no, HttpServletRequest request) {
		SetVo sv = setdao.selectOne(no);
		String path = request.getRealPath("/img") + "/" + sv.getSet_img();
		util.deleteImg(path);
		//DB에서 해당 세트의 데이터를 삭제
		setdao.deleteComponents(no);
		setdao.deleteSet(no);
		return "redirect:/admin/set-edit";
	}
	
	//GET 방식 접근, 이벤트 등록 페이지로 이동
	@RequestMapping(value = "/event-register", method = RequestMethod.GET)
	public String registerEventForm(HttpServletRequest request) {
		request.getSession().setAttribute("category", "event");
		request.getSession().setAttribute("function", "eventRegister");
		request.getSession().setAttribute("nextNo", eventdao.getNextNo());
		return "/admin/eventRegister";
	}
	
	//POST 방식 접근, 이벤트를 DB에 입력하고 결과를 반환
	@RequestMapping(value = "/event-register", method = RequestMethod.POST)
	public String registerEvent(EventVo ev, HttpServletRequest request) {
		String startDate = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00";
		String endDate = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00";
		ev.setEvent_start(startDate);
		ev.setEvent_end(endDate);
		
		//세트 이미지를 등록할 webapp/img 경로
		String path = request.getRealPath("/img");
				
		//파일 데이터를 받아와서 변수에 저장
		MultipartFile uploadImg = ev.getImgFile();
			
		//이미지 파일 이름을 set + 세트번호로 지정
		String imgName = util.renameEventImg(ev.getEvent_no(), uploadImg);

		//DB에 수정된 이미지 파일 이름을 저장
		ev.setEvent_img(imgName);

		try {
			util.uploadImg(path, uploadImg, imgName);
		} catch (IOException e) {
		}
		
		//이미지 정보를 저장하는 쿼리문을 실행하고, 결과값을 반환
		int re = eventdao.registerEvent(ev);
		
		return "redirect:/admin/event-register";
	}
	
	//GET 방식 접근, 이벤트 목록을 보여줌
	@RequestMapping(value = "/event-edit", method = RequestMethod.GET)
	public ModelAndView editEvent(HttpServletRequest request) {
		request.getSession().setAttribute("category", "event");
		request.getSession().setAttribute("function", "eventEdit");
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", eventdao.findAll());
		mav.setViewName("/admin/eventEdit");
		return mav;
	}
	
	//GET 방식 접근, 이벤트 수정 페이지를 보여줌
	@RequestMapping(value = "/event-edit/{eventNo}", method = RequestMethod.GET)
	public ModelAndView editEventDetail(@PathVariable int eventNo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("event", eventdao.selectEvent(eventNo));
		mav.setViewName("/admin/eventEditDetail");
		return mav;
	}
	
	//POST 방식 접근, 입력된 이벤트 정보를 수정함
	@RequestMapping(value = "/event-edit/{eventNo}", method = RequestMethod.POST)
	@ResponseBody
	public String updateEvent(@PathVariable int eventNo, EventVo ev, HttpServletRequest request) {
		String startDate = request.getParameter("startDate") + " " + request.getParameter("startTime") + ":00";
		String endDate = request.getParameter("endDate") + " " + request.getParameter("endTime") + ":00";
		ev.setEvent_start(startDate);
		ev.setEvent_end(endDate);
		
		String path = request.getRealPath("/img");
		String imgName = "";
		
		if(ev.getImgFile().getSize() != 0) {
			//메인이미지가 변경되었다면 파일 삭제 후 새로운 이미지 파일명 지정
			String oldImgPath = path + "/" + ev.getEvent_img();
			util.deleteImg(oldImgPath);			
			imgName = util.renameEventImg(ev.getEvent_no(), ev.getImgFile());
			ev.setEvent_img(imgName);
			
			try {
				util.uploadImg(path, ev.getImgFile(), imgName);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int re = eventdao.updateEvent(ev);
		
		return "";
	}
	
	// 이벤트 이미지와 DB 데이터 삭제
	@RequestMapping("/event-edit/delete")
	public String deleteEvent(int no, HttpServletRequest request) {
		EventVo ev = eventdao.selectEvent(no);
		String path = request.getRealPath("/img") + "/" + ev.getEvent_img();
		util.deleteImg(path);
		int re = eventdao.deleteEvnet(no);
		
		return "redirect:/admin/event-edit";
	}
	
}
