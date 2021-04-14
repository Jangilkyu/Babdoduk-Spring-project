package com.mall.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		//세션의 admin 값이 "true"인지 확인하고, 아닐 경우 관리자 로그인 페이지로 이동시킴
		if(request.getSession().getAttribute("admin") != null && request.getSession().getAttribute("admin").equals("true")){
			return true;
		}else {
			response.sendRedirect("/admin");
			return false;
		}
	}

}
