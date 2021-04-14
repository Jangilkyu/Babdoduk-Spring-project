<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>listSets</title>
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/02a1ffc4ee.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="static/css/setProductsStyle.css">
<title>Insert title here</title>
</head>
<body>
	<div id="list">
		<div class="list-title">
			<h4>세트 목록</h4>	
		</div>
		
		<div class="list-wrap">
			<c:forEach var="s" items="${setList }">
			<div class="list-set-box">
				<div class="image-box">
					<img class="list-set-image" src="img/${s.set_img}">
				</div>
				<div class="content-box">
					<ul class="set-info">
				    	<li class="list-set-title">${s.set_title }</li>
						<li class="list-set-subtitle">${s.set_subtitle }</li>
						<li class="list-set-text">${s.set_detail_text }</li>
						<c:forEach var="c" items="${compList }">
							<c:if test="${s.set_no == c.component.set_no }">
								<li><a href="/detailProducts.do?no=${c.product.product_no }">- ${c.product.product_title }</a></li>
							</c:if>
						</c:forEach>
						
					</ul>
				</div>
				<div class="buy-box">
					<div class="select-num">
						<span>구매 수량</span>
						<i class="fas fa-minus" id="minus-${s.set_no }" onclick="downAmount(this, ${s.set_price });"></i>
						<input type="text" class="amount" id="amount-${s.set_no }" value="1">
						<i class="fas fa-plus" id="plus-${s.set_no }" onclick="upAmount(this, ${s.set_price });"></i>
					</div>
					<div class="select-price">
						<span>총 금액</span>
						<span class="total-price" id="price-${s.set_no }">${s.set_price }</span>원
					</div>
					<div class="cart-button">
						<button type="button" class="add-cart">장바구니 담기</button>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

<script type="text/javascript">
	function downAmount(obj, price){
		let id = obj.id;
		id = id.substring(id.indexOf('-')+1, id.length);
		let num = document.getElementById('amount-'+id);
		let total = document.getElementById('price-'+id);
		if(num.value > 1){
			num.value = Number(num.value) - 1;
			total.innerHTML = Number(total.innerHTML) - price;
		}
	}
	
	function upAmount(obj, price){
		let id = obj.id;
		id = id.substring(id.indexOf('-')+1, id.length);
		let num = document.getElementById('amount-'+id);
		let total = document.getElementById('price-'+id);
		if(num.value < 100){
			num.value = Number(num.value) + 1;
			total.innerHTML = Number(total.innerHTML) + price;
		}
	}
</script>
</body>
</html>
