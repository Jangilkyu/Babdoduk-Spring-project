package com.mall.vo.review;

import lombok.Getter;

@Getter
public class LoadListRequestVO {

	//ajax통신을 통해 스크립트 단에서 페이지번호와 키워드를 받는다.
	private int pageNumber;
	private String keyword;

}
