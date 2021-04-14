<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link rel="stylesheet" href="viewPwdAuth.css">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
 
    <!-- icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <!-- css -->
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/viewPwdAuth.css">
</head>
<body>
<div id ="viewPwdAuth-container">
   <form action="/login/viewInputPasswd" method="Post" onsubmit="return CheckPwdAuth()">
   		<input type="hidden" id="mem_id" name="mem_id">
        <h2 class="pwd-title">회원정보에 등록한 휴대전화번호로 인증</h2>
         <p class="context">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</p>
         
         <!-- 비밀번호 찾을 회원 이름 -->
          <div class="row">
            <div class="input-field col s8">
              <input id="mem_name" name="mem_name" type="text" class="validate">
              <label for="mem_name">이름</label>
            </div>
          </div>
           
          <!-- 비밀번호 찾을 회원 휴대전화  -->
          <div class="row">
            <div class="input-field col s8">
                  <input id="mem_phone" name="mem_phone" type="text" class="validate">
              <label for="disabled">휴대전화</label>
            </div>
            <div class="btn-chk">
                  <a class="waves-effect waves-light btn-small" id="btnPhoneAuthNo"><i class="material-icons left">favorite</i>인증번호받기</a>
            </div>
          </div>
          
          <!-- 인증번호 -->
          <div class="row">
            <div class="input-field col s8">
              <input disabled  id="phoneAuthNo" name="phoneAuthNo" type="text" class="validate">
              <label for="phoneAuthNo">인증번호</label>
            </div>
          </div>
          <!-- 전송 버튼  -->
          <div class="send-btn">
			  <button class="btn waves-effect waves-light" type="submit" name="btnNext" id="btnNext">Submit
			    <i class="material-icons right">send</i>
			  </button>
          </div>
   </form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="/static/js/viewPwdAuth.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>