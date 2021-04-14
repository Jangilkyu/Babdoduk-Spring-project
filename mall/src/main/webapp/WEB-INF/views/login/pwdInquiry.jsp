<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <link rel="stylesheet" href="pwInquiry.css">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
 
    <!-- icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    
    <!-- css -->
    <link rel="stylesheet" href="/static/css/myPage/pwdInquiry.css">
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
    
    
</head>
<body>
<div class="wrap">
   <form action="/login/pwdInquiry" method="POST">
       <div id ="pwInquiry-container">
        <h2 class="pwd-title">비밀번호 찾기</h2>
         <p class="context">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
          <div class="row">
            <div class="input-field col s10">
              <input id="mem_id" type="text" class="validate" name="mem_id">
              <label for="disabled">아이디 입력</label>
            </div>
          </div> 
          <div class="pwd-btn"> 
			  <button class="btn waves-effect waves-light" type="submit" name="action" id="btnNext">다음
			    <i class="material-icons right">send</i>
			  </button>
          </div>
       </div>
   </form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>