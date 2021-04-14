package com.mall.vo.review;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UpdateReviewRequestVO {
	
	//Update를 진행할 때 사용될 객체
	private int review_no;
	private String review_fname;
	private String review_title;
	private String review_content;
	private MultipartFile uploadFile;
}
