package com.mall.vo.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ShippingVo {
	
	private String mem_zipcode; // 우편번호
	private String mem_address; // 주소
	private String mem_detailaddress; // 상세주소

}
