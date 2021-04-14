<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글 삭제</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link rel="stylesheet" href="/static/css/myPage/myInquiry.css">
<!-- css -->
<link rel="stylesheet" href="/static/css/myPage/wrap.css">
<link rel="stylesheet" href="/static/css/myPage/faqList.css">
</head>
<body>
	<div class="wrap">
		<h2>글 삭제</h2>
		<hr>
		<form action="deleteFAQ.do" method="post">
			<input type="hidden" name="no" value="${no }">
			<button class="btn waves-effect waves-light" type="submit"
				name="action">삭제</button>
			<button class="btn waves-effect waves-light" type="reset"
				name="reset">취소</button>
			<button class="btn waves-effect waves-light" type="button"
				name="list" onclick="location.href='listFAQ.do' ">목록보기</button>
		</form>
	</div>
</body>
</html>









