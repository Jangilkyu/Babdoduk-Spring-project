package com.mall.vo.review;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class LoadListResponseVO {
	
	//검색한 결과 및 총 페이지 수를 json으로 넘겨주기위한 객체
	private List<ReviewVO> reviewList;
	private int totalPage;

}
