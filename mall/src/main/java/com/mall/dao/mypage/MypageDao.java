package com.mall.dao.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.Order.OrderListVo;
import com.mall.vo.mypage.MaskingVo;
import com.mall.vo.mypage.MyInqDetailVo;
import com.mall.vo.mypage.MyInqListVo;
import com.mall.vo.mypage.MypageVo;
import com.mall.vo.mypage.ShippingVo;

@Repository
public class MypageDao {

	private SqlSession sqlSession;
	
	public MypageDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}
	
	
	public int totBoard(String cs_mem_id) {
		
		int total = sqlSession.selectOne("mypage.totBoard",cs_mem_id);
		return total;
	}
	
	
	public MypageVo getMemberinfo(String admin) {
		
		MypageVo mVo = sqlSession.selectOne("mypage.getUserinfo",admin);

		return mVo;
	}

	public int updateEmail(String email, String admin) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mem_email", email);
		map.put("mem_id", admin);
		
		int re = sqlSession.update("mypage.updateEmail",map);
		
		if(re == 1) {
			commit();
			System.out.println(re);
		}
		return re;
	}

	public int updatePhone(String phone, String admin) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mem_phone", phone);
		map.put("mem_id", admin);
		
		int re = sqlSession.update("mypage.updatePhone",map);

		if(re == 1) {
			commit();
		}

		return re;
	}

	public MypageVo getMemberid(String mem_id) {
		
		MypageVo mVo = sqlSession.selectOne("mypage.getMemberId",mem_id);
		
		return mVo;
	}

	public int getPwd(String currPassword, String mem_id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mem_id", mem_id);
		map.put("mem_pwd", currPassword);
		
		int pwd = sqlSession.selectOne("mypage.getPwd",map);
		
		return pwd;
	}

	public int updatePwd(String newPassword, String mem_id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mem_id", mem_id);
		map.put("mem_pwd", newPassword);
		
		
		int re = sqlSession.update("mypage.updatePwd",map);
		
		commit();
		
		return re;
	}

	public int deleteId(String mem_id) {
		
		System.out.println(mem_id);
		int re = sqlSession.delete("mypage.deleteId",mem_id);
		
		commit();
		
		return re;
	}

	public List<MyInqListVo> findMyInq(String cs_mem_id, int start, int end) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("cs_mem_id", cs_mem_id);
		map.put("start", start);
		map.put("end", end);
		
		
		List<MyInqListVo> list = sqlSession.selectList("mypage.findMyInq",map);
		
		return list;
	}

	public MyInqDetailVo findDetailInq(int cs_no) {
		
		MyInqDetailVo detailVo = sqlSession.selectOne("mypage.detailInq",cs_no);
		
		return detailVo;
	}

	public ShippingVo getShipping(String mem_id) {
		
		ShippingVo spVo = sqlSession.selectOne("mypage.getShipping",mem_id);
		
		return spVo;
	}

	public int updateShipping(ShippingVo spVo,String mem_id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("mem_zipcode", spVo.getMem_zipcode());
		map.put("mem_address", spVo.getMem_address());
		map.put("mem_detailaddress", spVo.getMem_detailaddress());
		map.put("mem_id", mem_id);
		
		int re = sqlSession.update("mypage.updateShipping",map);
		
		if(re == 1) {
			commit();
		}
		
		return re;
	}

	
	public MaskingVo getMaskInfo(String mem_id) {
		
		MaskingVo maskVo = sqlSession.selectOne("mypage.getMaskInfo", mem_id);
		
		return maskVo;
	}

	public List<OrderListVo> findOrderList(String order_mem_id) {

		List<OrderListVo> odList = sqlSession.selectList("mypage.findOrderList",order_mem_id);
		
		return odList;
	}
	
	public void commit() {
		sqlSession.commit();
	}


}
