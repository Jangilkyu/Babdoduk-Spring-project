<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>탈퇴 안내</h2>
회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
<hr>
<br>
사용하고 계신 <strong>아이디(${mVo.mem_id })</strong>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>

<strong>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</strong>
회원정보 및 주문정보, 리뷰 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br>

<hr>

<strong>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</strong><br>
리뷰게시판,1:1게시판 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.
탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.

<hr>

<form action="deleteAccount.do" method="post">
탈퇴 후에는 아이디 (${mVo.mem_id }) 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>
<input type="checkbox" id="deleteVaild"> <label for="deleteVaild"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
	<input type="submit" value="확인" id="deleteCheck" checked > 
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	$("#deleteCheck").on('click',function(){
		let chk = $(this).is(":checked");
		aelrt(chk);
	});

</script>

</body>
</html>