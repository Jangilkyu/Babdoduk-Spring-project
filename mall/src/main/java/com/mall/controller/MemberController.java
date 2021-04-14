package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.dao.user.UserDAO;
import com.mall.vo.user.UserVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MemberController {
	
	private final UserDAO userDAO;
	
	//회원가입으로
	@GetMapping("/signUp.do")
	public String signUp() {
		return "signUp";
	}
	
	//아이디 check
	@PostMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestBody String mem_id) {
		return String.valueOf(userDAO.idCheck(mem_id));
	}
	
	//이메일 check
	@PostMapping("/emailCheck.do")
	@ResponseBody
	public String eamilCheck(@RequestBody String mem_email) {
		return String.valueOf(userDAO.emailCheck(mem_email));
	}
	
	//회원가입 요청
	@PostMapping("/signUp.do")
	@ResponseBody
	public String signUp(@RequestBody UserVO userVO) {
		return String.valueOf(userDAO.memberSave(userVO));
	}

}
