<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/static/css/mypageStyle.css">
</head>

<body>
    	사용자 이름 : ${mVo.mem_id }<br>
    	<hr>
    	
        <input type="hidden" name="mem_id" readonly="readonly" value="${mVo.mem_id }"><br>
        반찬 계정 이메일 : ${mVo.mem_email }
        
        <!-- 이메일 인증 -->
       	<input type="hidden" name="mem_id" value="${mVo.mem_email}">
        <button type="button" id="btn-email">수정</button>
        <div id="emailForm">
            변경할 이메일
            <input type="text" id="email" name="mem_email"><button type="button" id="btnEmailSendCode">인증</button>
			<p id="emailValidCheck"></p>
            인증번호 입력
            <input type="text" id="validInput" name="validInput"><br>
            <button type="button" id="btnEmailCheck">수정 완료</button>
            <button type="button" id="btnEmailCheckCancel">수정 취소</button>
        </div>
        
        <hr>
        <!-- 핸드폰 인증  -->
        <input type="hidden" name="mem_phone" value="${mVo.mem_phone}">
        휴대전화 : ${mVo.mem_phone }
        <button type="button" id="btn-phone">수정</button>
        <div id="phoneForm">
            변경할 휴대전화
            <input type="text" id="phone" name="phone"><button type="button" id="btnPhoneSendCode">인증</button><br>
            
            인증번호 입력
            <input type="text" id="validPhoneInput" name="validInput"><br>
            <button type="button" id="btnPhoneCheck">수정 완료</button>
            <button type="button" id="btnPhoneCheckCancel">수정 취소</button>
        </div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/static/js/emailcertification.js"></script>
<script type="text/javascript" src="/static/js/phonecertification.js"></script>
</body>
</html>