<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 변경</h2>
	<hr>
<form action="resetPassword.do" method="post">
	<input type="password" name="currPassword" id="currPassword" placeholder="현재 비밀번호"/><br>
	
	<input type="password" id="newPassword" name="newPassword" placeholder="새 비밀번호"/><br>
	<input type="password" id="newChkPassword" name="newChkPassword" placeholder="새 비밀번호 확인"/><br>
	<font id="chkpwd" size="2"></font>
	
	<input type="submit" name="changeSubmit" id="changeSubmit">
	<input type="reset" value="취소" />
</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/static/js/resetPassword.js"></script>


</body>
</html>