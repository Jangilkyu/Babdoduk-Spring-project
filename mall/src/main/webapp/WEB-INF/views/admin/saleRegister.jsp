<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/admin/saleStyle.css">
<title>할인 등록 페이지</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="register-wrap">
		<div class = "register-title">
			<h3>할인 등록</h3>
		</div>
		
		<div class="container">
		<div class="register-form">
			<div class="form-row">
				<button type="button" class="button" id="button-search" 
				onclick="popupSearch();"><i class="fas fa-search"></i>&nbsp;&nbsp;상품 찾기</button>
			</div>
			
			<form action="sale-register" onsubmit="return checkSaleForm();" class="form-inline" id="sale-register" method="post">
				<div class="form-row">
					<div class="form-group">
						<label for="productNo" class="inputtag">상품번호</label>
						<input type="text" class="form-control inputbox" id="productNo" name="productNo" placeholder="상품 찾기로 입력" readonly>
					</div>
					<div class="form-group">
						<label for="productTitle" class="inputtag">상품명</label>
						<input type="text" class="form-control inputbox" id="productTitle" placeholder="상품 찾기로 입력" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="salePrice" class="inputtag">할인가</label>
						<input type="text" class="form-control inputbox" id="salePrice" name="salePrice" placeholder="상품 세일가 입력">
					</div>
					<div class="form-group">
						<label for="productPrice" class="inputtag">원가격</label>
						<input type="text" class="form-control inputbox" id="productPrice" placeholder="상품 찾기로 입력" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="startDate" class="inputtag">시작일</label>
						<input type="date" class="form-control inputbox" value="2021-01-01" min="2021-01-01" max="2100-01-01" id="startDate" name="startDate">
					</div>
					<div class="form-group">
						<label for="startTime" class="sr-only"></label>
						<input type="time" class="form-control inputbox" value="00:00" id="startTime" name="startTime">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="endDate" class="inputtag">종료일</label>
						<input type="date" class="form-control inputbox" value="2021-01-01" min="2021-01-01" max="2100-01-01" id="endDate" name="endDate">
					</div>
					<div class="form-group">
						<label for="endTime" class="sr-only"></label>
						<input type="time" class="form-control inputbox" value="00:00" id="endTime" name="endTime">
					</div>
				</div>
				<div class="form-row">
					<div class="button-group" id="register-button-group">
						<button type="submit" class="button submit" id="sale-register-submit">등록</button>
					</div>
				</div>
			</form>
		</div>
		</div>
		
	</div>
</div>
<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
<script type="text/javascript" src="/static/js/admin/saleRegister.js"></script>
</body>
</html>