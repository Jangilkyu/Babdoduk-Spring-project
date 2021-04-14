package com.mall.vo.sale;

import com.mall.vo.product.ProductVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaleProductVo {
	private SaleVo sale;
	private ProductVo product;
}
