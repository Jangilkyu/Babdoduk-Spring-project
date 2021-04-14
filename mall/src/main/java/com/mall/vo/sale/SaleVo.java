package com.mall.vo.sale;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaleVo {
	private int product_no;
	private String timesale_start;
	private String timesale_end;
	private int timesale_saleprice;
}
