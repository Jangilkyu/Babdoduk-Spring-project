package com.mall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mall.dao.inquiry.InquiryDao;
import com.mall.util.FileNameUtil;
import com.mall.vo.answer.answerVo;
import com.mall.vo.inquiry.InquiryEmailPhoneVo;
import com.mall.vo.inquiry.InquiryVo;
import com.mall.vo.mypage.MyInqDetRespVo;
import com.mall.vo.mypage.MyInqDetailVo;
import com.mall.vo.mypage.MyInqListVo;
import com.mall.vo.user.UserVO;

import lombok.RequiredArgsConstructor;

@Controller //현재 class가 Controller 역할
@RequiredArgsConstructor //DI를 받기 위한 Annotation
@RequestMapping("inquiry") // 폴더에 있기 때문에 매핑 시 inuiry/ 생략
public class InquiryController {

	private final InquiryDao dao; // 1:1문의를 위한 DI
	private final FileNameUtil FileNameUtil; // 파일 이름 중복검사를 위한 DI
	private final JavaMailSender javaMailSender; // 문자메시지를 보내기 위한 DI
	
	//페이징 처리 관련 변수
	public static int pageSIZE = 10; // 한 화면에 보여지는 레코드 수
	public static int totalRecord = 0; //전체 레코드 수
	public static int totalPage = 1;// 전체 페이지 수
	
	// 1:1문의 view페이지
	@GetMapping("/inquiry")
	public String inquiryForm(Model model,HttpSession session, HttpServletRequest request,HttpServletResponse response) throws IOException {
		// 세션
		String mem_id = (String) session.getAttribute("login");
		// view화면에 보여줄 고객 정보 [고객명,아이디]를 담는다.
		UserVO uv = dao.getMemberInfo(mem_id);
		// 상태 유지 후 inquiry로 페이지 이동
		session.setAttribute("login", mem_id);
		// uv객체 [고객명,아이디]를 상태유지 후 inquiry페이지로 이동
		model.addAttribute("uv",uv);
		return "inquiry/inquiry";
	}//inquiryForm
	
	// 고객이 1:1문의를 등록하는 페이지
	@PostMapping("/inquiry")
	public String inquirySubmit( Model model,InquiryVo ivo,String cs_email, String cs_phone,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws IOException {
		System.out.println("1:1 문의 post 방식 동작함. ==>" + ivo);
		
		// 세션
		String mem_id = (String) session.getAttribute("login");
		// 이미지를 저장할 경로
		String path = request.getSession().getServletContext().getRealPath("inquiry");
		// 사용자가 업로드한 파일을 얻어온다.
		MultipartFile uploadFile = ivo.getUploadFile();
		// 사용자가 파일을 업로드 하지 않을 시 ivo에 값을 미리 설정해준다.
		ivo.setCs_fname("notExist");
		//사용자가 업로드한 파일의 파일명을 얻어온다.
		String fname = uploadFile.getOriginalFilename();
		// 만약 사용자가 올린 파일이 존재한다면
		if(fname != null && !"".equals(fname)){
			System.out.println("파일이 있어요!");
			// 파일 복사 
			try {
				// 사용자가 올린 파일에 data를 가져온다.
				byte []data = uploadFile.getBytes();
				// 파일 이름이 중복이 되면 FileNameUtil을 통해서 뒤에 시간을 붙여준다.
				fname = FileNameUtil.FileRename(path, fname);
				// 스트림을 연결한다.
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				// 저장한 경로로 파일을 저장한다.
				fos.write(data);
				// 스트림 끊기
				fos.close();
				// 저장 된 파일명을 setCs_fname에 담는다.
				ivo.setCs_fname(fname);
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch			
			
		}//end if
		
		// 디비에 저장한다.
		int re = dao.insertInquiry(ivo,cs_email,cs_phone,mem_id);
		// 만약 정상적으로 저장이 완료 되었다면 alert 후 메인페이지로 이동한다.
		if(re == 1) {
			System.out.println("ok");
			return "/inquiry/inquiryOk";			
		}//end if
		else {
			System.out.println("no");
			return "/inquiry/error";
		}
		
	}//inquirySubmit
	
	// 고객이 작성한 1:1문의를 확인하는 페이지
	@GetMapping("/myInquiry")
	public String getmyInquiry(@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM ,@RequestParam(value = "keyword", defaultValue= "") String keyword,String searchFeild,Model model,HttpSession session,HttpServletRequest request) {
		// 세션
		String mem_id = (String) session.getAttribute("login");
		// [검색]과[선택] 조건에 따른 총 레코드 수
 		totalRecord = dao.totBoard(mem_id,keyword,searchFeild);
		// 총 페이지 수
		totalPage = (int) Math.ceil(totalRecord / (double) pageSIZE);
		// 한 페이지에 보여 줄 페이지 갯수
		int start = (pageNUM-1) * pageSIZE+1;
		int end = start + pageSIZE-1;
		// List에 1:1문의게시판에 보여 줄 목록을 담는다.
		List<MyInqListVo> list = dao.findMyInq(mem_id,start,end,keyword,searchFeild);
		// 총 페이지 수를 상태유지 한다.
		model.addAttribute("totalPage",totalPage);
		// List<MyInqListVo>를 상태유지한다.
		model.addAttribute("list",list);
		// 페이지 변경 시 쿼리문 상태 유지
		model.addAttribute("keyword",keyword);
		model.addAttribute("searchFeild",searchFeild);
		return "inquiry/myInquiry";
	}//getmyInquiry
	
	// 관리자 페이지에서 클라이언트가 문의 남긴 문의 리스트 페이지
	@GetMapping("/inquiryList")
	public String inquiryList(Model model, @RequestParam(value="pageNUM",defaultValue = "1") int pageNUM,@RequestParam(value="keyword",defaultValue = "")  String keyword,@RequestParam(value="searchFeild",defaultValue = "cs_title")  String searchFeild) {
	//	System.out.println(pageNUM);
	//	System.out.println(keyword);
	//	System.out.println(searchFeild);
	// 쿼리문과 <select>태그 선택 후 검색 시 총 게시글 수
	int cntTbCs = dao.cntTbCs(keyword,searchFeild);
	// 페이지 번호 변경 시 쿼리문 상태 유지
	model.addAttribute("keyword",keyword);
	model.addAttribute("searchFeild",searchFeild);
	// 총 게시글 수
	totalRecord = cntTbCs;
	// 페이지 수 구하기
	totalPage = (int)Math.ceil(totalRecord / (double)pageSIZE);
	// 한화면에 보여질 글 갯수
	int start = (pageNUM-1)*pageSIZE+1;
	int end = start+pageSIZE-1;
	// 한페이지에 보여질 글 갯수 정보를 담고있는 start와 end 및 검색어와 선택조건을 인자로 조회 후 List에 담는다.
	List<InquiryVo> list= null;
	list = dao.findAllInquiry(start,end,keyword,searchFeild);
	// 만약 리스트가 null이면
	if(list == null) {
		// 비어있는 list를 상태유지 후 전달한다.
		model.addAttribute("list",list);
		// view쪽에서는 현재 작성된 글이 없다는 jstl 조건문 표시
		return "/inquiry/inquiryList";
	}//end if
	// 페이지 수 상태유지
	model.addAttribute("totalPage",totalPage);
	// 고객들의 문의 리스트 상태유지
	model.addAttribute("list",list);

		return "inquiry/inquiryList";
	}//inquiryList
	
	//관리자 페이지에 사용자가 문의한 내용 디테일 페이지
	@GetMapping("/inquiryDetail.do")
	public String inquiryDetail(Model model,int cs_no) {
		// 디테일 페이지로 이동하기 위해 고객이 문의 한 정보를 cs_no(문의번호)를 통해 가져 온다.
		InquiryVo userIqVo = dao.selectInquiry(cs_no);
		// 고객이 문의 한 정보를 상태 유지 후 view로 이동
		model.addAttribute("userIqVo",userIqVo);

		return "inquiryDetail";
	}//inquiryDetail
	
	// 고객에게 [답변 완료] 메일로 전송하는 메소드
	@PostMapping("/sendQnA.do")
	@ResponseBody
	public int sendQnA(Model model,answerVo answerVo, int cs_no,String cs_mem_id) {
		// 고객에 이메일을 얻어온다. 
		InquiryEmailPhoneVo iep = dao.getMemberEmail(cs_no);
		// 답변 내용을 담는다. 
		int re = dao.insertAnswer(answerVo,cs_no,cs_mem_id);
		// 답변 여부 변수
		int respChk = 0;
		//만약 정상적으로 답변이 작성이 되었다면
		if(re == 1) {
			// 미답변 -> 답변으로 바꾼다.
			// 0 -> 1
			respChk = dao.ansOK(cs_no);
		}//end if
		
		// 고객에게 [답변 완료] 안내멘트 제목/내용
		String subject = "[밥도둑] 문의번호 ["+ cs_no  +"] 1:1 문의 답변입니다.";
		String content = "안녕하세요." + cs_mem_id +"님\n" + "고객님 께서 문의해주신 소중한 문의 내용 답변이 완료 되었습니다.\n [마이페이지] -> [내가 문의한 목록]에서 확인이 가능하십니다.\n 항상 이용해주셔서 감사합니다.[밥도둑]";
		// 메일 보내기
		SimpleMailMessage mailMessage = new SimpleMailMessage();

		mailMessage.setSubject(subject); // 제목
		mailMessage.setFrom("jewelrye6"); // 보내는 이메일
		mailMessage.setText(content); // 내용
		mailMessage.setTo(iep.getCs_email()); // 받는 이메일
		javaMailSender.send(mailMessage); // 메일 전송
		
		return respChk;
	}//sendQnA
		
	// 마이페이지 고객 문의 내용 DetailPage
	@GetMapping("myInqDetail/{cs_no}")
	public String myInqDetail(@PathVariable int cs_no,Model model) {
		// 마이페이지 고객 문의 내용을 [문의 번호]를 통하여 가져온다.
		MyInqDetailVo detailVo = dao.findDetailInq(cs_no);
		// 관리자가 답변한 내용 담는 Vo
		MyInqDetRespVo midrVo = dao.findInqResp(cs_no);
		// 상태 유지
		model.addAttribute("detailVo",detailVo);
		model.addAttribute("midrVo",midrVo);
		
		return "/inquiry/myInqDetail";
	}//myInqDetail
}
