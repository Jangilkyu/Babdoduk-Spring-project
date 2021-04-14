package com.mall.dao.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.cart.CartVo;

@Repository
public class CartDao {

	private SqlSession sqlSession;

	public CartDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}

	// 장바구니에 상품 담기
	public void insertCart(CartVo cv) {
		int re = sqlSession.insert("cart.insert", cv);
		if (re == 1) {
			sqlSession.commit();
		}
	}
	
	// 장바구니 목록보기
	public List<CartVo> listCart(String mem_id) {
		List<CartVo> list = null;
		list = sqlSession.selectList("cart.listCart", mem_id);
		return list;
	}
	
	public CartVo selectCart(int cart_no) {
		CartVo cv = sqlSession.selectOne("cart.select", cart_no);
		return cv;
	}
	
	// 장바구니 금액 합계
	public int sumPriceCart(String mem_id) {
		int re = sqlSession.selectOne("cart.sumPrice", mem_id);
		if (re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	// 장바구니 수정
	public void modifyCart(CartVo cv) {
		int re = sqlSession.update("cart.modify", cv);
		if (re == 1) {
			sqlSession.commit();
		}
	}

	// 장바구니에 담긴 상품 삭제
	public void deleteCart(int cart_no) {
		int re = sqlSession.delete("cart.delete", cart_no);
		if (re == 1) {
			sqlSession.commit();
		}
	}	
	
	public void selectDeleteCart(CartVo cv) {
		int re = sqlSession.delete("cart.selectDelete", cv);
		if (re == 1) {
			sqlSession.commit();
		}
	}	

	// 장바구니 동일 상품 레코드 검사
	public int countCart(int product_no, String mem_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_no", product_no);
		map.put("mem_id", mem_id);

		int re = sqlSession.selectOne("cart.count", map);
		if (re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	// 장바구니 수량 변경
		public void updateCart(CartVo cv) {
			int re = sqlSession.update("cart.update", cv);
			if (re == 1) {
				sqlSession.commit();
			}
		}
	
	public void commit() {
		sqlSession.commit();
	}
}
