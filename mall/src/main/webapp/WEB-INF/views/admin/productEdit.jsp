<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/admin/listStyle.css">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-body-wrapper">
		<div class="list-wrap">
			<div class="list-title">
				<h3>상품 목록</h3>
			</div>
		
			<div class="table-container">
				<div class="table-wrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>상품번호</th>
							<th>카테고리</th>
							<th>상품명</th>
							<th>재고</th>
							<th>메인이미지</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>

					<c:forEach var="p" items="${list }">
						<tr>
							<td id="${p.product_no }">${p.product_no }</td>
							<td>${p.product_category }</td>
							<td>${p.product_title }</td>
							<td>${p.product_stock }</td>
							<td><img src="/img/${p.product_main_img }" style="width: 80px; height: 30px; object-fit: cover;"></td>
							<td><i class="fas fa-edit" id="edit-icon" onclick="location.href='/admin/product-edit/${p.product_no }'"></i></td>
							<td><i class="fas fa-trash-alt" id="delete-icon" onclick="deleteConfirmProduct('${p.product_no }','${p.product_title }')"></i></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
</body>
</html>