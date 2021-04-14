<%@page import="com.mall.interceptor.LoginSessionListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainPage/headerStyle.css">
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<!-- 헤더 영역 시작 -->
	<div class="body-wrapper">
	<div id="header">
		<div class="nav-align">
			<div class="header menu-left">
				<ul>
					<li><a href="#">고객센터</a></li>  
				</ul>	
				
			</div>
		
		<c:if test="${login == null }">
			<div class="header menu-right" id="menu-right">		
				<ul>
					<li><a href="/signUp.do">회원가입</a></li>               
					<li><a href="/login/userLogin">로그인</a></li>      
					<li id="mypageLink"><a href="/mypage/mypage">마이페이지</a></li>      
				</ul>
			</div>
		</c:if>
		<c:if test="${login != null }">
			<div class="header menu-right" id="menu-right">		
				<ul>
					<li><a href="/login/logout">로그아웃</a></li>
					<li id="mypageLink"><a href="/mypage/mypage">마이페이지</a></li>      
				</ul>
			</div>
		</c:if>
			
		</div>
		<div class="nav-main-image">
			<a href="/">
			<img id="logo-image" src="${pageContext.request.contextPath}/img/logo.png" alt="메인이미지">
			</a>
		</div>
	</div>
	</div>
	<!-- 헤더 영역 끝 -->
	
</body>
</html>