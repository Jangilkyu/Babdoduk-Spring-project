package com.mall.vo.answer;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class answerVo {

	private int ans_no;
	private String ans_title;
	private String ans_content;
	private Timestamp ans_regdate;
	private int ans_cs_no;
	
}
