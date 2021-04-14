<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	html{height: 100%;}
	body {height:100%; background-color: #EDE7E3;}
	#body-wrapper{height:100%; width:100%; display: flex; align-items: center; justify-content: center;}
	.form-control:focus {
 		 border-color: #ffa62b;
 		 box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px #ffa62b;
	}
</style>
<title>관리자 페이지</title>
</head>
<body>
<div id="body-wrapper">
	<form id="admin-login" method="post">
		<div class="form-group" style="width:300px;">
			<label>관리자 비밀번호를 입력하세요</label>
			<input type="password" class="form-control" id="inputPwd" name="inputPwd" placeholder="암호">
		</div>
	</form>
</div>
</body>
</html>