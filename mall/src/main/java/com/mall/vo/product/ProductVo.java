package com.mall.vo.product;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVo {
	private int product_no;	// 상품번호
	private String product_category; // 상품 카테고리
	private int category_no; // 카테고리 번호
	private int product_stock; // 상품 재고수량
	private String product_title; // 상품명
	private String product_subtitle; // 상품 서브제목
	private String product_main_img; // 상품 메인이미지
	private int product_caloies; // 상품 칼로리
	private String product_origin; // 상품 원산지
	private String product_storage; // 상품 보관방법
	private String product_detail_img1; // 상품 상세이미지1
	private String product_detail_img2; // 상품 상세이미지2
	private String product_detail_text; // 상품 상세설명
	private String product_ingredient; // 재료
	private int product_price; // 상품 가격
	private Timestamp product_regdate; // 상품 등록일
	private MultipartFile mainImgFile;
	private MultipartFile detailImgFile1;
	private MultipartFile detailImgFile2;
}
