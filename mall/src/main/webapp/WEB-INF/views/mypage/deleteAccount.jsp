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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- css -->
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/deleteAccount.css">
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
	
	<link rel="stylesheet" href="delete.css">
</head>
<body>
<div class="wrap del-container">
<h2>탈퇴 안내</h2>
회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.

<div class="delete-wrap">
사용하고 계신 <span class="del-text">아이디(${mVo.mem_id })</span>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>
</div>
<div class="delete-wrap">
<span class="del-text">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</span>
회원정보 및 주문정보, 리뷰 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br>
</div>

<div class="delete-wrap">
<span class="del-text">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</span><br>
리뷰게시판,1:1게시판 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
</div>

<form action="deleteAccount" method="post" id="deleteForm">

<div class="delete-wrap">
탈퇴 후에는 아이디 (<span class="del-text">아이디(${mVo.mem_id })</span>)에 데이터는 복구할 수 없습니다.
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
</div>
<div class="row">
    <p>
      <label>
        <input type="checkbox" id="deleteVaild"/>
        <span>안내 사항을 모두 확인하였으며, 이에 동의합니다.</span>
      </label>
    </p>
<div class="del-btn">
	<div class="row">
		<a class="waves-effect waves-light btn-large" id="deleteCheck"><i class="material-icons left">delete</i>탈퇴하기</a>
	</div>
    <input type="checkbox" id="deleteVaild" > <label for="deleteVaild"></label>
</div>
</div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="/static/js/deleteAccount.js"></script>
<script>
/*
	$("#deleteCheck").on('click',function(){
	    if(!$("#deleteVaild").is(":checked")){
	    	alert("탈퇴를 하려면 동의하기를 누르셔야합니다.");
	    }else{
	    	$("#deleteForm").submit();
	    }
	});
*/
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>