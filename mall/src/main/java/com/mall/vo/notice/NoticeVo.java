package com.mall.vo.notice;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVo {
	private int notice_no;
	private String notice_title; 
	private String notice_content; 
	private Timestamp notice_regdate;
	private int notice_hit;
	private String notice_manager; 
}
