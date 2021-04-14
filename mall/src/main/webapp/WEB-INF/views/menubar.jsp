<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainPage/menubarStyle.css">
	<script src="https://kit.fontawesome.com/02a1ffc4ee.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<!-- 메뉴바 영역 시작 -->
	<div class="divide-line">
	<div class="body-wrapper">
	<div id="menubar" class="menubar">
			<div class="dropdown">
				<button type="button" class="btn btn-outline-dark dropbtn">
					<i class="fas fa-bars" style="font-size: 16px;"></i>
				</button>
				<div class="dropdown-content">		 
					<a href="/category?key=국&key=탕">국/탕</a>
					<a href="/category?key=찜&key=조림">찜/조림</a>
					<a href="/category?key=육류">육류</a>
					<a href="/category?key=생선&key=해산물">생선/해산물</a>
					<a href="/category?key=덮밥&key=비빔밥">한그릇 음식</a>
					<a href="/category?key=일품요리">일품요리</a>
					<a href="/category?key=밑반찬&key=김치">밑반찬/김치</a>
					<a href="/category?key=면">면</a>  
					<a href="/category?key=도시락">도시락</a>
					<a href="/category?key=샐러드">샐러드</a>
					<a href="/category?key=밀키트&key=기타">밀키트/기타</a>
					<a href="/category?key=베이커리">베이커리</a>
				</div>   
			</div>
			<div class=category-list>
				<ul style="margin-top: 0px; margin-bottom: 0px;">
					<li><a href='/listProducts.do'>전체상품</a></li>
					<li><a href='/set'>세트판매</a></li>
					<li><a href='/timesale'>타임세일</a></li>
					<li><a href='/reviewList'>회원리뷰</a></li>
					<li><a href='/events'>이벤트</a></li>
				</ul>
			</div>
			<div class="search-wrap">
				<form action="/search" method="get" style="height: 42px; display: flex;">
					<input type="search" name="keyword" class="inp_search" placeholder="오늘은 돈가츠?">
					<button type="submit" class="btn btn-alert btn-search"><i class="fas fa-search"></i></button>
				</form>
			</div>
			<div class="cart-wrap">
				<a href="/listCart.do" class="btn-cart"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
					<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				</svg></a>
			</div>
			<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	</div>
	</div>
	</div>
    <!-- 메뉴바 영역 끝 -->
    
<script type="text/javascript">
	$(function(){
	$(window).scroll(function(){  //스크롤하면 아래 코드 실행
	       var num = $(this).scrollTop();  // 스크롤값
	       if( num > 230 ){  // 스크롤을 36이상 했을 때
	          $(".divide-line").css("position","fixed");
	          $(".divide-line").css("top", "0px");
	       }else{
	           $(".divide-line").css("position","relative");
	       }
	  });
	});
</script>
</body>
</html>