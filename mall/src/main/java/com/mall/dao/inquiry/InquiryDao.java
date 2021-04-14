package com.mall.dao.inquiry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mall.db.SqlSessionFactoryBean;
import com.mall.vo.answer.answerVo;
import com.mall.vo.inquiry.InquiryEmailPhoneVo;
import com.mall.vo.inquiry.InquiryVo;
import com.mall.vo.mypage.MyInqDetRespVo;
import com.mall.vo.mypage.MyInqDetailVo;
import com.mall.vo.mypage.MyInqListVo;
import com.mall.vo.user.UserVO;

@Repository
public class InquiryDao {
	
	private SqlSession sqlSession;
	
	public InquiryDao() {
		sqlSession = SqlSessionFactoryBean.getSqlSession();
	}//InquiryDao
	
	// [검색]과[선택] 조건에 따른 총 레코드 수
	public int totBoard(String mem_id, String keyword, String searchFeild) {

		Map<String, Object> map = new HashMap<>();

		map.put("cs_mem_id", mem_id);
		map.put("keyword", keyword);
		map.put("searchFeild", searchFeild);

		int total = sqlSession.selectOne("inquiry.totBoard",map);
		
		return total;
	}
	
	public UserVO getMemberInfo(String mem_id) {
		
		UserVO uv = sqlSession.selectOne("inquiry.findAll",mem_id);
		
		return uv;
	}//getMemberInfo

	public int insertInquiry(InquiryVo ivo, String cs_email, String cs_phone, String mem_id) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		//회원 아이디
		map.put("cs_mem_id", mem_id);
		
		// 1:1문의 내역
		map.put("cs_title",ivo.getCs_title());
		map.put("cs_content",ivo.getCs_content());
		map.put("cs_category_one",ivo.getCs_category_one());
		map.put("cs_category_two",ivo.getCs_category_two());
		map.put("cs_response","미답변");
		map.put("cs_respcheck",0);
		
		// 연락받을 연락처
		map.put("cs_email", cs_email);
		map.put("cs_phone", cs_phone);
		
		// 사용자가 올린 이미지
		map.put("cs_fname", ivo.getCs_fname());
		
		System.out.println(map);
		
		int re = sqlSession.insert("inquiry.insertInquiry",map);
		
		if(re == 1) {
			commit();
		}//end if
		
		return re;
	}//insertInquiry
	
	public List<InquiryVo> findAllInquiry(int start, int end,String keyword, String searchFeild) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchFeild", searchFeild);
		map.put("start", start);
		map.put("end", end);
		
		List<InquiryVo> list = sqlSession.selectList("inquiry.findAllInquiry",map);
		
		return list;
	}//findAllInquiry


	public InquiryVo selectInquiry(int cs_no) {
		
		InquiryVo userIqVo = sqlSession.selectOne("inquiry.selectInquiry",cs_no);
		
		return userIqVo;
	}//selectInquiry
	
	public InquiryEmailPhoneVo getMemberEmail(int cs_no) {
		
		InquiryEmailPhoneVo iep = sqlSession.selectOne("inquiry.getMemberEmail",cs_no);
		
		return iep;
	}//getMemberEmail

	public int insertAnswer(answerVo answerVo,int cs_no,String cs_mem_id) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("ans_title",answerVo.getAns_title());
		map.put("ans_content",answerVo.getAns_content());
		map.put("ans_cs_no", cs_no);
		map.put("ans_cs_mem_id", cs_mem_id);
		
		int re = sqlSession.insert("inquiry.insertAnswer",map);
		
		commit();
		
		return re;
	}
	
	public void commit() {
		sqlSession.commit();
	}//commit


	public List<MyInqListVo> findMyInq(String cs_mem_id, int start, int end, String keyword, String searchFeild) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchFeild", searchFeild);
		map.put("keyword", keyword);
		map.put("cs_mem_id", cs_mem_id);
		map.put("start", start);
		map.put("end", end);
		
		List<MyInqListVo> list = sqlSession.selectList("inquiry.findMyInq",map);
		return list;
	}

	// 미답변 -> 답변으로 변경
	public int ansOK(int cs_no) {
		
		Map<String, Object> map = new HashMap<>();

		map.put("cs_no", cs_no);
		map.put("cs_response", "답변");
		map.put("cs_respcheck", 1);
		
		int re =sqlSession.update("inquiry.updateRep",map);
		
		if(re == 1) {
			commit();
		}
		
		return re;
	}//ansOK


	public MyInqDetailVo findDetailInq(int cs_no) {
		
		MyInqDetailVo detailVo = sqlSession.selectOne("inquiry.detailInq",cs_no);
		
		return detailVo;
	}


	public MyInqDetRespVo findInqResp(int cs_no) {
		
		MyInqDetRespVo midr = sqlSession.selectOne("inquiry.findInqResp",cs_no);
		
		return midr;
	}


	public int cntTbCs(String keyword, String searchFeild) {

		Map<String, Object> map = new HashMap<>();
		
		map.put("keyword", keyword);
		map.put("searchFeild", searchFeild);
		
		int cntTbCs = sqlSession.selectOne("inquiry.cntTbCs",map);

		return cntTbCs;
	}


}//InquiryDao
