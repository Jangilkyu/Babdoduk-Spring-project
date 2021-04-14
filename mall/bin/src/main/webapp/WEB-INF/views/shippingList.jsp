<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="" method="post">
        <!-- 우편번호  -->
        우편번호 : <input type="text" name="mem_zipcode" id="mem_zipcode" value="${mVo.mem_zipcode }">
        주소 : <input type="text" name="mem_address" id="mem_address" value="${mVo.mem_address }">
        상세주소 : <input type="text" name="mem_detailaddress" id="mem_detailaddress" value="${mVo.mem_detailaddress }">
        <input type="button"  class="form-control btn-alert btn-primary" value="우편번호 찾기" onclick="PostCode()">
        <br>
        
        <!-- 제출 -->
        <input type="submit" value="제출">
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!---------------- 우편번호 ---------------->
	<script>
	function PostCode(){
		daum.postcode.load(function (data) {
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	//주소 변수
		        	let = '';
		        	//클라이언트가 도로명 주소를 클릭 했을 경우
		        	if(data.userSelectedType === 'R'){
		        		addr = data.roadAddress;
		        	}
		        	else {
		        		//지번 주소 클릭했을 경우
		        		addr = data.jibunAddress;
		        	}
					document.getElementById("mem_zipcode").value = data.zonecode;
					document.getElementById("mem_address").value = addr;
		        }
		    }).open();
		});
	}
	</script>
</body>
</html>