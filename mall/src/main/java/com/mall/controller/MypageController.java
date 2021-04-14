package com.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.dao.mypage.MypageDao;
import com.mall.interceptor.LoginSessionListener;
import com.mall.smswebservice.BanchanSms;
import com.mall.vo.Order.OrderListVo;
import com.mall.vo.mypage.MaskingVo;
import com.mall.vo.mypage.MypageVo;
import com.mall.vo.mypage.ShippingVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MypageController {

	private final MypageDao dao;
	private final JavaMailSender javaMailSender;
	private final LoginSessionListener lsl;
	//페이징 처리 관련 변수
	public static int pageSIZE = 10; // 한 화면에 보여지는 레코드 수
	public static int totalRecord = 0; //전체 레코드 수
	public static int totalPage = 1;// 전체 페이지 수
	
	// 마이페이지 리스트
	@GetMapping("mypage")
	public String Mypage(Model model, HttpSession session, HttpServletRequest request,  HttpServletResponse response ) throws IOException {

		String mem_id =null;
		mem_id = (String) session.getAttribute("login");
		// 마스킹
		MaskingVo maskVo = new MaskingVo();
		
		maskVo = dao.getMaskInfo(mem_id);
		
		// 이메일 마스킹
		String email = maskVo.getMem_email();
		Pattern pattern = Pattern.compile("(.)(.*?)(.@.)(.*?)(\\.[^\\.]+)$");
		Matcher matcher = pattern.matcher(email);
		if (matcher.find()) {
		    email = matcher.group(1) + matcher.group(2).replaceAll(".", "*") +
		            matcher.group(3) + matcher.group(4).replaceAll(".", "*") +
		            matcher.group(5);
		}

		// 핸드폰번호 마스킹
		String replaceString = maskVo.getMem_phone();
		String matchedStr ="";

		String pattern1 ="(\\d{2,3})-?(\\d{3,4})-?(\\d{3,4})";
		Matcher matcher2 = Pattern.compile(pattern1).matcher(replaceString);

		if(matcher2.find()){
			StringBuffer br = new StringBuffer();
			for(int i = 1 ; i<=matcher2.groupCount(); i++){
				matchedStr = matcher2.group(i);
				for(int j = 0 ; j <matchedStr.length();j++){
					br.append("*");
				}
			}
			replaceString =matcher2.replaceAll(br.toString());
		}
		model.addAttribute("email",email);
		model.addAttribute("maskPhone",replaceString);
		
		session.setAttribute("login", mem_id);
		
		return "mypage/mypage";
	}//Mypage
	
	// 회원의 Email & Phone 정보 변경 뷰 페이지
	@GetMapping("/userInfoUpdate")
	public String updateForm(Model model,HttpSession session,HttpServletRequest request) {

		String id = (String) session.getAttribute("login");
		
		// 회원 아이디와 이름을 가져온다.
		MypageVo mVo = dao.getMemberinfo(id);
		// 상태 유지 후 뷰 페이지로 이동
		model.addAttribute("mVo",mVo);
 		return "/mypage/userInfoUpdate";
 		
	}//ModelAndView
	
	// 이메일 인증번호 난수
	@GetMapping("/sendEmailCode")
	@ResponseBody
	public String sendEmailCode(String email) {
		// 랜덤함수 객체
		Random random = new Random();
		// 인증을 위한 랜덤 값 추출
		int chkCode = random.nextInt(888888) + 111111;
		String code = String.valueOf(chkCode);

		// 인증 코드 메일 제목
		String subject = "[밥도둑] 이메일 변경 인증 메시지입니다.";
		// 인증 코드 메일 내용
		String content = "밥도둑을 항상 이용해주셔서 항상 감사합니다\n\n"
						+ "인증 번호는[" + code + "]입니다.\n" 
						+ "해당 인증번호를 인증번호 확인란에 기입해주시면 감사하겠습니다.\n"
						+ "오늘도 즐거운 쇼핑되세요.";
		// 인증 코드 메일 보내기
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
		mailMessage.setSubject(subject); // 제목
		mailMessage.setFrom("jewelrye6"); // 보내는 계정
		mailMessage.setText(content); // 내용
		mailMessage.setTo(email); // 보낼 메일
		// 메일 전송
		javaMailSender.send(mailMessage);
		// 리턴 후 ajax 통해 클라이언트가 입력한 값과 code값 비교
		return code;
	}//sendEmailCode
	
	// AJAX을 통한 이메일 인증코드가 맞을 시 해당 메소드로 호출 시 변경
	@GetMapping("/updateEmail")
	@ResponseBody
	public String EmailUpdate(String email,HttpSession session,HttpServletRequest request) {
		// session
		String id = (String) session.getAttribute("login");
		
		// 변경할 이메일을 가지고 update
		int re = dao.updateEmail(email,id);
		// 만약 성공적으로 변경이 완료되었다면 뷰페이지에 변경된 이메일 값으로 변경 
		if(re == 1) {
			System.out.println(re);
			return email;
		}
		return "";
	}//EmailUpdate
	
	// 이메일 인증번호 난수
	@GetMapping("/sendPhoneCode")
	@ResponseBody
	public String sendPhoneCode(String phone) {
		// 랜덤객체 생성
		Random random = new Random();
		// 인증을 위한 랜덤 값 추출
		int chkCode = random.nextInt(888888) + 111111;
		String code = String.valueOf(chkCode);
		// 클라이언트에게 전송할 문자 내용
		String content = "[밥도둑]을 항상 이용해주셔서 항상 감사합니다\n\n"
				+ "인증 번호는[" + code + "]입니다." ;
		// 핸드폰 문자를 보내기 위한 객체
		BanchanSms sms = new BanchanSms();
		// 발신자 / 인증을 요청한 번호 / 문자 내용
		sms.sendMsg("01086469577", phone, content);
		
		return code;
	}//sendPhoneCode
	
	 // 인증번호가 일치 할 시 핸드폰 번호를 변경
	@GetMapping("/updatePhone")
	@ResponseBody
	public String phoneUpdate(String phone,HttpSession session,HttpServletRequest request) {
		// 세선
		String id = (String) session.getAttribute("login");
		// 변경할 핸드폰 번호 dao로 전달
		int re = dao.updatePhone(phone,id);
		// 핸드폰 번호가 성공적으로 변경이 완료 됐으면
		if(re == 1) {
			//변경된 핸	드폰 번호를 뷰단에 변경
			return phone;
		}
		return "";
	}//phoneUpdate
	
	 // 배송지 관리 뷰 페이지로 이동
	@GetMapping("/updateShipping")
	public String updateShippingForm(Model model,HttpSession session,HttpServletRequest request) {
		// 세션
		String id = (String) session.getAttribute("login");
		
		// ShippingVo에 회원에 대한 우편번호/주소/상세주소를 담는다.
		ShippingVo spVo = dao.getShipping(id);
		// 상태유지 후 페이지에 현재주소 value에 값을 뿌려준다.
		model.addAttribute("spVo",spVo);
		
		return "/mypage/updateShipping";
	}//updateShipping
	
	// 주소 변경 Process
	@PostMapping("/updateShipping")
	public String updateShippingSubmit(Model model,ShippingVo spVo,String mem_id,HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
		// 세션
		String id = (String) session.getAttribute("login");
		// 변경할 우편번호/주소/상세주소를 담겨져 있는 spVo객체를 dao로 전달
		int re = dao.updateShipping(spVo,id);
		// 성공적으로 주소가 변경이 되었다면
		if(re == 1) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('주소 변경이 성공적으로 변경이 완료되었습니다.'); location.href='/mypage/updateShipping'; </script>");
			out.close();
		}
		return "";
	}//updateShippingSubmit
	
	// 회원 탈퇴 화면 뷰
	@GetMapping("/deleteAccount")
	public String deleteAccountForm(Model model,HttpServletResponse response,HttpSession session,HttpServletRequest request) {
		// 세션
		String id = (String) session.getAttribute("login");

		// 고객 아이디를 얻어온다.
		MypageVo mVo = dao.getMemberid(id);
		// 상태 유지 후 고객 아이디 회원 탈퇴 뷰에 뿌려준다.
		model.addAttribute("mVo",mVo);

		return "/mypage/deleteAccount";
	}// deleteAccountForm
	
	// 회원탈퇴 Process
	@PostMapping("/deleteAccount")
	public String deleteAccountSubmit(Model model,HttpServletResponse response,HttpSession session,HttpServletRequest request) throws IOException {
			// 세션
			String id = (String) session.getAttribute("login");
			System.out.println("aaaaaaaaaaaaaaaaaaa");
			// 아이디에 대한 정보를 찾아서 회원 탈퇴
			int re = dao.deleteId(id);
			// 성공적으로 주소가 변경이 되었다면
			if(re == 1) {
				session.invalidate();
				return "/mypage/deleteOk";
			}
			return "/mypage/deleteOk";
	}//deleteAccountSubmit
	
	// 비밀번호 변경 뷰 페이지로 이동
	@GetMapping("/resetPassword")
	public String resetPassword(Model model,HttpSession session) {
		return "/mypage/resetPassword";
	}//resetPassword
	
	 // 새로운 비밀번호 와 비밀번호 확인이 일치 시 비밀번호 변경
	@PostMapping("/resetPassword")
	public String resetSub(Model model,HttpSession session,String currPassword,String newChkPassword,HttpServletResponse response) throws IOException {
		// 세션
		String mem_id = (String) session.getAttribute("login");
		
		int re = dao.getPwd(currPassword, mem_id);
		
		if(re == 1) {
			//새로운 비밀번호로 변경
			model.addAttribute(dao.updatePwd(newChkPassword,mem_id));
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			// alert 안내 후 비밀번호 변경(현재)페이지 이동
			out.println("<script>alert('현재 비밀번호가 일치하지 않습니다.'); location.href='/mypage/resetPassword'; </script>");
			out.close();
			return null;
		}

		return "mypage.do";
	}//resetSub

	@GetMapping("orderList")
	public String orderList(Model model,HttpSession session) {
		
		String order_mem_id = (String) session.getAttribute("login");

		List<OrderListVo> odList = dao.findOrderList(order_mem_id);
		
		model.addAttribute("odList",odList);
		
		return "/mypage/orderList";
	}
	
	@GetMapping("orderListDetail")
	public String orderListDetail(Model model,HttpSession session) {
		String order_mem_id = (String) session.getAttribute("login");

		List<OrderListVo> odList = dao.findOrderList(order_mem_id);
		
		model.addAttribute("odList",odList);
		
		return "/mypage/orderListDetail";
	}
}//class
