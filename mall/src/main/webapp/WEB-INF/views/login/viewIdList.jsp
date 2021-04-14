<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="viewIdList.css">

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <!-- css  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/viewIdList.css">
	<link rel="stylesheet" href="findId.css">
	
</head>
<body>
   <div class="find-id-wrap">
        <h4 class="find-id-title">아이디 찾기</h4>
        <p class="context">고객님의 정보와 일치하는 아이디 목록입니다.</p>
        <div class="view-id-container id-text">
            ${mem_id}
        </div>
        <div class="find-id-btn">
            <a class="waves-effect waves-light btn-small" href="/login/userLogin"><i class="material-icons left">favorite</i>로그인하기</a>
            <a class="waves-effect waves-light btn-small" href="/login/pwdInquiry"><i class="material-icons left">mood</i>비밀번호 찾기</a>
        </div>
    </div>    
    <%@ include file="../footer.jsp" %>
</body>
</html>