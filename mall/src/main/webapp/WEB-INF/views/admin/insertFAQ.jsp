<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/static/css/myPage/wrap.css">
</head>
<body>
	<div class="wrap">
		<h2>FAQ 글 쓰기</h2>
		<hr>
		<form action="insertFAQ.do" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<input type="hidden" name="no" value="${faq_no }">

				<div class="row">
					<div class="input-field col s2">
						<i class="material-icons prefix">account_box</i> <input
							id="faq_manager" name="faq_manager" type="text" class="validate">
						<label for="faq_manager">작성자</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s5">
						<i class="material-icons prefix">title</i> <input id="faq_title"
							name="faq_title" type="text" class="validate"> <label
							for="faq_title">글제목</label>
					</div>
				</div>


				<div class="row">
					<div class="input-field col s10">
						<i class="material-icons prefix">mode_edit</i>
						<textarea id="icon_prefix2" rows="30" class="materialize-textarea"
							id="faq_content" name="faq_content" placeholder="내용을 입력해 주세요."></textarea>
						<label for="icon_prefix2">글내용</label>
					</div>
				</div>

				<div class="row">
					<button class="btn waves-effect waves-light" type="submit"
						name="action">등록</button>
					<button class="btn waves-effect waves-light" type="reset"
						name="reset">취소</button>
					<button class="btn waves-effect waves-light" type="reset"
						name="list" onclick="location.href='listFAQ.do' ">목록보기</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>

