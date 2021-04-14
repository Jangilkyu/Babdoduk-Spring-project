package com.mall.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mall.dao.product.ProductDao;
import com.mall.dao.review.ReviewDao;
import com.mall.util.FileNameUtil;
import com.mall.util.PaginNation;
import com.mall.vo.review.LoadListRequestVO;
import com.mall.vo.review.LoadListResponseVO;
import com.mall.vo.review.ReviewVO;
import com.mall.vo.review.UpdateReviewRequestVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor //DI를 받기 위한 Annotation
@Controller //현재 class가 Controller 역할
public class ReviewController {
	
	private final ProductDao productDao; //상품 검색을 위한 DI
	private final ReviewDao reviewDao; //리뷰를 DB처리 하기 위한 DI
	private final FileNameUtil fileNameUtil; //파일 중복검사를 위한 DI
	
	//처음 리뷰 페이지로 이동하였을 경우 리스트를 보여주기
	@GetMapping("/reviewList")
	public String reviewList() {
		return "reviewList";
	}//reviewList
	
	
	//상품번호를 받아와서 model로 넘겨준다. 글작성부분에서는 상품제목을 받아서 review를 작성
	@GetMapping("/reviewWrite")
	public String reviewWriteForm(@RequestParam(value = "product_no", defaultValue = "6705") int product_no,Model model) {
		//상품의 번호를 받아 제목을 검색하여 title를 넘겨준다.
		model.addAttribute("product",productDao.selectOne(product_no));
		//글쓰기 페이지로 이동
		return "reviewWrite";
	}//reviewWrite
	
	//리뷰 작성
	@PostMapping("/reviewWrite")
	public String reviewWrite(ReviewVO reviewVO,HttpSession httpSession,HttpServletRequest request) {
		//현재 로그인 되어있는 사용자 아이디를 얻어온다.(현재는 연결되지 않은 상태이기에 하드코딩)
		reviewVO.setMem_id("leewooo");
		//경로 얻어오고
		String path = request.getServletContext().getRealPath("/img");
		//사용자가 업로드한 파일 얻어오고
		MultipartFile uploadFile = reviewVO.getUploadFile();
		//사용자가 업로드한 파일의 파일명을 얻어온다. (중복검사)
		String fname = fileNameUtil.FileRename(path, uploadFile.getOriginalFilename());
		//사용자가 파일 업로드를 안할 수도 있으니 vo에 먼저 값 설정
		reviewVO.setReview_fname("notExist");
		
		//만약 사용자가 올린 파일이 존재한다면?
		if(!"".equals(fname.trim()) && fname != null) {
			try{
				//사용자가 올린 파일의 Data를 가져오고
				byte[] data = uploadFile.getBytes();
				//스트림을 연결한다.
				FileOutputStream fileOutputStream = new FileOutputStream(new File(path+"/"+fname));
				//지정한 경로로 파일을 저장하고
				fileOutputStream.write(data);
				//스트림 끊기
				fileOutputStream.close();
				//저장 된 파일명 vo에 담기
				reviewVO.setReview_fname(fname);
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
		}//end if
		
		//DB저장
		int result = reviewDao.save(reviewVO);
		
		if(result == 1) {
			//이 후 리뷰 페이지로 리다이렉트
			return "redirect:reviewList";
		}//end if
		
		//만약 DB결과값이 1이아니라면 올라간 파일 삭제
		new File(path + "/" + fname).delete();
		return "error";
		
	}//reviewWrite

	
	//리뷰 불러오기
	@PostMapping("/loadList")
	@ResponseBody
	public LoadListResponseVO loadList(@RequestBody LoadListRequestVO loadListRequestVO,HttpSession httpSession){
		
//		System.out.println("키워드 : " + loadListRequestVO.getKeyword());
//		System.out.println("페이지 번호 :" +loadListRequestVO.getPageNumber());
		
		//ajax통신을 통해 VO를 받아온다.
		//이 것을 통해 DAO를 검색하여 결과를 받아와야한다. 하지만 그전에 페이징 처리를 해야한다.
		//먼저 현재 리뷰게시글의 총 갯수를 가져온다.
		int totalRecord = reviewDao.findTotalRecord(loadListRequestVO.getKeyword());
//		System.out.println("총 게시글 수 : " + totalRecord);
		
		//총 레코드를 받아왔으니 페이징처리를 위한 객체 생성
		PaginNation paginNation = new PaginNation(totalRecord, loadListRequestVO.getPageNumber());
		
//		System.out.println("시작 :" +paginNation.getStart());
//		System.out.println("끝 :" +paginNation.getEnd());
		
		//검색조건 및 keyword를 받왔으니 DB를 검색해 List를 불러온다. Map을 이용하여 Data를 담고 넘겨준다.
		Map<String, Object> loadListMap = new HashMap<>();
		loadListMap.put("keyword", loadListRequestVO.getKeyword());
		loadListMap.put("start", paginNation.getStart());
		loadListMap.put("end", paginNation.getEnd());
		
		//반환값으로 리뷰 리스트와 총 페이지 수를 넘겨준다.
		return new LoadListResponseVO(reviewDao.findAllPaging(loadListMap),paginNation.getTotalpage());
	}
	
	//리뷰디테일로 이동
	@GetMapping("/reviewDetail/{review_no}")
	public String reviewDetail(@PathVariable int review_no,Model model) {
		//조회수 증가
		reviewDao.updateHit(review_no);
		
		//리뷰 번호를 받아서 해당되는 review를 가져온다.
		ReviewVO reviewVO = reviewDao.findByNo(review_no);
		model.addAttribute("review", reviewVO);
		return "detailReview";
	}
	
	//리뷰 업데이트 폼으로
	@GetMapping("/updateReview/{review_no}")
	public String updateForm(@PathVariable int review_no,Model model) {
		ReviewVO reviewVO = reviewDao.findByNo(review_no);
		model.addAttribute("review", reviewVO);
		return "updateReview";
	}
	
	//리뷰 업데이트 진행
	@PostMapping("/updateReview")
	public String updateAction(UpdateReviewRequestVO updateReviewRequestVO,HttpServletRequest request) {
		
		//이미지 파일 경로를 얻는다.
		String path = request.getServletContext().getRealPath("/img");
		//이전 파일명을 얻는다.
		String oldFname = updateReviewRequestVO.getReview_fname();
		//사용자가 올린 파일을 얻어온다.
		MultipartFile uploadFile = updateReviewRequestVO.getUploadFile();
		//사용자가 올린 파일 명을 가져온다.
		String fname = uploadFile.getOriginalFilename();
		
		//만약 사용자가 파일을 수정했다면?
		if(!"".equals(fname.trim()) && fname != null ) {
			try {
				//파일의 데이터를 가져온다.
				byte[] data = uploadFile.getBytes();
				
				//파일명 중복검사를 한다.
				fname = fileNameUtil.FileRename(path, fname);
				
				//스트림을 연결하여 파일을 저장한다.
				FileOutputStream fileOutputStream = new FileOutputStream(new File(path + "/" + fname));
				fileOutputStream.write(data);
				fileOutputStream.close();
				
				//vo에 fname을 저장해준다.
				updateReviewRequestVO.setReview_fname(fname);
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
		}//end if
		
		//이 후 update 요청
		int result = reviewDao.update(updateReviewRequestVO);
		System.out.println("업데이트결과" + result);
		
		//만약 update가 제대로 진행되지 않았을 경우 올라간 파일 삭제 후 error로 이동
		if(result != 1) {
			//올라간 파일 삭제
			new File(path + "/" + fname).delete();
			return "error";
		}//end if
		
		//정상적으로 처리되고 사용자가 파일 수정까지 했다면?
		if(!"".equals(fname.trim()) && fname != null ) {
			//이전 파일 삭제
			new File(path + "/" + oldFname).delete();
		}//end if
		
		//처리가 끝나면 다시 리스트로 이동
		return "redirect:/reviewList";
	}
	
	//리뷰 삭제
	@GetMapping("/deleteReview/{review_no}")
	public String deleteReview(@PathVariable int review_no,HttpServletRequest request) {
		//게시글에 해당하는 파일명 얻어오기
		String fname = reviewDao.findByNo(review_no).getReview_fname();
		//게시글 삭제
		int result = reviewDao.deleteByNo(review_no);
		if(result == 1) {
			//파일 삭제
			new File(request.getServletContext().getRealPath("/img") + "/" + fname).delete();
			return "redirect:/reviewList";
		}//end if
		return "error";
	}//deleteReview
}
