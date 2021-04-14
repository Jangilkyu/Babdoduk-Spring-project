<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/adminSideMenu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/adminStyle.css">
<title>Insert title here</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="admin-title">
		<h2>상품 관리</h2>
	</div>
	
	<table width="70%">
		<tr>
			<td>상품번호</td>
			<td>카테고리</td>
			<td>상품명</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
		
		<c:forEach var="p" items="${list }">
			<tr>
				<td id="${p.product_no }">${p.product_no }</td>
				<td>${p.product_category }</td>
				<td>${p.product_title }</td>
				<td><input type="button" value="수정" onclick="location.href='/admin/product-edit/${p.product_no }'"></td>
				<td><input type="button" value="삭제" onclick="deleteConfirm('${p.product_no }','${p.product_title }')"></td>
			</tr>
		</c:forEach>
	</table>
</div>

<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
</body>
</html>