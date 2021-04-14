package com.mall.vo.review;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	
	//사용자가 글 작성을 했을 경우 받을 VO
	private int review_no; //리뷰 글번호
	private String mem_id; //사용자 아이디
	private int product_no; //상품 번호
	private String review_title; //리뷰 제목
	private String review_content; //리뷰 내용
	private Timestamp review_regdate; //리뷰 작성시간
	private Timestamp review_update; //리뷰 업데이트 시간
	private int review_hit; //조회수
	private String product_title; //상품명
	private String review_fname; //리뷰 이미지
	private MultipartFile uploadFile; //업로드되는 파일
	
}
