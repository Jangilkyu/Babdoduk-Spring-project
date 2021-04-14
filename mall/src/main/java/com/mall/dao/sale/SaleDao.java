package com.mall.dao.sale;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.product.ProductVo;
import com.mall.vo.sale.SaleProductVo;
import com.mall.vo.sale.SaleVo;

@Repository
public class SaleDao {

	private SqlSession sqlSession;
	
	public SaleDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}
	
	//timesale 테이블에 데이터를 입력하고 성공 여부를 반환합니다
	public int registerSale(SaleVo sv) {
		int re = sqlSession.insert("sale.register", sv);
		if (re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//timesale 테이블의 모든 데이터를 조회하고, List로 반환합니다
	public List<SaleProductVo> findAll(){
		SaleProductDao dao = sqlSession.getMapper(SaleProductDao.class);
		List<SaleProductVo> list = dao.findAll();
		return list;
	}
	
	//timesale 테이블에서 현재 시간상 유효기간에 속하는 상품의 데이터를 조회하고, List로 반환합니다 
	public List<SaleProductVo> selectValid(){
		SaleProductDao dao = sqlSession.getMapper(SaleProductDao.class);
		List<SaleProductVo> list = dao.selectValid(getNow());
		return list;
	}
	
	//timesale 테이블에서 현재 시간상 유효기간에 속하는 상품의 데이터를 조회하고, Map으로 반환합니다
	public HashMap<Integer, SaleVo> selectValidMap(){
		List<SaleVo> list = new ArrayList<>();
		list = sqlSession.selectList("sale.selectValid", getNow());
		HashMap<Integer, SaleVo> saleMap = new HashMap<>();
		for(SaleVo sv : list) {
			saleMap.put(sv.getProduct_no(), sv);
		}
		return saleMap;
	}
	
	//timesale 테이블의 특정 데이터 조회 후 반환합니다
	public SaleVo selectOne(int no) {
		SaleVo sv = sqlSession.selectOne("sale.selectOne", no);
		return sv;
	}
	
	//timesale 테이블의 데이터를 수정하고 성공 여부를 반환합니다
	public int updateSale(SaleVo sv) {
		int re = sqlSession.update("sale.update", sv);
		if (re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//timesale 테이블의 데이터를 삭제하고 성공 여부를 반환
	public int deleteSale(int no) {
		int re = sqlSession.delete("sale.delete", no);
		if(re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//db의 시간과 현재시간의 비교를 위해 현재시간을 원하는 포맷으로 추출
	public String getNow() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = sdf.format(date);
		return now;
	}
	
	public void commit() {
    	sqlSession.commit();
    }

}
