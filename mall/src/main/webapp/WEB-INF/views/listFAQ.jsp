<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Compiled and minified CSS -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<link rel="stylesheet" href="/static/css/myPage/faq.css">

<!-- css -->
<link rel="stylesheet" href="/static/css/myPage/wrap.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
	<div class="wrap">

		<h2>FAQ 목록</h2>
		<hr>
		<table class="highlight">
			<thead>
				<tr>
					<th>글번호</th>
					<th>글제목</th>
					<th>등록일</th>
					<th>조회수</th>
					<th>관리자</th>
				</tr>
			</thead>

			<tbody id="listFAQBody">
			</tbody>
			<c:forEach var="f" items="${list }">
				<tr>
					<td>${f.faq_no }</td>
					<td><a href="detailFAQ.do?no=${f.faq_no }">${f.faq_title }</a></td>
					<td>${f.faq_regdate }</td>
					<td>${f.faq_hit }</td>
					<td>${f.faq_manager }</td>
				</tr>
			</c:forEach>
		</table>

		<!-- Pagination  -->
		<ul class="pagination" id="page">
			<c:forEach var="i" begin="1" end="${totalPage }">
				<li class="active"><a
					href="listFAQ.do?pageNUM=${i }">${i }</a></li>
			</c:forEach>
		</ul>

		<form action="">	
			<div class="iq-List-wrap">	
				<div id="select-container">
					<div class="input-field">
						<select class="browser-default" name="searchType">
							<option value="FAQ_TITLE">제목</option>
							<option value="FAQ_CONTENT">내용</option>
							<option value="all">제목+내용</option>
						</select>
					</div> 
				</div>
				<div id="input-container">
					<input type="hidden" name="page" value="1"> 
					<div class="row">
						<div class="input-field col s10">	
							<input type="text" name="searchKeyword" id="keyword" class="validate"> 
							<label >검색</label>
						</div>
					</div>
				</div>
						
				<div id="btn-container">
					<button class="btn waves-effect waves-light" id="btnSearch" type="submit" name="action">검색
						<i class="material-icons right">send</i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<script src="/static/js/faqValidation.js"></script>
	
	<%@ include file="footer.jsp"%>

</body>
</body>
</html>








