<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
 
    <!-- icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <!-- css -->
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/viewInputPasswd.css">
    
</head>
<body>
<div id ="viewPwdAuth-container">
   <form action="/login/viewInputProPwd" method="POST">
   	  <input type="hidden" name="mem_id" value="${mem_id }">
      <h2 class="pwd-title">비밀번호 재설정</h2>
      <p class="context">비밀번호를 변경해 주세요.<br>다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.</p>
      <div class="row">
        <div class="input-field col s12">
          <input type="password" name="currPwd" id="currPwd" class="validate">
          <label for="password">새 비밀번호</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input type="password" name="newPwd" id="newPwd" class="validate">
          <label for="password">새 비밀번호 확인</label>
        </div>
      </div>
      <div class="send-btn">
		  <button class="btn waves-effect waves-light" id="nextBtn" type="submit" name="action">다음
		    <i class="material-icons right">send</i>
		  </button>
      </div>
   </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="/static/js/viewInputPasswd.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>