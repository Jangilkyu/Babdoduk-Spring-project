<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id=listProducts><br>
		<div id="title" align="center">
			<h2>상품목록</h2>	
		</div>
		
		<div align="center">
			<hr>
			<table border="1" width="80%">
				<tr>
					<td>상품번호</td>
					<td>메인이미지</td>
					<td>상품명</td>
					<td>서브제목</td>
					<td>상품가격</td>
					<td>상품등록일</td>
				</tr>
				
				<c:forEach var="p" items="${list }">
					<tr>
						<td>${p.product_no }</td>
						<td>
							<a href="/detailProducts.do?no=${p.product_no }">
							<img src="img/${p.product_main_img}" width="100" height="100">
							</a>
						</td>
						<td>
							<a href="/detailProducts.do?no=${p.product_no }">
							${p.product_title }
							</a>
						</td>
						<td>${p.product_subtitle }</td>
						<td>
							<fmt:formatNumber value="${p.product_price }" pattern="#,###"/>
						</td>
						<td>${p.product_regdate }</td>
					</tr>
				</c:forEach>
			</table>
			
			<hr>
		</div>
	</section>
</body>