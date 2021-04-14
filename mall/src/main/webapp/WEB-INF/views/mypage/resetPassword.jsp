<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    <!-- css -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/myPage/resetPassword.css">
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
</head>
<body>
   <div class="wrap">
   <div style="margin-left: 70px;">
    <h4>비밀번호 변경</h4>
		    <form action="/mypage/resetPassword" method="post">
			     <div class="pass-container">
			         <!-- 현재 비밀번호-->
			          <div class="row">
			            <div class="input-field col s12">
			              <i class="material-icons prefix">vpn_key</i>
			              <input id="currPassword" name="currPassword"  type="password" class="validate">
			              <label for="password">현재 비밀번호</label>
			            </div>
			          </div>
			          <!-- 새 비밀번호-->
			          <div class="row">
			            <div class="input-field col s12">
			              <i class="material-icons prefix">https</i>
			              <input id="newPassword" name="newPassword"  type="password" class="validate">
			              <label for="password">새 비밀번호</label>
			            </div>
			          </div>
			          <!-- 새 비밀번호 확인-->
			          <div class="row">
			            <div class="input-field col s12">
			              <i class="material-icons prefix">https</i>
			              <input id="newChkPassword" name="newChkPassword"  type="password" class="validate">
			              <label for="password">새 비밀번호 확인</label>
			            </div>
			          </div>
			         <font id="chkpwd" size="2"></font>
				<!-- 비밀번호 변경 버튼-->
				<div id="pwd-btn">
				  <button class="btn waves-effect waves-light" id="sendPwd" type="submit" >Submit
				    <i class="material-icons right">send</i>
				  </button>      
				    </div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="/static/js/resetPassword.js"></script> -->
<%@ include file="../footer.jsp" %>
</body>
</html>