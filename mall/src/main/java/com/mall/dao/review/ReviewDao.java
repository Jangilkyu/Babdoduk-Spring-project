package com.mall.dao.review;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.review.ReviewVO;
import com.mall.vo.review.UpdateReviewRequestVO;

@Repository
public class ReviewDao {
	
	private SqlSession session;
	
	public ReviewDao() {
		this.session = SqlSessionFactoryBean.getSqlSession();
	}//ReviewDao
	
	//리뷰 저장
	public int save(ReviewVO reviewVO) {
		int result =  session.insert("reviewMapper.save", reviewVO);
		if(result == 1) {
			session.commit();
		}//end if
		
		return result;
	}//end save
	
	//리뷰게시판 레코드 수 검색
	public int findTotalRecord(String keyword) {
		return session.selectOne("reviewMapper.findTotalRecord",keyword);
	}//findTotalRecord
	
	//게시판 List 검색
	public List<ReviewVO> findAllPaging(Map<String, Object> loadListMap){
		return session.selectList("reviewMapper.findAllPaging", loadListMap);
	}

	public ReviewVO findByNo(int review_no) {
		return session.selectOne("reviewMapper.findByNo",review_no);
	}

	public int deleteByNo(int review_no) {
		int result = session.delete("reviewMapper.deleteByNo", review_no);
		if (result == 1) {
			session.commit();
		}//end if
		return result;
	}

	public int update(UpdateReviewRequestVO updateReviewRequestVO) {
		int result = session.update("reviewMapper.update", updateReviewRequestVO);
		
		if (result == 1) {
			session.commit();
		}//end if
		return result;
	}

	public void updateHit(int review_no) {
		session.update("reviewMapper.updateHit",review_no);
		session.commit();
	}
	
	public List<ReviewVO> selectProductReview(int no) {
		List<ReviewVO> list = new ArrayList<>();
		list = session.selectList("reviewMapper.findProduct", no);
		return list;
	}

}
