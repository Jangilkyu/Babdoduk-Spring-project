<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h3>상품 검색기</h3>
	<div>
		 <input type="text" name="searchKeyword" id="searchKeyword" style="width:600px; height:20px" placeholder="상품명으로 검색" 
		 onkeyup="search('searchKeyword');">
	</div>
	
	<div class="table-wrap">
		<div id="search-result">
			<table id="resultList" class="table table-hover">
				<tr>
					<th>상품번호</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>재고</th>
					<th>원가격</th>
				</tr>
			</table>
		</div>
	</div>
	
<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
</body>
</html>