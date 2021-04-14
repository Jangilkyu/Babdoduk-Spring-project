package com.mall.vo.Order;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class OrderVo {

	private int order_no; // 주문번호
	private int cart_no; // 장바구니 번호
	private Timestamp order_date; // 주문 날짜
	private String order_phone; // 수령인
	private String order_addr; // 연락처
	private String order_message; // 주소
	private String order_payment_info; // 결제수단
	private int totalprice; // 총 금액
	private String orderprivacy; // 개인정보 수집/제공
	private String mem_id; // 회원 아이디
	
}
