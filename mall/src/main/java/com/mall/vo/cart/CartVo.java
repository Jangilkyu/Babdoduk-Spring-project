package com.mall.vo.cart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartVo {
	private int cart_no;
	private String mem_id;
	private int product_no;
	private int product_qty;
	private int subs_no;
	private int set_no;
	private int product_price;
	private int product_total;
	private String product_title;
	private String product_main_img;
}
