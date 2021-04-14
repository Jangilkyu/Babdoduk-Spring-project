package com.mall.vo.Order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CartVo {
	private int cart_no; // 장바구니 번호
	private String mem_id; // 주문자 회원 번호
	private int product_no; // 상품 번호
	private int product_qty; // 상품 수량
	private int subs_no; // 정기구독 번호
	private int set_no; // 세트상품 번호
	private int product_price; // 상품 단가
	private int product_total; // 총 상품 가격
	private String product_title; //상품명
}
