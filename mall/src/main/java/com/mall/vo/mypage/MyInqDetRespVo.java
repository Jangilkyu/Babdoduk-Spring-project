package com.mall.vo.mypage;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyInqDetRespVo {

	private String ans_title; // 답변 제목
	private String ans_content; // 답변 내용
	private Timestamp ans_regdate; // 답변 일 시
	private int ans_cs_no; // 문의 번호
	
}
