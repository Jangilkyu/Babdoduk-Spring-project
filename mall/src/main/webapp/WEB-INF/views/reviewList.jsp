<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/listReviewStyle.css">
	<title>리뷰리스트</title>
</head>
<body>
	<div class="review-body-wrapper">
		<div class="list-wrap">
			<div class="list-title">
				<h3>리뷰 게시판</h3>
			</div>
			
			<div class="search-container">
				<input type="text" id="keyword" placeholder="검색할 상품명을 입력">
				<button id="searchBtn">검색</button>
			</div>
			<div class="table-container">
				<div class="tavle-wrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>					
					<tbody id="reviewListBody">
					</tbody>
				</table>
				</div>
			</div>
			<div id="pagiNation">
			</div>
		</div>
	</div>
	<!-- jquery -->
	<script src="/static/js/loadReviewList.js"></script>
	</body>
<%@ include file="footer.jsp"%>
</html>