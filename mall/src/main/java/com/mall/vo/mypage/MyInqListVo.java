package com.mall.vo.mypage;





import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyInqListVo {

	private String cs_no;
	private String cs_category_one;
	private String cs_category_two;
	private String cs_title;
	private Timestamp cs_regdate;
	private String cs_response;
}
