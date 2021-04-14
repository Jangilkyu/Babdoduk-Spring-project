package com.mall.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mall.interceptor.AdminInterceptor;

@Configuration
public class AdminMvcConfig implements WebMvcConfigurer{

	@Autowired
	private AdminInterceptor interceptor;
	
	//관리자 페이지의 모든 주소에 관리자 페이지용 인터셉터가 동작하도록 등록 
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor) .addPathPatterns("/admin/*"); }
}
