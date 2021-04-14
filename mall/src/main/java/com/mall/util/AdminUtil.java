package com.mall.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AdminUtil {
	
	//해당 경로의 이미지 파일을 삭제하는 함수
	public void deleteImg(String path) {
		File file = new File(path);
		if(file.exists()) {
			file.delete();
		}
	}
	
	
	/**
	 * @param no 상품 번호
	 * @param imgFile 이미지 파일 객체
	 * @param tale 이미지 파일에 붙일 꼬리표 (메인이미지는 없음, 상세이미지는 _detail1,2)
	 * @return 새로운 파일 이름
	 */
	public String renameImg(int no, MultipartFile imgFile, String tail) {
		String newName = "";
		
		// 새로운 파일 이름 : product[상품번호][꼬리표].확장자
		newName = "product" + String.valueOf(no) + tail + 
				imgFile.getOriginalFilename().substring(imgFile.getOriginalFilename().indexOf("."));
		
		return newName;
	}
	
	/**
	 * @param no 세트 번호
	 * @param imgFile 이미지 파일 객체
	 * @return 새로운 파일 이름
	 */
	public String renameSetImg(int no, MultipartFile imgFile) {
		String newName = "";
		
		// 새로운 파일 이름 : set[상품번호].확장자
		newName = "set" + String.valueOf(no) + imgFile.getOriginalFilename().substring(imgFile.getOriginalFilename().indexOf("."));
		
		return newName;
	}
	
	/**
	 * @param no 이미지 번호
	 * @param imgFile 이미지 파일 객체
	 * @return 새로운 파일 이름
	 */
	public String renameEventImg(int no, MultipartFile imgFile) {
		String newName = "";
		
		// 새로운 파일 이름 : event[상품번호].확장자
		newName = "event" + String.valueOf(no) + imgFile.getOriginalFilename().substring(imgFile.getOriginalFilename().indexOf("."));
		
		return newName;
	}
	
	/**
	 * @param path 이미지를 저장할 서버 경로
	 * @param imgFile 서버에 업로드할 이미지
	 * @param fileName 서버에 업로드할 이미지 이름
	 * @throws IOException 
	 */
	public void uploadImg(String path, MultipartFile imgFile, String fileName) throws IOException {
		byte []data = imgFile.getBytes();
		FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
		fos.write(data);
		fos.flush();
		fos.close();
	}
	
	
	/**
	 * @param pwd 사용자에게 입력받은 패스워드 
	 * @param pwdFilePath 관리자 패스워드가 저장되어있는 경로
	 * @return 일치하는지 확인하여 boolean 형태로 반환
	 */
	public boolean checkPassword(String pwd, String pwdFilePath) {
		boolean check = false;
		String realPwd = "";
		
		try {
			FileInputStream fileStream = new FileInputStream(pwdFilePath);
			byte[ ] readBuffer = new byte[fileStream.available()];			
			while (fileStream.read(readBuffer) != -1){}
			realPwd = new String(readBuffer); 
			fileStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(pwd.equals(realPwd)){
			check = true;
		}
		
		return check;
	}
}
