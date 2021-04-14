package com.mall.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorPageController implements ErrorController{

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, Model model) {
		
		//에러 코드 획득
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		//에러 코드 상태 정보
		HttpStatus httpStatus = HttpStatus.valueOf(Integer.valueOf(status.toString()));
		
		if(status != null) {
			int statusCode = Integer.valueOf(status.toString());
			if(statusCode == HttpStatus.NOT_FOUND.value()) {
				return "/error/404";
			}
		}
		return "";
	}
	
	@Override
	public String getErrorPath() {
		return "/error";
	}

}
