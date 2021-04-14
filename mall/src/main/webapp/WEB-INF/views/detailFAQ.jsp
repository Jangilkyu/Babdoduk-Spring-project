<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/menubar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 글 상세</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/static/css/myPage/faq.css">
<link rel="stylesheet" href="/static/css/myPage/wrap.css">
</head>
<body>
	<div class="row wrap">
		<h2>글 상세</h2>
		<hr>
		<div class="row">

			<div class="row">
				<div class="input-field col s2">
					<i class="material-icons prefix">looks_one</i> <label
						for="dis_cs_no">글번호: ${f.faq_no }<br></label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">title</i> <label for="faq_title">글제목
						: ${f.faq_title }<br>
					</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s10">
					<i class="material-icons prefix">mode_edit</i>
					<textarea id="icon_prefix2" rows="30" cols="80"
						class="materialize-textarea" readonly="readonly">${f.faq_content }</textarea>
					<label for="faq_content">글 내용</label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">mood</i> <label for="faq_hit">글
						조회수 : ${f.faq_hit }<br>
					</label>
				</div>
			</div>


			<div class="row">
				<div class="input-field col s6">
					<i class="material-icons prefix">account_box</i> <label
						for="faq_manager">글쓴이 : ${f.faq_manager }<br></label>
				</div>
			</div>

			<hr>

			<!-- 전송 하기 버튼 -->
			<div class="row">
				<a class="btn waves-effect waves-light" id="btnsend" href="listFAQ.do">목록보기
				<i class="material-icons right">send</i></a>

			</div>

		</div>
	</div>
	
<%@ include file="footer.jsp"%>	
</body>
</html>







