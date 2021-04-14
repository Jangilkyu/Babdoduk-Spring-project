package com.mall.util;

import java.io.File;

import org.springframework.stereotype.Component;

@Component
public class FileNameUtil {
	
	public String FileRename(String path, String fname) {
		
		//같은 이름이 존재하는지 찾을 flag
		boolean flag = false;
		
		//이미지가 저장되어 있는 경로
		File file = new File(path);
		//그 경로 안에 있는 파일 리스트
		String[] fileList = file.list();
		
		//파일 리스트를 반복문돌리면서 같은 것이 존재하는지 찾는다.
		for(String fileName : fileList) {
			if(fileName.equals(fname)) {
				//만약 같은 id가 나올경우 true값으로 변경 후 break
				flag = true;
				break;
			}//end if
		}//end for
		
		//만약 같은 것이 존재한다면?
		if(flag) {
			//파일명
			String name = fname.substring(0,fname.indexOf("."));
			//확장자
			String ext = fname.substring(fname.indexOf("."));
			//새로운 파일명
			fname = name+System.currentTimeMillis()+ext;
		}//end if
		
		return fname;
	}//FileRename

}
