<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[밥도둑] 배송지 변경</title>
   	<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- css  -->
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <link rel="stylesheet" href="/static/css/myPage/updateShipping.css">
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
    
    
</head>
<body>

<div class="wrap">
	  <h4>현재주소</h4>
	  <div id="curr-ship-div">
		<br>
		<div class="row">
			<!-- 현재 우편번호 -->
	        <div class="input-field col s3">
	          <i class="material-icons prefix">home</i>
	          <input disabled value="${spVo.mem_zipcode }" id="disabled" type="text" class="validate">
	          <label for="disabled">우편번호</label>
	        </div><!-- input-field -->
	        <!-- 현재 주소  -->
	        <div class="input-field col s3">
	          <i class="material-icons prefix">looks_one</i>
	          <input disabled value="${spVo.mem_address }" id="disabled" type="text" class="validate">
	          <label for="disabled">주소</label>
	        </div><!-- input-field -->
	        <!-- 현재 상세주소  -->
	        <div class="input-field col s6">
	          <i class="material-icons prefix">looks_two</i>
	          <input disabled value="${spVo.mem_detailaddress }" id="disabled" type="text" class="validate">
	          <label for="disabled">상세주소</label>
	        </div><!-- input-field -->
		  </div><!-- row -->
		</div><!-- curr-ship-div  -->
		
	<form action="/mypage/updateShipping" method="post" onsubmit="return Check()">
		<!-- 변경할 주소  -->
		<h4>변경할 주소</h4>
		 <div id="new-ship-div">
	        <!-- 변경 할 우편번호  -->
	        <div class="row">
		        <div class="input-field col s3">
	          <i class="material-icons prefix">home</i>
		          <input name="mem_zipcode"  id="mem_zipcode" value=" " type="text" class="validate">
		          <label for="mem_zipcode">변경할 우편번호</label>
		        </div><!-- input-field  -->
	        </div><!-- row -->
	        <!-- 변경 할 주소  -->
	        <div class="row">
		        <div class="input-field col s3">
	          	<i class="material-icons prefix">looks_one</i>
		          <input name="mem_address" id="mem_address" value=" " type="text" class="validate">
		          <label for="mem_address">변경할 주소</label>
		        </div><!-- input-field -->
	        </div><!-- row -->
	        <!-- 변경 할 상세주소  -->
	        <div class="row">
		        <div class="input-field col s6">
	        	  <i class="material-icons prefix">looks_two</i>
		          <input name="mem_detailaddress" id="mem_detailaddress" type="text" class="validate">
		          <label for="mem_detailaddress">상세주소</label>
		        </div><!-- input-field -->
	        </div><!-- row -->        
	        <div id="find-posts">
		        <!-- 우편번호 찾기 버튼  -->
		        <div class="row">
				  <a class="waves-effect waves-light btn-small" onclick="PostCode()"><i class="material-icons left">search</i>우편번호 찾기</a>
		        </div><!-- row -->
	        </div><!-- find-posts -->
	     </div><!-- new-ship-div -->
	     <div id="send-btn">
	        <!-- 우편번호 수정 버튼 -->
		   <button class="btn waves-effect waves-light" type="submit" name="sendAddr" id="sendAddr">주소 수정
		     <i class="material-icons right">send</i>
		   </button><!-- button -->
		 </div>
	</form>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="/static/js/updateShipping.js"></script>
<script src="/static/js/myposts.js"></script>
<%@ include file="../footer.jsp" %>
</body>
</html>