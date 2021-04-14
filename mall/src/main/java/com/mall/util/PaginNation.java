package com.mall.util;

import lombok.Getter;

@Getter
public class PaginNation {
	
	private int totalpage; //총 보여질 page
	private int count; //한 페이지에서 보여질 게시글의 수
	private int start; //검색 시작 조건
	private int end; //검색 끝 조건
	
	public PaginNation(int totlaRecord,int pageNumber) {
		//총 레코드를 받고, 현재 pageNumber을 매개변수로 받아서 검색 시작 끝 조건을 생성
		
		//한 페이지에서 보여질 리뷰는 10건으로 제한
		this.count = 10;
		
		//보여질 총 페이지는 전체 레코드에서 한페이지에서 보여질 게시글을 나누고 올려준다.
		this.totalpage = (int)Math.ceil((totlaRecord/(double)count));
		
		//검색 시작 조건 (만약 현제 페이지가 1이면 (1*10) - 10 으로 검색 시작조건 0부터 시작
		this.start = (count*pageNumber) - count;
		//검색 끝 조건 (0부터 시작이면 한 페이지에서 보여질 게시글의 수를 더해주고 1을 더한다. 11까지
		this.end = this.start + count + 1;
		
		//이로인해 생성되는 검색조건은 0< 검색될 게시글 <11 으로 총 10개가 조회
	}
	

}
