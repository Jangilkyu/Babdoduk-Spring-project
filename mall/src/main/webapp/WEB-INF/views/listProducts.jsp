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
	<title>listProducts</title>
	
    <link rel="stylesheet" href="static/css/listProductsStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<div id="list">
		<div class="list-title">
			<c:choose>
				<c:when test="${title != null}">
					<h4>${title }</h4>	
				</c:when>
				<c:otherwise>
					<h4>상품 목록</h4>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="list-wrap">
			<c:forEach var="p" items="${list }">
			<div class="list-item-box">
					<ul class="items">
						<li><a href="/detailProducts.do?no=${p.product_no }"><img class="list-item-image" src="img/${p.product_main_img}"></a></li>	
				    	<li class="list-product-title"><a href="/detailProducts.do?no=${p.product_no }" class="a">${p.product_title }</a></li>
						<li class="list-product-subtitle">${p.product_subtitle }</li>
						<c:choose>
							<c:when test="${saleMap[p.product_no] != null}">
								<li class="sale-origin-price" value="${p.product_price }"><fmt:formatNumber value="${p.product_price }" pattern="##,###"/>원</li>
								<li class="sale-price" value="${saleMap[p.product_no].timesale_saleprice }">
									<span class="sale-rate">-0%</span>
									<fmt:formatNumber value="${saleMap[p.product_no].timesale_saleprice }" pattern="##,###"/>원</li>
							</c:when>
							<c:otherwise>
								<li class="list-price"><fmt:formatNumber value="${p.product_price }" pattern="##,###"/>원</li>
							</c:otherwise>
						</c:choose>
					</ul>
			</div>
			</c:forEach>
		</div>
		
		<div class="page-num">
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="listProducts.do?pageNum=${i }">${i }</a>
			</c:forEach>
		</div>
		
	</div>

	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/saleUtil.js"></script>
</body>
</html>