package com.mall.vo.mypage;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PwdPhoneAuthVo {
	
	private String mem_id; // 회원 아이디
	private String code; // 인증번호
	private int result; // 1 또는 0
	
}
