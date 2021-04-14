<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/admin/saleStyle.css">
<title>상품 정보 수정</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="register-wrap">
		<div class = "register-title">
			<h3>할인 정보 수정</h3>
		</div>
		
		<div class="container">
		<div class="register-form">
				
			<form id="sale_editor" class="form-inline" method="post" >
				<div class="form-row">
					<div class="form-group">
						<label for="productNo" class="inputtag">상품번호</label>
						<input type="text" class="form-control inputbox" id="productNo" name="productNo" value="${product.product_no }" readonly>
					</div>
					<div class="form-group">
						<label for="productTitle" class="inputtag">상품명</label>
						<input type="text" class="form-control inputbox" id="productTitle" value="${product.product_title }" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="salePrice" class="inputtag">할인가</label>
						<input type="text" class="form-control inputbox" id="salePrice" name="salePrice" value="${sale.timesale_saleprice }">
					</div>
					<div class="form-group">
						<label for="productPrice" class="inputtag">원가격</label>
						<input type="text" class="form-control inputbox" id="productPrice" value="${product.product_price }" readonly>
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
						<button type="button" class="button submit" id="sale-register-submit">등록</button>
						<button type="button" class="button" id="sale-register-redirect" onclick="location.href='/admin/sale-edit'">취소</button>
					</div>
				</div>
			</form>
		</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	let date = '${sale.timesale_start }';
	let fDate = "${sale.timesale_end }";
	
	let startDate = date.slice(0, 10);
	let startTime = date.slice(11, 16);
	let endDate = fDate.slice(0, 10);
	let endTime = fDate.slice(11, 16);
	
	document.getElementById('startDate').value = startDate;
	document.getElementById('startDate').min = startDate;
	document.getElementById('startTime').value = startTime;
	
	document.getElementById('endDate').value = endDate;
	document.getElementById('endDate').min = startDate;
	document.getElementById('endTime').value = endTime;
	
	let productNo = document.getElementById('productNo').value;
	let ajaxUrl = '/admin/sale-edit/' + productNo;
	
	$('#sale-register-submit').click(function(){
	
		if(checkSaleForm()){
			let updateData = new FormData(document.getElementById('sale_editor'));	
			$.ajax({
				url:ajaxUrl,
				data:updateData,
				type:'post',
				processData:false,
				contentType:false,
				success:function(){
					alert("세일 정보 수정에 성공하였습니다.");
				}
			});
		}
	});
</script>
<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
<script type="text/javascript" src="/static/js/admin/saleRegister.js"></script>
</body>
</html>