package com.mall.dao.set;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.product.ProductVo;
import com.mall.vo.set.SetComponentVo;
import com.mall.vo.set.SetProductVo;
import com.mall.vo.set.SetVo;

@Repository
public class SetDao {
	
	private SqlSession sqlSession;
	
	public SetDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}
	
	//세트 상품을 등록하고 성공 여부를 반환합니다
	public int registerSet(SetVo sv) {
		int re = sqlSession.update("sets.register", sv);
		if(re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//제일 최근 등록된 세트 상품의 번호를 반환합니다
	public int getNextNo() {
		int re = 0;
		try {
			re = sqlSession.selectOne("sets.getNextNo");
		} catch(Exception e) {
			//세트 상품 데이터 개수가 0일 때 예외 발생
		}
		return re + 1;
	}
	
	//세트 상품의 구성품을 등록하고 성공 여부를 반환합니다
	public int registerSetComponent(SetComponentVo cv) {
		int re = sqlSession.update("sets.registerComponent", cv);
		if(re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//모든 세트상품의 정보를 반환합니다
	public List<SetVo> findAll(){
		List<SetVo> list = null;
		list = sqlSession.selectList("sets.findAll");
		return list;
	}
	
	//모든 세트상품의 하위 상품을 반환합니다
	public List<SetProductVo> findAllComponents(){
		SetPackageDao dao = sqlSession.getMapper(SetPackageDao.class);
		List<SetProductVo> list = dao.findAllComponents();
		return list;
	}
	
	//세트 상품 하나의 정보를 반환합니다
	public SetVo selectOne(int no) {
		SetVo sv = new SetVo();
		sv = sqlSession.selectOne("sets.selectOne", no);
		return sv;
	}
	
	//특정 세트 상품에 속하는 상품들을 반환합니다
	public List<ProductVo> findComponents(int no){
		List<ProductVo> list = new ArrayList<>();
		list = sqlSession.selectList("sets.selectComponents", no);
		return list;
	}
	
	//세트 상품 정보를 수정하고 성공 여부를 반환합니다
	public int updateSet(SetVo sv) {
		int re = sqlSession.update("sets.update", sv);
		return re;
	}
	
	//세트 상품 정보를 삭제합니다
	public int deleteSet(int no) {
		int re = sqlSession.delete("sets.delete", no);
		if(re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
	//세트 상품의 하위 상품 목록을 삭제하고 성공 여부를 반환합니다
	public int deleteComponents(int no) {
		int re = sqlSession.delete("sets.deleteComponents", no);
		if(re == 1) {
			sqlSession.commit();
		}
		return re;
	}
	
}
