<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin/registerStyle.css">

<title>상품 정보 수정</title>
</head>
<body>
	<div class="admin-body-wrapper">
		<div class = "register-wrap">
			<div class = "register-title">
					<h3>상품 수정</h3>
			</div>
				
			<div class="container">
			<div class = "register-form">
				<form id="product_editor" method="post" class="form-inline" enctype="multipart/form-data">
					<div class="form-row">
						<div class="form-group">
							<label for="product_no" class="inputtag">상품번호</label>
							<input type="text" class="form-control inputbox" value="${product.product_no }" name="product_no" id="product_no" readonly>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_category" class="inputtag">카테고리</label>
							<input type="text" class="form-control inputbox" name="product_category" id="product_category" value="${product.product_category }">
						</div>
						<div class="form-group">
							<label for="product_stock" class="inputtag">재고</label>
							<input type="text" class="form-control inputbox" name="product_stock" id="product_stock" value="${product.product_stock }">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_title" class="inputtag">상품명</label>
							<input type="text" class="form-control" name="product_title" id="product_title" style="width: 900px;" value="${product.product_title }">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_subtitle" class="inputtag">상품 부제</label>
							<input type="text" class="form-control" name="product_subtitle" id="product_subtitle" style="width: 900px;" value="${product.product_subtitle }">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_text" class="inputtag">상세설명</label>
							<textarea cols="100" rows="6" class="form-control inputbox" name="product_detail_text" id="product_detail_text" style="width: 900px; resize: none;" >${product.product_detail_text }</textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_caloies" class="inputtag">칼로리</label>
							<input type="text" class="form-control inputbox" name="product_caloies" id="product_caloies" value="${product.product_caloies }">
						</div>
						<div class="form-group">
							<label for="product_origin" class="inputtag">원산지</label>
							<input type="text" class="form-control inputbox" name="product_origin" id="product_origin" value="${product.product_origin }">
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
					<input type="hidden" id="product_storage_hidden" value="${product.product_storage }">
					<div class="form-row">
						<div class="form-group">
							<label for="product_ingredient" class="inputtag">재료</label>
							<input type="text" class="form-control inputbox" name="product_ingredient" id="product_ingredient" value="${product.product_ingredient }">
						</div>
						<div class="form-group">
							<label for="product_price" class="inputtag">가격</label>
							<input type="text" class="form-control inputbox" name="product_price" id="product_price" value="${product.product_price }"><br>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_main_img" class="sr_only"></label>
							<input type="hidden" name="product_main_img" class="product_main_img" value="${product.product_main_img }">
							<label for="mainImgFile" class="inputtag">메인이미지</label>
							<input type="file" class="form-control inputbox" id="mainImgFile" name="mainImgFile" 
							onchange="setImg(event, 'main_img');" value="${product.product_main_img }" style="width: 545px;">
							<img src="/img/${product.product_main_img }" id="main_img" 
							onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
						</div>							
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_img1" class="sr_only"></label>
							<input type="hidden" name="product_detail_img1" class="product_detail_img1" value="${product.product_detail_img1 }">
							<label for="detailImgFile1" class="inputtag">상세이미지1</label>
							<input type="file"  class="form-control inputbox" id="detailImgFile1" name="detailImgFile1" 
							onchange="setImg(event, 'detail_img1');" value="${product.product_detail_img1 }" style="width: 545px;">
							<img src="/img/${product.product_detail_img1 }" id="detail_img1" 
							onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group">
							<label for="product_detail_img2" class="sr_only"></label>
							<input type="hidden" name="product_detail_img2" class="product_detail_img2" value="${product.product_detail_img2 }">
							<label for="detailImgFile2" class="inputtag">상세이미지2</label>
							<input type="file" class="form-control inputbox" id="detailImgFile2" name="detailImgFile2" 
							onchange="setImg(event, 'detail_img2');" value="${product.product_detail_img2 }" style="width: 545px;">
							<img src="/img/${product.product_detail_img2 }" id="detail_img2" 
							onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
							<span style="color: gray; maring-left: 12px;">(선택사항)</span>
						</div>
					</div>							
					<div class="form-row">
						<div class="edit delete-group">
							<button type="button" class="button delete" id="product_edit_delete"  onclick="deleteConfirmProduct('${product.product_no }','${product.product_title }')">삭제</button>
						</div>
						<div class="edit button-group">
							<button type="button" class="button submit" id="product_edit_submit">수정</button>
							<button type="button" class="button erase" id="product_edit_cancel" onclick="location.href='/admin/product-edit'">취소</button>
						</div>
					</div>
			</form>
	
			</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
<script type="text/javascript" src="/static/js/admin/productEdit.js"></script>
</body>
</html>