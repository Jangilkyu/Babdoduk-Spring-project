package com.mall.vo.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MypageVo {

	private String mem_id;  // 회원아이디
	private String mem_pwd; // 회원비밀번호
	private String mem_name; // 회원이름
	private String mem_birth; // 회원생일
	private String mem_email; // 회원이메일
	private String mem_phone; // 전화번호
	private String mem_zipcode; // 우편번호
	private String mem_address; // 주소
	private String mem_detailaddress; // 상세주소
	
}
