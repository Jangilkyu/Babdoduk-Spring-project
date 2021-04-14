package com.mall.vo.set;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SetVo {
	private int set_no;
	private String set_title;
	private String set_subtitle;
	private String set_img;
	private int set_stock;
	private int set_price;
	private Timestamp set_regdate;
	private String set_detail_text;
	private MultipartFile imgFile;
}
