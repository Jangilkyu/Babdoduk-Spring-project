<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/admin/listStyle.css">
<title>할인 상품 목록</title>
</head>
<body>
	
	<div class="admin-body-wrapper">
		<div class="list-wrap">
			<div class="list-title">
				<h3>할인 목록</h3>
			</div>
			
			<div class="table-container">
				<div class="table-wrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>상품번호</td>
							<td>상품명</td>
							<td>시작일</td>
							<td>종료일</td>
							<td>원가격</td>
							<td>할인가</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
					</thead>
					
					<c:forEach var="s" items="${list }">
						<tr>
							<td id="${s.sale.product_no }">${s.sale.product_no }</td>
							<td>${s.product.product_title }</td>
							<td>${s.sale.timesale_start }</td>
							<td>${s.sale.timesale_end }</td>
							<td>${s.product.product_price}</td>
							<td>${s.sale.timesale_saleprice }</td>
							<td><i class="fas fa-edit" id="edit-icon" onclick="location.href='/admin/sale-edit/${s.sale.product_no }'"></i></td>
							<td><i class="fas fa-trash-alt" id="delete-icon" onclick="deleteConfirmSale('${s.sale.product_no }')"></i></td>
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