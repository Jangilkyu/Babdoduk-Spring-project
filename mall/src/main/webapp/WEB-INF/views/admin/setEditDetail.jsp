<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/admin/setStyle.css">
<title>Insert title here</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="register-wrap">
		<div class = "register-title">
			<h3>세트 수정</h3>
		</div>
		
		<div class="container">
		<div class="register-form">
			<form class="form-inline" id="set-register" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group">
						<label for="set_no" class="inputtag">세트번호</label>
						<input type="text" class="form-control inputbox" id="set_no" name="set_no" value="${set.set_no }" readonly>
					</div>
				</div>
				
				<c:forEach var="c" items="${compList }">
					<div class="form-group product-no-group" id="${c.product_no }">
						<label for="productNo" class="sr-only">번호</label>
						<input type="hidden" name="productNo" value="${c.product_no }">
					</div>
				</c:forEach>
				<div class="form-row">
					<span style="margin-right: 20px;">구성품 목록</span>
					<div class="table-container" style="width: 900px;">
					<table id="component-list" class="table table-hover">
						<thead>
							<tr>
								<th>상품번호</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th>가격</th>
								<th>재고</th>
								<th>취소</th>
							</tr>
						</thead>
						<c:forEach var="c" items="${compList }">
							<tr id="${c.product_no }">
								<th>${c.product_no }</th>
								<th>${c.product_category }</th>
								<th>${c.product_title }</th>
								<th>${c.product_price }</th>
								<th>${c.product_stock }</th>
								<th><i class="fas fa-window-close" onclick="document.getElementById('${c.product_no}').remove();"></i></th>
							</tr>
						</c:forEach>
					</table>
					</div>
				</div>
					<button type="button" class="button" id="button-search" 
					onclick="popupSearch();"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;구성품 추가</button>
				<div class="form-row">
					<div class="form-group">
						<label for="set_title" class="inputtag">세트명</label>
						<input type="text" class="form-control inputbox" id="set_title" name="set_title" value="${set.set_title }" style="width: 900px;">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_subtitle" class="inputtag">부제목</label>
						<input type="text" class="form-control inputbox" id="set_subtitle" name="set_subtitle" value="${set.set_subtitle }" style="width: 900px;">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_detail_text" class="inputtag">상세설명</label>
						<textarea cols="100" rows="6" class="form-control inputbox" name="set_detail_text" id="set_detail_text" style="width: 900px; resize: none;">${set.set_detail_text }</textarea>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_price" class="inputtag">가격</label>
						<input type="text" class="form-control inputbox" id="set_price" name="set_price" value="${set.set_price }">
					</div>
					<div class="form-group">
						<label for="set_stock" class="inputtag">재고</label>
						<input type="text" class="form-control inputbox" id="set_stock" name="set_stock" value="${set.set_stock }">
					</div>
				</div>
				
				<div class="form-row">
					<div class="form-group">
						<label for="product_main_img" class="sr_only"></label>
						<input type="hidden" name="set_img" value=${set.set_img }>
						<label for="set_img_file" class="inputtag">이미지</label>
						<input type="file" class="form-control inputbox" id="imgFile" name="imgFile" onchange="setImg(event, 'main_img');" style="width: 545px;">
						<img src="/img/${set.set_img }" id="main_img" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
					</div>							
				</div>

				<div class="form-row">
					<div class="button-group" id="register-button-group">
						<button type="button" class="button submit" id="sale-register-submit">등록</button>
						<button type="button" class="button cancel" id="set_edit_cancel" onclick="location.href='/admin/set-edit'">취소</button>
					</div>
				</div>
			</form>
		</div>
		</div>
		
	</div>
</div>

<script type="text/javascript" src="/js/admin/adminFuntions.js"></script>
<script type="text/javascript" src="/js/admin/setEdit.js"></script>
</body>
</html>