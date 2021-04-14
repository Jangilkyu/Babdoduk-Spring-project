package com.mall.vo.Order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderProdListVo {

	private int product_no; // 상품 번호
	private String product_title; // 상품 제목
	private String product_subtitle; // 상품 서브 제목
	private String product_main_img; // 상품 이미지
	private int product_price; // 상품 가격
	private int product_total; // 고객 장바구니 상품 총 가격
	private int product_qty; // 고객 장바구니 상품 수량
	
}
