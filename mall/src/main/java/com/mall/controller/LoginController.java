package com.mall.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mall.dao.user.UserDAO;
import com.mall.interceptor.LoginSessionListener;
import com.mall.smswebservice.BanchanSms;
import com.mall.vo.mypage.IdInquiryVo;
import com.mall.vo.mypage.PwdInquiryVo;
import com.mall.vo.mypage.PwdPhoneAuthVo;

import lombok.RequiredArgsConstructor;

@Controller //현재 class가 Controller 역할
@RequiredArgsConstructor //DI를 받기 위한 Annotation
@RequestMapping("login") // 폴더에 있기 때문에 매핑 시 login/ 생략
public class LoginController {
	
	private final UserDAO dao;  // 회원 정보를 받기 위한 DI
	private final JavaMailSender javaMailSender; // 문자를 보내기 위한 DI
	
	// login view 페이지 이동
	@GetMapping("userLogin")
	public String loginForm() {
		return "login/userLogin";
	}//loginForm
	
	// 로그인 버튼 클릭시 post 요청에 의한 Process
	@PostMapping("userLogin")
	public String loginSubmit(Model model,HttpSession session,HttpServletRequest request,HttpServletResponse response,String mem_id, String mem_pwd) throws IOException {
		//아이디 또는 비밀번호가 null이거나 공백인 경우
		if("".equals(mem_id) || mem_id == null || "".equals(mem_pwd)) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디 또는 패스워드를 입력하여 주십시오.'); location.href='/login/userLogin';</script>");
            out.close();
            return null;
		}//end if

		// 만약 아이디 조회 시 일치하는 아이디가 없으면
		if(dao.validId(mem_id)== 0) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('아이디가 일치하지 않습니다.'); location.href='/login/userLogin';</script>");
            return null;
		}//end if
		
		// 만약 비밀번호 조회 시 일치하는 비밀번호가 없으면
		if(dao.validPwd(mem_id,mem_pwd)== 0) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='/login/userLogin';</script>");
            return null;
		}//end if
		
		// 만약 세션값이 존재 한다면 
		if(session.getAttribute("login") != null) { 
		// 기존 세션 값을제거해준다. 
		session.removeAttribute("login"); 
		}//end if
		  
		//만약 id가 비어있지않으면 
		if(mem_id != null) {
			session.setAttribute("login", mem_id);
		}
		// 메인페이지로 리다이렉트
		return "redirect:/";
	}//loginSubmit
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session){
		// 세션을 가져온다.
		String mem_id = (String) session.getAttribute("login");
		// 만약 mem_id가 null이 아니라면 즉, 세션이 존재하면
		if(mem_id != null) {
			// 세션 만료
			session.invalidate();
		}//logout
		// 메인페이지로 리다이렉트
		return "redirect:/";
	}//logout
	
	// 아이디 찾기 뷰페이지
	@GetMapping("/idInquiry")
	public String idInquiry(Model model) {
		return "/login/idInquiry";
	}//idInquiry
	
	// 아이디 찾기 [회원 정보에 등록한 [휴대전화]로 인증]
	@PostMapping("/phoneAuth")
	@ResponseBody
	public IdInquiryVo phoneAuth(Model model, @RequestBody HashMap<String, Object> map) {
		// ajax을 통해 JSON.stringify로 [아이디]와[휴대전화]을 받은 후 DB에 일치하는 회원이 있을 시 1 없을 시 0을 반환
		int cnt = dao.phoneAuth(map);
		// 다음페이지 상태 유지를 위해 [아이디 찾기] 상태유지를 위해 회원 아이디를 받는다.
		String mem_id = dao.phoneAuthGetId(map);
		// 아이디찾기문의Vo를 생성한다.
		IdInquiryVo iiVo = new IdInquiryVo();
		// map에서 회원에게 인증 메일을 보내기위해 [핸드폰 번호]를 받아온다.
		String mem_phone = (String)map.get("mem_phone");
		// 랜덤객체 생성
		Random random = new Random();
		// 인증을 위한 랜덤 값 추출
		int chkCode = random.nextInt(888888) + 111111;
		// 인증 코드를 문자열로 바꾼다.
		String code = String.valueOf(chkCode);
		// 클라이언트에게 전송할 문자 내용
		String content = "[밥도둑]을 항상 이용해주셔서 항상 감사합니다\n\n"
				+ "인증 번호는[" + code + "]입니다." ;
		// 핸드폰 문자를 보내기 위한 객체
		BanchanSms sms = new BanchanSms();
		// 발신자 / 인증을 요청한 번호 / 문자 내용
		sms.sendMsg("01086469577", mem_phone, content);
		// 객체에 [아이디],[회원존재여부 cnt],[인증번호]를 담는다.
		iiVo.setMem_id(mem_id);
		iiVo.setResult(cnt);
		iiVo.setCode(code);
		// 객체를 ajax .done으로 전달
		return iiVo;
	}//phoneAuth
	
	// [아이디 찾기]
	// [휴대전화 인증] 및 [이메일 인증]이 성공했다면 보이는 페이지
	@PostMapping("/viewIdList")
	public String viewIdList(Model model,String mem_id) {
		// 회원 아이디를 상태유지 후 
		model.addAttribute("mem_id", mem_id);
		// viewIdList로 전달
		return "/login/viewIdList";
	}//viewIdList

	// 이메일 인증
	@PostMapping("/emailAuth")
	@ResponseBody
	public IdInquiryVo emailAuth(Model model, @RequestBody HashMap<String, Object> map) {
		// ajax을 통해 JSON.stringify로 [아이디]와[휴대전화]을 받은 후 DB에 일치하는 회원이 있을 시 1 없을 시 0을 반환
		int cnt = dao.emailAuth(map);
		// 이름과 이메일주소로 회원 아이디를 가져옴
		String mem_id = dao.EmailAuthGetId(map);
		// 아이디찾기문의Vo를 생성한다.
		IdInquiryVo iiVo = new IdInquiryVo();
		// map에서 회원에게 인증 메일을 보내기위해 [이메일 주소]를 받아온다.
		String email = (String) map.get("mem_email");
		// 랜덤함수 객체
		Random random = new Random();
		// 인증을 위한 랜덤 값 추출
		int chkCode = random.nextInt(888888) + 111111;
		String code = String.valueOf(chkCode);
		// 인증 코드 메일 제목
		String subject = "[더 반찬] 본인 확인 인증 메시지입니다.";
		// 인증 코드 메일 내용
		String content = "더 반찬을 항상 이용해주셔서 항상 감사합니다\n\n"
						+ "인증 번호는[" + code + "]입니다.\n" 
						+ "해당 인증번호를 인증번호 확인란에 기입해주시면 감사하겠습니다.\n"
						+ "오늘도 즐거운 쇼핑되세요.";
		// 인증 코드 메일 보내기
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		mailMessage.setSubject(subject); // 제목
		mailMessage.setFrom("jewelrye6"); // 보내는 계정
		mailMessage.setText(content); // 내용
		mailMessage.setTo(email); // 보낼 메일 계정
		// 메일 전송
		javaMailSender.send(mailMessage);
		// 객체에 [아이디],[회원존재여부 cnt],[인증번호]를 담는다.
		iiVo.setMem_id(mem_id);
		iiVo.setResult(cnt);
		iiVo.setCode(code);
		// 객체를 ajax .done으로 전달
		return iiVo;
	}//emailAuth
	
	// [비밀번호 찾기] view 페이지
	@GetMapping("/pwdInquiry")
	public String pwdInquiry() {
		return "login/pwdInquiry";
	}//pwdInquiry
	
	// [비밀번호 찾기] Process
	@PostMapping("/pwdInquiry")
	public String pwdInquiryPro(Model model,String mem_id,HttpServletResponse response) throws IOException {
		PwdInquiryVo pwdInquiry = dao.findPwdUserId(mem_id);
		// 만약 
		if(pwdInquiry == null) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('입력칸이 공백이거나 아이디가 존재하지않습니다.'); location.href='/login/pwdInquiry';</script>");
            out.close();
            return null;				
		}
		
		if(mem_id.equals(pwdInquiry.getMem_id())) {
			System.out.println(mem_id);
			model.addAttribute("pVo",pwdInquiry);
			return "login/viewPwdAuth";
		}
		
		return "login";
	}
	
	// 비밀번호 찾기 ajax으로 회원정보에 등록한 휴대전화번호로 인증
	@PostMapping("/pwdPhoneAuth")
	@ResponseBody
	public PwdPhoneAuthVo pwdPhoneAuth(Model model,@RequestBody HashMap<String, Object> map) {
		
		String mem_name = (String)map.get("mem_name");
		String mem_phone = (String)map.get("mem_phone");

		int re = dao.pwdPhoneAuth(mem_name,mem_phone);
		String mem_id = dao.getMemId(mem_name,mem_phone);
		String code = "";
		
		PwdPhoneAuthVo pVo = new PwdPhoneAuthVo();
		
		if(re == 1) {
			// 랜덤객체 생성
			Random random = new Random();
			// 인증을 위한 랜덤 값 추출
			int chkCode = random.nextInt(888888) + 111111;
			code = String.valueOf(chkCode);
			// 클라이언트에게 전송할 문자 내용
			String content = "[밥도둑]을 항상 이용해주셔서 항상 감사합니다\n\n"
					+ "인증 번호는[" + code + "]입니다." ;
			// 핸드폰 문자를 보내기 위한 객체
			BanchanSms sms = new BanchanSms();
			// 발신자 / 인증을 요청한 번호 / 문자 내용
			sms.sendMsg("01086469577", mem_phone, content);

			pVo.setCode(code);
			pVo.setResult(re);
			pVo.setMem_id(mem_id);
		}else {
			pVo.setResult(0);
		}//end if
		
		return pVo;
	}//pwdPhoneAuth
	
	@PostMapping("/viewInputPasswd")
	public String viewInputPasswd(Model model, String mem_id) {
		model.addAttribute("mem_id",mem_id);
		
		return "/login/viewInputPasswd";
	}
	
	@PostMapping("/viewInputProPwd")
	public String viewInputProPwd(Model model,String mem_id,String currPwd,HttpServletResponse response) throws IOException {

		int re = dao.updateInqPwd(mem_id,currPwd);
		
		System.out.println(re);
		
		if(re == 1) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('성공적으로 비밀번호가 변경되었습니다.'); location.href='/';</script>");
            out.close();
            return null;			
		}else {
			return "";
		}
	}
}