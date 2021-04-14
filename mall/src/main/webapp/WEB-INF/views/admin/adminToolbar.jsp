<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/admin/adminStyle.css">
</head>
<body>
	<div id="toolbar" class="toolbar">
		<div class="message">
		</div>
		<div class="logout">
			<i class="fas fa-sign-out-alt" id="logout-btn" onclick="adminLogout();"></i>
		</div>
	</div>
</body>
<script type="text/javascript">
	function adminLogout(){
		if(confirm('관리자 로그아웃 후 밥도둑 메인으로 이동합니다')){
			location.href = '/';
		}
	}
</script>
</html>