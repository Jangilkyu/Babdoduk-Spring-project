<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/static/css/myPage/notice.css">
<link rel="stylesheet" href="/static/css/myPage/wrap.css">
</head>
<body>
	<div class="wrap">
		<h2>글 수정</h2>
		<hr>
		<form action="updateNotice.do" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<input type="hidden" name="notice_no" value="${n.notice_no }">

				<div class="row">
					<div class="input-field col s2">
						<i class="material-icons prefix">account_box</i> <label
							for="notice_manager">글쓴이</label> <input id="notice_manager"
							type="text" name="notice_manager" value="${n.notice_manager }">
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<i class="material-icons prefix">title</i> <label
							for="notice_title">글제목</label> <input id="notice_title"
							type="text" name="notice_title" value="${n.notice_title }">
					</div>
				</div>

				<div class="row">
					<div class="input-field col s10">
						<i class="material-icons prefix">mode_edit</i>
						<textarea id="icon_prefix2" rows="30" class="materialize-textarea"
							name="notice_content">${n.notice_content }</textarea>
						<label for="icon_prefix2">글내용</label>
					</div>
				</div>


				<div class="row">
					<button class="btn waves-effect waves-light" type="submit"
						name="action">수정</button>
					<button class="btn waves-effect waves-light" type="reset"
						name="reset">취소</button>
					<button class="btn waves-effect waves-light" type="button"
						name="list" onclick="location.href='listNotice.do' ">목록보기</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>









