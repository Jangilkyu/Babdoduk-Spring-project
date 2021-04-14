package com.mall.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.mall.dao.order.OrderDao;
import com.mall.vo.Order.OrderListVo;
import com.mall.vo.Order.OrderProdListVo;
import com.mall.vo.Order.OrderShippingVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("payment")
@RequiredArgsConstructor
public class OrderController {
	
	private final OrderDao dao;

	// 결제페이지로 이동
	@GetMapping("/order")
	public String paymentForm(Model model,HttpSession session) {
		
		// 세션
		String mem_id = (String) session.getAttribute("login");
		
		System.out.println("order"+mem_id);
		// 고객이 담은 장바구니 상품 정보 (상품번호/제목/서브제목/이미지/고객 장바구니 상품 총 가격/고객 장바구니 상품 수량)
		List<OrderProdListVo> cVoList = dao.findCartList(mem_id);
		
		// 상품 총 구매 가격 정보
		int totAmount = dao.getTotAmount(mem_id);
		
		// 배송지 정보
		OrderShippingVo ospVo = dao.selectMemShip(mem_id);
		
		// 장바구니 전체 금액에 따른 배송료 구분
		// 배송료(10만원 이상 무료, 미만 2500원)
		int fee = totAmount >= 100000 ? 0 : 2500;
		
		// 상품 세부 총 갯수 
		int totQty = dao.selectQty(mem_id);

		// 결제 시 상품 외 X건
		int prodQty = dao.selelctProdQty(mem_id);
		
		// 상품 총 구매 가격
		model.addAttribute("totAmount",totAmount);
		
		// 고객 배송지 정보
		model.addAttribute("ospVo", ospVo);
		
		model.addAttribute("totQty", totQty);
		
		// 상태유지 - 고객이 담은 장바구니 상품 정보 (상품번호/제목/서브제목/이미지/고객 장바구니 상품 총 가격/고객 장바구니 상품 수량)
		model.addAttribute("cVoList",cVoList);
		
		// 배송료
		model.addAttribute("fee",fee);
		
		// 결제시 구매상품 외 x건
		model.addAttribute("prodQty", prodQty);
		
		// 주문금액 + 배송비
		model.addAttribute("lastTot",totAmount +fee);
		
		// 회원아이디
		model.addAttribute("mem_id",mem_id);
		
		return "/payment/order";
	}//paymentForm
	
	@PostMapping("paymentResult")
	@ResponseBody
	public String paymentResult(Model model, @RequestBody HashMap<String, Object> map) {
		
		dao.insertOrderInfo(map);
		
		return "";
	}
	
}//class
