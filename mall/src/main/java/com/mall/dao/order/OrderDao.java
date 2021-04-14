package com.mall.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.Order.OrderListVo;
import com.mall.vo.Order.OrderProdListVo;
import com.mall.vo.Order.OrderShippingVo;

@Repository
public class OrderDao {
	
	private SqlSession sqlSession;
	
	public OrderDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}//InquiryDao

	public List<OrderProdListVo> findCartList(String mem_id) {
		
		List<OrderProdListVo> cVoList = sqlSession.selectList("order.findCartList",mem_id);
		
		return cVoList;
	}// findCartList


	public int getTotAmount(String mem_id) {
		
		int totAmount = sqlSession.selectOne("cart.sumPrice",mem_id);
		
		return totAmount;
	}

	public OrderShippingVo selectMemShip(String mem_id) {
		
		OrderShippingVo ospVo = sqlSession.selectOne("order.selectMemShip",mem_id);
		
		return ospVo;
	}

	public int selectQty(String mem_id) {
		
		int totQty = sqlSession.selectOne("order.selectQty",mem_id);
		return totQty;
	}

	public int selelctProdQty(String mem_id) {
		
		int prodQty = sqlSession.selectOne("order.selelctProdQty",mem_id);
		return prodQty;
	}

	public int insertOrderInfo(HashMap<String, Object> map) {
		
		HashMap<String, Object> orderInfoMap = new HashMap<>();
		
		orderInfoMap.put("order_phone", map.get("phone"));
		orderInfoMap.put("order_name", map.get("name"));
		orderInfoMap.put("order_totprice", map.get("lastTot"));
		orderInfoMap.put("order_addr", map.get("addr"));
		orderInfoMap.put("order_zipcode", map.get("zipcode"));
		orderInfoMap.put("order_detailAddr", map.get("detailAddr"));
		orderInfoMap.put("order_mem_id", map.get("mem_id"));
		
		int re = sqlSession.insert("order.insertOrderInfo",orderInfoMap);
		commit();
		
		return re;
	}
	// 커밋
	public void commit(){
		sqlSession.commit();
	}

	
}//OrderDao
