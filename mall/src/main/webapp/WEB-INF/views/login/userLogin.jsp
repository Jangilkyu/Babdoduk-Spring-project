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
	
	    <!-- Compiled and minified JavaScript -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	    
	    <!-- icon -->
	    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	    <link rel="stylesheet" href="/static/css/myPage/login.css">
	    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
		<link rel="stylesheet" href="css/detailProductsStyle.css">
	
	    <link rel="stylesheet" href="login.css">
</head>
	<body>
	<div class="wrap">
	     <!-- 아이디 -->
	    <form action="/login/userLogin" method="post"  class="col s10">
	    <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
	    
	    <div class="login-container">
	         <div class="login-background">
	          <div class="row">
	           <!-- 아이디 -->
	            <div class="input-field col s10">
	              <i class="material-icons prefix">account_box</i>
	              <input type="text" id="mem_id" name="mem_id" type="text" class="validate">
	              <label for="first_name">아이디</label>
	            </div><!--input-->
	          </div><!--row-->
	          
	          <!-- 비밀번호 -->   
	          <div class="row">
	            <div class="input-field col s10">
	                <i class="material-icons prefix">enhanced_encryption</i>
	              <input id="mem_pwd" name="mem_pwd" type="password"  class="validate">
	              <label for="password">Password</label>
	            </div><!--input-->
	          </div><!--비밀번호-->  
	        <!--로그인 제출 버튼--> 
	        <a href="/login/idInquiry">아이디 찾기</a> | <a href="/login/pwdInquiry">비밀번호 찾기</a>
	        <div class="login-btn">   
	            <button class="btn waves-effect waves-light" type="submit" name="action">로그인
	                <i class="material-icons right">send</i>
	            </button><!--button-->
	        </div>    
	        </div><!--login-container-->       
	    </div><!--login-container--> 
	    </form><!--form-->   
	    </div>
	    	<%@ include file="../footer.jsp" %>
</body>
</html>