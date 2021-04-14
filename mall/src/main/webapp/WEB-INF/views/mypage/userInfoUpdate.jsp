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
	
	<!-- css  -->    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <link rel="stylesheet" href="/static/css/myPage/userInfoUpdate.css">
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
</head>

<body>

  <div class="row wrap">
	    <div class="col s12">
	      <h4>사용자 아이디</h4>
  		 <div class="user-info">
		      <!-- 사용자 이름  -->
		      <input type="hidden" name="mem_id" readonly="readonly" value="${mVo.mem_id }"><br>
		      <div class="row">
		        <div class="input-field col s10">
		          <i class="material-icons prefix">account_box</i>
		          <input disabled value="${mVo.mem_id }" id="mem_id" type="text" class="validate">
		          <label for="mem_id">사용자 이름</label>
		        </div><!-- input-field -->
				  </div>
	      </div><!-- row -->
	  <h4 class="change-title">이메일 변경</h4>
      <div class="email-container">
	      	<!-- 현재 반찬 계정 이메일  -->
	        <div class="row">
		        <div class="input-field col s10">
		          <i class="material-icons prefix">email</i>
		          <input disabled value="${mVo.mem_email }" id="mem_email" type="text" class="validate">
		          <label for="mem_email">반찬 계정 이메일</label>
		          <p>아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 또는 유료 결제 등 반찬사이트로부터 알림을 받을 때 사용할 이메일입니다.</p>
		        </div><!-- input-field -->
	        </div><!-- row -->      
	        
	        <!-- 이메일 인증 -->
	       	<input type="hidden" name="mem_id" value="${mVo.mem_email}">
	       	<div class="row">
	       	<a class="waves-effect waves-light btn" id="btn-email"><i class="material-icons left">update</i>이메일 수정</a>
	        </div><!-- row -->
	        <!-- 이메일 변경 폼  -->
	        <div id="emailForm">
	          <div class="update-div">
	       		 <!-- 변경할 이메일 -->
		        <div class="row">
					<div class="input-field col s10">
					  <i class="material-icons prefix">email</i>
			          <input id="email" type="text" class="validate" name="mem_email">
			          <label for="last_name">변결할 이메일</label>
			          <!-- 인증번호 버튼  -->
					  <div class="btn-cetifi">
				          <a class="waves-effect waves-light btn-small" id="btnEmailSendCode"><i class="material-icons left">send</i>이메일 인증 번호</a>
					  </div>
			        </div><!-- input-field -->
				</div><!-- row -->
				<!-- 인증번호 입력 -->
				<div class="row">
					<div class="input-field col s10">
					  <i class="material-icons prefix">verified_user</i>
			          <input id="inputEmail" name="validInput"type="text" class="validate">
			          <label for="last_name">인증번호 입력</label>
			        </div><!-- input-field -->			
				</div><!-- row -->		
				<!-- 수정/수정 취소 버튼  -->	
				<div class="btn-chck">
					<div class="row">
						<a class="waves-effect waves-light btn-small" id="btnEmailCheck"><i class="material-icons left">check</i>수정 완료</a>
			           <a class="waves-effect waves-light btn-small" id="btnEmailCheckCancel"><i class="material-icons left">cancel</i>수정 취소</a>
					</div>
				</div>
	         </div><!-- update-div -->
	        </div><!-- emailForm  -->
        </div>
        
        <h4 class="change-title">핸드폰 번호 수정</h4>
        <div class="phone-container">
        <!-- 현재 휴대전화 번호  -->
          <input type="hidden" name="mem_phone" value="${mVo.mem_phone}">
	      <div class="row">
	        <div class="input-field col s10">
	          <i class="material-icons prefix">local_phone</i>
	          <input disabled value="${mVo.mem_phone }" id="mem_phone" type="text" class="validate">
	          <label for="mem_id">밥도둑 핸드폰 번호</label>
		          <p>아이디, 비밀번호 찾기 등 본인확인이 필요한 경우 사용할 핸드폰 번호입니다.</p>
	        </div>
	      </div>        
	      <!-- 핸드폰 번호 수정 버튼 -->
	      <div class="row">
	       		<a class="waves-effect waves-light btn" id="btn-phone"><i class="material-icons left">update</i>핸드폰 번호 수정</a>
	      </div>	      
	      <!-- 핸드폰 번호 수정 폼 -->
         <div id="phoneForm">
         	<!-- 변경할 핸드폰 번호 ipnut창 -->
         <div class="update-div">
	        <div class="row">
				<div class="input-field col s10">
				  <i class="material-icons prefix">local_phone</i>
		          <input id="phone" name="phone" type="text" class="validate">
		          <label for="last_name">변경할 휴대전화</label>	          
				  <div class="btn-cetifi">
				          <a class="waves-effect waves-light btn-small" id="btnPhoneSendCode"><i class="material-icons left">send</i>휴대폰 번호 인증 번호</a>
				  </div><!-- btn-cetifi -->
		        </div>
			</div>         
			<!-- 인증번호 입력 -->
				<div class="row">
					<div class="input-field col s10">
					  <i class="material-icons prefix">verified_user</i>
				      <input id="validPhoneInput" name="validInput"type="text" class="validate">
				      <label for="last_name">인증번호 입력</label>
				    </div>			
				</div>	
			<!-- 수정/수정 취소 버튼  -->	
			<div class="btn-chck">
				<div class="row">
					<a class="waves-effect waves-light btn-small" id="btnPhoneCheck"><i class="material-icons left">check</i>수정 완료</a>
		           <a class="waves-effect waves-light btn-small" id="btnPhoneCheckCancel"><i class="material-icons left">cancel</i>수정 취소</a>
				</div><!-- row  -->
			</div>
		   </div>
          </div>
          </div>
         </div>
        </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/static/js/emailcertification.js"></script>
<script src="/static/js/phonecertification.js"></script>

<script>
/*
    	let code;

    	/* =============== 이메일 수정 클릭 시 visible =================*/
        $("#btn-email").click(function(){
           $("#emailForm").css("visibility",'visible'); 
        });    

    	/* =============== 이메일 수정 취소 클릭 시 visible =================*/
        $("#btnEmailCheckCancel").click(function(){
		   $("#emailForm").css("visibility",'hidden');        
        });
        
    	/* =============== 이메일 인증 =================*/
        $("#btnEmailSendCode").click(function(){
           let email = $("#email").val();
           
            if (email == '') {
            	$('#emailValidCheck').html('인증번호를 입력해주시기바랍니다.').css('color','red');
            	$('#email').val('');
            	$('#email').focus();
            }
            
            let data = {email:email};
            
            $.ajax({
                url :"/sendEmailCode.do",
                data:data
            }).done(function(data){
                code = data;
                alert("인증코드를 발송하였습니다.");
            });
            
        });
        
        /*================이메일 인증완료 후 수정완료 클릭 시 이메일 변경====================*/
        $("#btnEmailCheck").click(function(){
        
        	let userCode = $("#inputEmail").val();
        	let email = $('#email').val();
        	
        	let data = {email:email};
        
        	if(code == userCode){
        		$.ajax({
        			url : "/updateEmail.do",
        			data:data,
					type:'GET'
        		}).done(function(data){
					alert('성공적으로 이메일 변경이 완료되었습니다.');
        			$("") // jstl문법 변수처리 가능한지 확인해보기
        		}).fail(function(){
					alert("실패");
				});
        	}else{
        		alert("일치하지않습니다.");
        		$('#validInput').val('');
        	}
        });
*/

/*
   	/* =============== 핸드폰 수정 클릭 시 visible =================*/
        $("#btn-phone").click(function(){
           $("#phoneForm").css('visibility','visible'); 
        });
        
    	/* =============== 핸드폰 수정 취소 클릭 시 visible =================*/
        $("#btnPhoneCheckCancel").click(function(){
		   $("#phoneForm").css("visibility",'hidden');        
        });

    	/* =============== 핸드폰 인증 =================*/
        $("#btnPhoneSendCode").click(function(){
           let phone = $("#phone").val();
            code;
            let data = {phone:phone};
            
            $.ajax({
                url :"/sendPhoneCode.do",
                data:data
            }).done(function(data){
                code = data;
                alert("인증코드를 발송하였습니다.");
            });
        });

        /*=================== 핸드폰 인증완료 후 수정완료 클릭 시 핸드폰번호 변경====================*/
        $("#btnPhoneCheck").click(function(){
        
        	let userCode = $("#validPhoneInput").val();
        	let phone = $('#phone').val();
        	
        	let data = {phone:phone};
        
        	if(code == userCode){
        		$.ajax({
        			url : "/updatePhone.do",
        			data:data
        		}).done(function(data){
        			$("") // jstl문법 변수처리 가능한지 확인해보기
        		});
        	
        	}else{
        		alert("일치하지않습니다.");
        		$('#validInput').val('');
        	}
        });
*/
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>