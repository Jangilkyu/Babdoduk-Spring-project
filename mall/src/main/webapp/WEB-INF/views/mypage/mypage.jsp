<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!doctype html>
<html lang="en">
  <head>
    <title>[밥도둑] 마이페이지</title>
    
    <!-- css -->
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/mypage.css">
	    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<!--  css -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
  </head>
<body>
<div class="wrap">
      <div id="grid">
          <!-- 이메일 및 휴대전화 변경 -->
           <div>
	           <h2 class="mypage-h2">이메일 및 휴대전화변경</h2>
	            <p class="context">
	               밥도둑에 이메일 및 핸드폰번호를 변경할 수 있습니다.
	            </p>  
	           <div class="phem-info-content">
	               <p>이메일 : ${email} </p>
	               <p>휴대전화 : ${maskPhone }</p>
	           </div>
			   <a class="waves-effect waves-light btn" href="/mypage/userInfoUpdate">이메일/휴대전화 변경</a>
            </div>
           <!-- 배송지 관리 -->
            <div>
            <h2 class="mypage-h2">배송지 관리</h2>
            <p class="context">
               내가 저장한 배송지 및 최근 사용한 배송지를
               관리할 수 있습니다.
            </p>            
            <a class="waves-effect waves-light btn" href="/mypage/updateShipping">배송지 관리</a>
            </div>
            <!-- 
            <div>
            <h2 class="mypage-h2">주문정보 확인</h2>
            <p class="context">
                내가 결제한 구매 내역을 확인 할 수 있습니다.
            </p>
            <a class="waves-effect waves-light btn" href="/mypage/orderList">주문정보 확인</a>
            </div>
             -->
            <div>
            <h2 class="mypage-h2">내가 한 문의 확인</h2>
            <p class="context">
                내가 문의한 내역에 대한 정보를 확인할 수 있습니다.
            </p>
           	 <a class="waves-effect waves-light btn" href="/inquiry/myInquiry">내가 한 문의 확인</a>
            </div>
            
            <div>
            <h2 class="mypage-h2">비밀번호 변경</h2>
            <p class="context">
                주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.
            </p>
            <a class="waves-effect waves-light btn" href="/mypage/resetPassword">비밀번호 변경</a>
            </div>          
            <div>
            <h2 class="mypage-h2">회원 탈퇴</h2>
            <p class="context">밥도둑을 더 이상 이용하지 않는다면
            </p>
            <a class="waves-effect waves-light btn" href="/mypage/deleteAccount">회원탈퇴</a>
            </div>
    </div>
</div>   
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <%@ include file="../footer.jsp" %>
  </body>
</html>