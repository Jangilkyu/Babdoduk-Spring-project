<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="idInquiry.css">

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<!--  css -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/idInquiry.css">

    <link rel="stylesheet" href="viewIdList.css">
    

</head>
<body>
    <div class="idInquiry-container">
        <p>
          <label>
            <input name="group1" type="radio" id="radio1" class="radio-value" value="0" checked />
            <span>회원정보에 등록한 휴대전화로 인증</span>
          </label>
        </p>
        <!-- 핸드폰 인증 -->
        <div class="phone-auth" id="phone-wrap">
            <div class="row">
                <div class="input-field col s6">
                  <input id="mem_phone_name" type="text" name="mem_phone_name" class="validate">
                  <label for="last_name">이름</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                  <input id="mem_phone" type="text" name="mem_phone" class="validate">
                  <label for="mem_name">휴대전화</label>
                </div>
                  <a class="waves-effect waves-light btn phonebtn"><i class="material-icons left">cloud</i>인증번호 전송</a>
            </div>
            <div class="row">
                <div class="input-field col s12">
                  <input disabled id="mem_phone_auth" type="text" class="validate">
                  <label for="disabled">인증번호</label>
                </div>
            </div>
            <form action="/login/viewIdList" method="POST" onsubmit="return Check()">
		        <input type="hidden" id="mem_id" name="mem_id" value="">
		  <div class="submitBtn">
    		  <button class="btn waves-effect waves-light nextBtn" type="submit" id="phoneSubmit" name="action">다음
   				 <i class="material-icons right">send</i>
 			  </button>
          </div>
 			</form>        
           </div>
        <hr>
        <p>
          <label>
            <input name="group1" type="radio" class="radio-value" value="1" />
            <span>본인확인 이메일로 인증</span>
          </label>
        </p>
			<!-- 이메일 인증-->
            <div class="email-auth">
                <div class="row">
                    <div class="input-field col s6">
                      <input id="mem_email_name" id="mem_email_name" type="text" class="validate">
                      <label for="last_name">이름</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                      <input type="text" id="mem_email" name="mem_email" class="validate">
                      <label for="last_name">이메일 주소</label>
                    </div>
                    <a class="waves-effect waves-light btn emailbtn"><i class="material-icons left">cloud</i>인증번호 전송</a>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                      <input disabled id="mem_email_auth" name="mem_email_auth" type="text" class="validate">
                      <label for="disabled">인증번호</label>
                    </div>
                </div>
	            <form action="/login/viewIdList" method="POST" onsubmit="return CheckEmail()">
			        <input type="hidden" id="mem_id2" name="mem_id" value="">
		       <div class="submitBtn">
	    		  <button class="btn waves-effect waves-light nextBtn" type="submit" id="emailSubmit" name="action">다음
	   				 <i class="material-icons right">send</i>
	 			  </button>
               </div>
	 			</form>        
            </div>
    </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="/static/js/idInquiry.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>