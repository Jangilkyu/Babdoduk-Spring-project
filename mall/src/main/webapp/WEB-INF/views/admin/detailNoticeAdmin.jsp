<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 상세</title>
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


	<div class="row wrap">
		<h2>글 상세</h2>
		<hr>
		<div class="row" id="detailNotice">

			<div class="row">
				<div class="input-field col s2">
					<i class="material-icons prefix">looks_one</i> <label
						for="notice_no">글번호: ${n.notice_no }<br></label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">title</i> <label
						for="notice_title">글제목: ${n.notice_title }<br></label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">mode_edit</i> <label
						for="notice_content">글 내용</label>
					<textarea id="icon_prefix2" rows="30" cols="80"
						class="materialize-textarea" readonly="readonly">${n.notice_content }</textarea>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">mood</i> <label for="notice_hit">글
						조회수: ${n.notice_hit }<br>
					</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">account_box</i> <label
						for="notice_manager">글쓴이 : ${n.notice_manager }<br></label>
				</div>
			</div>

			<hr>

			<!-- 전송 하기 버튼 -->
			<div class="row">
				<a class="waves-effect waves-light btn" id="btnsend"
					href="updateNotice.do?no=${n.notice_no }">수정</a> <a
					class="waves-effect waves-light btn" id="btnsend"
					href="deleteNotice.do?no=${n.notice_no }">삭제</a> <a
					class="waves-effect waves-light btn" id="btnsend"
					href="listNotice.do">목록보기</a>

			</div>

		</div>
	</div>
</body>
</html>








