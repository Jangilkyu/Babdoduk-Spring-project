package com.mall.vo.event;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventVo {
	private int event_no;
	private String event_title;
	private String event_content;
	private String event_img;
	private String event_start;
	private String event_end;
	private int event_hit;
	private Timestamp event_regdate;
	private String event_link;
	private MultipartFile imgFile;
}
