<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="../menubar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400&amp;subset=korean" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/02a1ffc4ee.js" crossorigin="anonymous"></script>
    <style type="text/css">
    	.error-alert { width: 1100px; position:relative; text-align:center; margin: auto; 
    					margin-top: 200px; margin-bottom: 200px; font-family:'Noto Sans KR', sans-serif;}
    	.error-alert .warning {width:100%; font-size: 150px; color: #ede7e3; margin-bottom: 20px;}
    	.error-alert .msg {width:100%; font-size: 18px; margin-bottom: 10px;}
    	.error-alert .link {width:100%; text-align:center; font-size: 16px;}
    	.error-alert a {text-decoration: none; color: #26a69a}
    	.error-alert a:hover {text-decoration: none; color: #ffa62b}
    </style>
<title>Insert title here</title>
</head>
<body>
	<div class="error-alert">
		<div class="warning">
			<i class="fas fa-exclamation-circle"></i><br>
		</div>
		<div class="msg">
			<span>해당 페이지를 찾을 수 없습니다.</span>
		</div>
		<div class="link">
			<a href="/">메인페이지로 돌아가기</a>	
		</div>
	</div>

<%@ include file="../footer.jsp"%>	
</body>
</html>