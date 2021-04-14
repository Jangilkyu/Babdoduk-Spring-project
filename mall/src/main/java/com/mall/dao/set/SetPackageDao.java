package com.mall.dao.set;

import java.util.List;

import com.mall.vo.set.SetProductVo;

public interface SetPackageDao {
	List<SetProductVo> findAllComponents();
}
