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
public class OrderListVo {

	private int order_no; // 결제 주문 번호
	private Timestamp order_date; // 결제 시간
	private String order_name; // 수령인
	private String order_phone; // 핸드폰번호
	private String order_addr; // 주소
	private String order_zipcode; // 우편번호
	private String order_detailaddr; // 상세주소
	private String order_totprice; // 가격
	private String order_mem_id; // 주문 회원 아이디
}
