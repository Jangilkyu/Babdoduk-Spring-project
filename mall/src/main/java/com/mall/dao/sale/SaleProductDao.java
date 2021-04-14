package com.mall.dao.sale;

import java.util.List;

import com.mall.vo.sale.SaleProductVo;

public interface SaleProductDao {
	List<SaleProductVo> findAll();
	List<SaleProductVo> selectValid(String now);
}
