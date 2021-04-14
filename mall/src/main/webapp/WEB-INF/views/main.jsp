<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="menubar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainpage</title>
    <link rel="stylesheet" href="css/mainPage/mainpageStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
	
</head>
<body>

    <!-- 이벤트 배너 영역 시작 eventList-->
    <div id="event-banner" class="event-banner">
		<div class="viewbox">
			<div class="track">
				<c:forEach var="e" items="${eventList }">
					<div class = "slide">
						<a href="${e.event_link }"><img class="banner-image" src="img/${e.event_img }"></a>
					</div>
				</c:forEach>
			</div>
			
			<div class="dot-indicator">
				<c:forEach var="e" items="${eventList }">
					<div class="dot"></div>
				</c:forEach>
			</div>
			
			<div class="arrow">
				<i class="arrow-left">
					<img src = "static/img/arrow_left.png">
				</i>
				<i class="arrow-right">
					<img src = "static/img/arrow_right.png">
				</i>
			</div>
		</div>
	</div>
	<!-- 이벤트 배너 영역 종료 -->
	
	<!-- 베스트 상품 영역 시작 -->
	<div id="new">
		<div class="new-title">
			<h4>따끈따끈 신상품</h4>
		</div>
		<div class="new-wrap">
			<c:forEach var="n" items="${newProducts }">
			<div class="new-item-box">
				<ul class="items">
					<li><a href="/detailProducts.do?no=${n.product_no }"><img class="new-item-image" src="img/${n.product_main_img }"></a></li>
					<li class="new-product-title"><a href="/detailProducts.do?no=${n.product_no }">${n.product_title }</a></li>
					<li class="new-product-subtitle">${n.product_subtitle }</li>
					<li class="new-price"><fmt:formatNumber value="${n.product_price }" pattern="##,###"/>원</li>
				</ul>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 베스트 상품 영역 종료 -->

	<%@ include file="footer.jsp" %>

	<script type="text/javascript" src="/static/js/eventbanner.js"></script>
	<meta http-equiv="Expires" content="-1">
</body>
</html>