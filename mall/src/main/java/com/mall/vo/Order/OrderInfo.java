package com.mall.vo.Order;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderInfo {
	
	private String order_mem_id;
	private int order_cart_no;
	private int order_set_no;
	private String order_phone;
	private String order_totprice;
	private String order_addr;
	private String order_zipcode;
	private String detailAddr;

}
