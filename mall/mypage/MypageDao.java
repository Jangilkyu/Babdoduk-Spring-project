package com.mall.dao.mypage;

import static com.mall.db.SqlSessionFactoryBean.commit;
import static com.mall.db.SqlSessionFactoryBean.getSqlSession;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.mypage.MypageVo;

@Repository
public class MypageDao {

	private SqlSession sqlSession;
	
	public MypageDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
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
		
		int re = getSqlSession().update("mypage.updatePhone",map);

		getSqlSession().commit();

		return re;
	}

}
