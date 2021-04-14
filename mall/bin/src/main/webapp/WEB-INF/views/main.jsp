<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainpage</title>
    <link rel="stylesheet" href="static/css/mainpageStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
    
    <!-- 아래 세 개는 임시 추가된 태그로, 작업 편의를 위해 캐시를 저장하지 않게 하는 태그입니다 -->
    <meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">

</head>
<body>
	<!-- 헤더 영역 시작 -->
	<nav id="header">
		<div class="nav-align">
			<div class="header menu-right">
				<ul>
					<li><a href="#">고객센터</a></li>  
				</ul>	
				
			</div>
			<div class="header menu-left">
				<ul>
					<li><a href="/signUp.do">회원가입</a></li>               
					<li><a href="/login.do">로그인</a></li>      
					<li><a href="#">마이페이지</a></li>      
				</ul>
			</div>
		</div>
		<div class="nav-main-image">
			<img src="static/img/mainimage.JPG" alt="메인이미지">
		</div>
	</nav>
	<!-- 헤더 영역 끝 -->
	
	<!-- 메뉴바 영역 시작 -->
	<div id="menubar" class="menubar">
			<div class="dropdown">
				<button type="button" class="btn btn-outline-dark dropbtn">
					<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-justify" viewBox="0 0 16 16">
						<path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>  
					</svg> 
				</button>
				<div class="dropdown-content">
					<a href="#">국&탕</a>
					<a href="#">찌개&전골</a>
					<a href="#">찜&조림</a>
					<a href="#">볶음요리</a>    
					<a href="#">밑반찬</a>
					<a href="#">튀김</a>
					<a href="#">구이</a>
					<a href="#">김밥&초밥</a>
					<a href="#">기타요리</a>
				</div>   
			</div>
			<div class=menu>
				<ul>
					<li><a href='/shop/goods/productlist.do?category=123'>카테고리</a></li>
					<li><a href='/shop/goods/productlist.do?category=121'>정기구독</a></li>
					<li><a href='/shop/goods/productlist.do?category=123'>집밥코디</a></li>
					<li><a href='/shop/goods/productlist.do?category=123'>타임세일</a></li>
					<li><a href='/shop/goods/productlist.do?category=123'>회원리뷰</a></li>
					<li><a href='/shop/goods/productlist.do?category=123'>이벤트</a></li>
				</ul>
			</div>
			<div class="search-wrap">
				<form action="#">
					<input type="search" class="inp_search" placeholder="오늘 돈카츠ㄱㄱ?">
					<button type="submit" class="btn btn-alert btn-search">검색</button>
				</form>
			</div>
			<div class="cart-wrap">
				<a href="#" class="btn-cart"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
					<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
				</svg></a>
			</div>
			<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	</div>
    <!-- 메뉴바 영역 끝 -->
    
    <!-- 이벤트 배너 영역 시작 -->
    <div id="event-banner" class="event-banner">
		<div class="viewbox">
			<div class="track">
				<div class = "slide active">
					<img class="banner-image" src="static/img/banner01.PNG">
				</div>
				<div class = "slide">
					<img class="banner-image" src="static/img/banner02.PNG">
				</div>
				<div class = "slide">
					<img class="banner-image" src="static/img/banner03.PNG">
				</div>
				<div class = "slide">
					<img class="banner-image" src="static/img/banner04.PNG">
				</div>
			</div>
			
			<div class="dot-indicator">
				<div class="dot active"></div>
				<div class="dot"></div>
				<div class="dot"></div>
				<div class="dot"></div>
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
	<div id="best">
		<div class="best-title">
			<h2>금주 베스트 상품</h2>
		</div>
		<div class="best-wrap">
			<div class="bestline first">
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best01.png"></a></li>
					<li class="title"><a href="#" class="a">민트탄산수</a></li>
					<li class="price">2,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best02.png"></a></li>
					<li class="title"><a href="#" class="a">잣 대추 밤 넣은 죽</a></li>
					<li class="price">3,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best03.png"></a></li>
					<li class="title"><a href="#" class="a">아마도 탄탄면</a></li>
					<li class="price">4,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best04.png"></a></li>
					<li class="title"><a href="#" class="a">엄청 작은 미트볼</a></li>
					<li class="price">5,000원</li>
				</ul>
			</div>
			
			<div class="bestline second">
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best05.png"></a></li>
					<li class="title"><a href="#" class="a">소고기 쌀국수</a></li>
					<li class="price">5,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best06.png"></a></li>
					<li class="title"><a href="#" class="a">치킨커리</a></li>
					<li class="price">5,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best07.png"></a></li>
					<li class="title"><a href="#" class="a">요거트 와플</a></li>
					<li class="price">5,000원</li>
				</ul>
				<ul class="items">
					<li class="best-item-image"><a href="#"><img src="static/img/best08.png"></a></li>
					<li class="title"><a href="#" class="a">토마토 큰미트볼</a></li>
					<li class="price">5,000원</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 베스트 상품 영역 종료 -->
	
	<!-- 푸터 영역 시작 -->
	<footer class="footer">
		<div class="footer-link">
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">자주묻는 질문</a></li>
				<li><a href="#">1:1문의</a></li>

				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">이용안내</a></li>
			</ul>
		</div>

		<div class="footer-outer">
			<div class="footer-col">
				<strong class="footer-title">고객센터</strong>
				<p class="footer--call">1588-0000</p>
				<p class="footer--cs">평일 | 09:00 ~ 18:00</p>
				<p class="footer--cs">휴일 | 09:00 ~ 14:00</p>
				<p class="footer--cs">점심시간 | 12:00 ~ 13:00</p>
			</div>

			<div class="footer-col">
				<strong class="footer-title">회사정보</strong>
				<p class="footer--company">법인명: 3조 반찬쇼핑몰 | 대표자: OOO</p>
				<p class="footer--company">회사주소: 서울시 마포구 서교동 OO빌딩 OO층</p>
				<p class="footer--company">사업자등록번호: 000-00-0000</p>
				<p class="footer--company">대표전화번호: 02) 000-0000</p>
				<p class="footer--company">관리책임자: 김반찬 | 이메일: banchan@market.com</p>
			</div>
		</div>

		<div class="footer-bottom">
			<p class="footer--copy">&copy; 2021. BanchanMarket All rights reserved.</p>
		</div>
	</footer>
	<!-- 푸터 영역 종료 -->
   
<script type="text/javascript" src="/static/js/eventbanner.js"></script>
<meta http-equiv="Expires" content="-1">
</body>
</html>