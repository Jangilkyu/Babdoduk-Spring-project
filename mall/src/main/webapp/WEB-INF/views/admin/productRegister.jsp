<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/admin/registerStyle.css">
</head>
<body>
	<div class="admin-body-wrapper">
		<div class = "register-wrap">
			<div class = "register-title">
				<h3>상품 등록</h3>
			</div>
			
			<div class="container">
			<div class = "register-form">
				<form action="product-register"  onsubmit="return checkProductForm('register');" class="form-inline" id="product_register" method="post" enctype="multipart/form-data">
					<div class="form-row">
						<div class="form-group">
							<label for="product_no" class="inputtag">상품번호</label>
							<input type="text" class="form-control inputbox" value="${nextNo }" name="product_no" id="product_no" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_category" class="inputtag">카테고리</label>
							<input type="text" class="form-control inputbox" name="product_category" id="product_category" >
						</div>
						<div class="form-group">
							<label for="product_stock" class="inputtag">재고</label>
							<input type="text" class="form-control inputbox" name="product_stock" id="product_stock" >
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_title" class="inputtag">상품명</label>
							<input type="text" class="form-control" name="product_title" id="product_title" style="width: 900px;">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_subtitle" class="inputtag">상품 부제</label>
							<input type="text" class="form-control" name="product_subtitle" id="product_subtitle" style="width: 900px;" >
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_text" class="inputtag">상세설명</label>
							<textarea cols="100" rows="6" class="form-control inputbox" name="product_detail_text" id="product_detail_text" style="width: 900px; resize: none;"></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_caloies" class="inputtag">칼로리</label>
							<input type="text" class="form-control inputbox" name="product_caloies" id="product_caloies">
						</div>
						<div class="form-group">
							<label for="product_origin" class="inputtag">원산지</label>
							<input type="text" class="form-control inputbox" name="product_origin" id="product_origin">
						</div>
						<div class="form-group">
							<label for="product_storage" class="inputtag">보관방법</label>
							<select name="product_storage" id="product_storage" class="form-control">
								<option value="냉장" selected="selected">냉장</option>
								<option value="냉동">냉동</option>
								<option value="실온">실온</option>
							</select><br>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_ingredient" class="inputtag">재료</label>
							<input type="text" class="form-control inputbox" name="product_ingredient" id="product_ingredient">
						</div>
						<div class="form-group">
							<label for="product_price" class="inputtag">가격</label>
							<input type="text" class="form-control inputbox" name="product_price" id="product_price" ><br>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_main_img" class="sr_only"></label>
							<input type="hidden" name="product_main_img" class="product_main_img">
							<label for="mainImgFile" class="inputtag">메인이미지</label>
							<input type="file" class="form-control inputbox" id="mainImgFile" name="mainImgFile" onchange="setImg(event, 'main_img');" style="width: 545px;">
							<img src="" id="main_img" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
						</div>							
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_img1" class="sr-only"></label>
							<input type="hidden" name="product_detail_img1" class="product_detail_img1">
							<label for="detailImgFile1" class="inputtag">상세이미지1</label>
							<input type="file"  class="form-control inputbox" id="detailImgFile1" name="detailImgFile1" onchange="setImg(event, 'detail_img1');" style="width: 545px;">
							<img src="" id="detail_img1" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_img2" class="sr_only"></label>
							<input type="hidden" name="product_detail_img2" class="product_detail_img2">
							<label for="detailImgFile2" class="inputtag">상세이미지2</label>
							<input type="file" class="form-control inputbox" id="detailImgFile2" name="detailImgFile2" onchange="setImg(event, 'detail_img2');" style="width: 545px;">
							<img src="" id="detail_img2" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
							<span style="color: gray; maring-left: 12px;">(선택사항)</span>
						</div>
					</div>
					<div class="form-row">
						<div class="button-group" id="register-button-group">
							<button type="submit" class="button submit" id="product-register-submit">등록</button>
							<button type="reset" class="button erase" id="product-register-erase">재작성</button>
						</div>
					</div>
				</form>
				</div>
				</div>
		</div>
	</div>

<script type="text/javascript" src="/static/js/admin/generate_random.js"></script>
<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
</body>
</html>