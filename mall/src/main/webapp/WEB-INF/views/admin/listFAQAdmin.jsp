<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>

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
<link rel="stylesheet" href="/static/css/myPage/faqList.css">
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
				<li class="active" class="waves-effect"><a
					href="listFAQ.do?pageNUM=${i }">${i }</a></li>
			</c:forEach>
		</ul>


		<div class="row">
			<button class="btn waves-effect waves-light" type="button"
				name="insert" onclick="location.href='insertFAQ.do' ">글쓰기</button>
		</div>
	</div>

</body>
</body>
</html>








