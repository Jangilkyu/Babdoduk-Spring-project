<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/menubar.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/saleProductsStyle.css">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    
<title>Insert title here</title>
</head>
<body>
	<div id=saleProducts >
		<div id="sale-list-title" align="center">
			<h4>세일 목록</h4>	
		</div>
		
		<div id="sale-list" align="center">
			<div class="sale-wrap">
				<c:forEach var="s" items="${list }">
					<div class="sale-item-box">
						<ul class="items">
							<li><a href="/detailProducts.do?no=${s.sale.product_no }"><img  class="sale-item-image" src="img/${s.product.product_main_img}"></a></li>	
					    	<li class="sale-title"><a href="/detailProducts.do?no=${s.sale.product_no }" class="a">${s.product.product_title }</a></li>
							<li class="sale-subtitle">${s.product.product_subtitle }</li>
							<li class="sale-origin-price" style="color: gray;" value="${s.product.product_price }"><fmt:formatNumber value="${s.product.product_price }" pattern="#,###"/>원</li>
							<li class="sale-price" style="font-weight: bold;" value="${s.sale.timesale_saleprice }"><span class="sale-rate">-40%</span><fmt:formatNumber value="${s.sale.timesale_saleprice }" pattern="#,###"/>원</li>
							<li class="sale-timer" id="${s.sale.product_no }"></li>
							<li class="sale-endDate" value="${s.sale.timesale_end }" style="display: none;"></li>
						</ul>
					</div>
			    </c:forEach>
			</div>

		</div>
	</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
<script type="text/javascript" src="js/saleUtil.js"></script>
</body>
</html>