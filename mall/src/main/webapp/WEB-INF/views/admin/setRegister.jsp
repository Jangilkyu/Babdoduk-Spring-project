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
	<link rel="stylesheet" href="/css/admin/setStyle.css">
<title>Insert title here</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="register-wrap">
		<div class = "register-title">
			<h3>세트 등록</h3>
		</div>
		
		<div class="container">
		<div class="register-form">
			<form action="set-register" onsubmit="" class="form-inline" id="set-register" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group">
						<label for="set_no" class="inputtag">세트번호</label>
						<input type="text" class="form-control inputbox" id="set_no" name="set_no" value="${nextNo }" readonly>
					</div>
				</div>
				
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
					</table>
					</div>
				</div>
					<button type="button" class="button" id="button-search" 
					onclick="popupSearch();"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;구성품 추가</button>
				<div class="form-row">
					<div class="form-group">
						<label for="set_title" class="inputtag">세트명</label>
						<input type="text" class="form-control inputbox" id="set_title" name="set_title" style="width: 900px;">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_subtitle" class="inputtag">부제목</label>
						<input type="text" class="form-control inputbox" id="set_subtitle" name="set_subtitle" style="width: 900px;">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_detail_text" class="inputtag">상세설명</label>
						<textarea cols="100" rows="6" class="form-control inputbox" name="set_detail_text" id="set_detail_text" style="width: 900px; resize: none;"></textarea>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="set_price" class="inputtag">가격</label>
						<input type="text" class="form-control inputbox" id="set_price" name="set_price">
					</div>
					<div class="form-group">
						<label for="set_stock" class="inputtag">재고</label>
						<input type="text" class="form-control inputbox" id="set_stock" name="set_stock">
					</div>
				</div>
				
				<div class="form-row">
					<div class="form-group">
						<label for="product_main_img" class="sr_only"></label>
						<input type="hidden" name="set_img">
						<label for="set_img_file" class="inputtag">이미지</label>
						<input type="file" class="form-control inputbox" id="imgFile" name="imgFile" onchange="setImg(event, 'main_img');" style="width: 545px;">
						<img src="" id="main_img" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
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
</body>
</html>