<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ include file="menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>detailProducts</title>
	
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,600,700,800&amp;subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<meta charset="UTF-8">   
	<link rel="stylesheet" href="static/css/detailProductsStyle.css">
	

</head>
<body>

	<section id="detailProducts"><br>
	<div class="product-detail">		
		<div class="product-detail-wrap" align="center">
			<div class="product-img-wrap">
				<img class="product-mainimg" src="img/${p.product_main_img }">
			</div>
			
			<div class="product-content-wrap">
				<div class="product-title">
					<span>${p.product_title }</span>
				</div>
				<div class="product-subtitle">
					<span>${p.product_subtitle }</span>
				</div>
				<div class="product-category">
					<span>카테고리 > ${p.product_category }</span>
				</div>
				<div class="product-detail-head">
					<ul class="detail-heads">
						<li>원산지</li>
						<li>칼로리</li>
						<li>보관방법</li>
						<li>재료</li>
					</ul>
				</div>
				<div class="product-detail-body">
					<ul class="detail-bodies">
						<li>${p.product_origin }</li>
						<li>${p.product_caloies } kcal</li>
						<li>${p.product_storage }</li>
						<li>${p.product_ingredient }</li>
					</ul>
				</div>
				
				<form class="purchase-form" name="form-cart" method="post" action="/insert.do">
					<input type="hidden" name="product_no" value="${p.product_no }">
					<input type="hidden" name="product_price" id="product_price" value="${p.product_price }">
					<input type="hidden" name="product_title" value="${p.product_title }">
					
					<div class="product-select-amount">
						<span class="qty-span">수량 선택</span>		
						<select id="product_qty" name="product_qty" onchange="getProductQTY();">
							<c:set var="total_price" value="${p.product_price }"/>
								<c:forEach var="i" begin="1" end="10" >
									<option value="${i }">${i }</option>
								</c:forEach>
						</select>&nbsp;개&nbsp;
					</div>
					<div class="product-total-price">
						<span class="price-span">총 가격</span>
						<span id="total_price"><fmt:formatNumber value="${total_price }" pattern="#,###"/></span>
						<span class="price-span">원</span>
					</div>
					<div class="button">
						<input type="submit" id="input_cart" class="cart-button" value="장바구니에 담기">						
					</div>
				</form>
				
			</div>
		</div>
		
		<div id="product-board-wrap">
			<div class="product-navi-var">
				<button class="navi-button">상품 상세설명</button>
				<button class="navi-button">상품 리뷰</button>
				<hr class="navibar-line">
			</div>		
			<div class="product-info max-width">
				<div class="img-box max-width">
					<img src="img/${p.product_detail_img1 }" class="img-content">
				</div>
				<div class="info-title max-width">
					<span>${p.product_title }</span>
				</div>
				<div class="info-subtitle max-width">
					<span>${p.product_subtitle }</span>
				</div>
				<div class="info-text max-width">
					<span>${p.product_detail_text }</span>
				</div>
				<c:if test="${p.product_detail_img2 != null}">
				<div class="img-box max-width">
					<img src="img/${p.product_detail_img2 }">			
				</div>
				</c:if>
			</div>
			
			<div class="product-navi-var">
				<button class="navi-button">상품 상세설명</button>
				<button class="navi-button">상품 리뷰</button>
				<hr class="navibar-line">
			</div>
			<div class="product-reviews max-width">
				<div class="table-container">
					<div class="table-wrap">
					<table class="table table-hover">
						<thead>
							<tr>
								<td>글번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>조회수</td>
								<td>작성일</td>
							</tr>
						</thead>
						
						<c:forEach var="r" items="${reviews }">
							<tr>
								<td id="${r.review_no }">${r.review_no }</td>
								<td>${r.review_title }</td>
								<td>${r.mem_id }</td>
								<td>${r.review_hit }</td>
								<td>${r.review_regdate }</td>
							</tr>
						</c:forEach>
					</table>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="mem_id" value="${mem_id }">
	</div>
	</section>
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/priceUtil.js"></script>
</body>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	/*
		$(function(){
			$("#input_cart").click(function(){
				if(confirm("장바구니로 가기")) {
					location.href="/listCart.do";
				}
			});	
		});
	*/
	
	$("#input_cart").on('click',function(){
			if($("#mem_id").val() == 0){
					alert("로그인 후 이용가능합니다.");	
					location.href="/login/userLogin";			
			}
	});
	
	
	// 상품 수량 선택 이벤트처리
	function getProductQTY(){
		var qty = $("#product_qty option:selected").val();
		var total_price = $("#product_price").val();
		total_price = total_price*qty;
		//alert(total_price);
		total_price = priceFormat(total_price);
		
		document.getElementById("total_price").innerHTML = total_price;
	}	
	</script>
</html>