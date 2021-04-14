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
	<link rel="stylesheet" href="css/listProductsStyle.css">
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div id="list">
		<div class="list-title">
			<h4>검색 결과</h4>	
		</div>
		<div class="search-info">
			<span class="keyword">'${keyword }'</span>
			에 대한 검색결과<span class="count">${resultCount }</span>건 입니다
		</div>
		
		<c:if test="${resultCount == 0}">
			<div class="not-found">
				<i class="fas fa-exclamation-circle"></i><br>
				<span>검색 결과가 없습니다. 다른 키워드로 찾아보시겠어요?</span>
			</div>
		</c:if>
		
		<div class="list-wrap">
			<c:forEach var="p" items="${resultList }">
			<div class="list-item-box">
					<ul class="items">
						<li><a href="/detailProducts.do?no=${p.product_no }"><img class="list-item-image" src="img/${p.product_main_img}"></a></li>	
				    	<li class="list-product-title"><a href="/detailProducts.do?no=${p.product_no }" class="a">${p.product_title }</a></li>
						<li class="list-product-subtitle">${p.product_subtitle }</li>
						<li class="list-price"><fmt:formatNumber value="${p.product_price }" pattern="##,###"/>원</li>
					</ul>
			</div>
			</c:forEach>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>