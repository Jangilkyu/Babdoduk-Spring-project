package com.mall.vo.set;

import com.mall.vo.product.ProductVo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SetProductVo {
	private SetComponentVo component;
	private ProductVo product;
}
