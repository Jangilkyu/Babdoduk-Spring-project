package com.mall.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mall.interceptor.LoginSessionListener;

@Configuration
public class LoginMvcConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		 registry.addInterceptor(new LoginSessionListener()) .addPathPatterns("/mypage/*") .addPathPatterns("/inquiry/*") .addPathPatterns("/payment/*").addPathPatterns("/cart/*");
	}//addInterceptors
	
}//class