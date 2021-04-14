package com.mall.vo.faq;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class FaqVo {
	private int faq_no;
	private String faq_title; 
	private String faq_content; 
	private Timestamp faq_regdate;	
	private int faq_hit;
	private String faq_manager; 
	private MultipartFile uploadFile;
}
