<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>review작성</title>
	</head>
	<body>
		<h2>리뷰 작성</h2>
		<hr>
		<form action="reviewWrite" method="post" enctype="multipart/form-data">
			리뷰할 상품명 : ${product.product_title}<br>
			리뷰할 상품 번호 : ${product.product_no}<br>
			<!-- hidden으로 상품명 넘겨주기 -->
			<input type="hidden" name="product_title" value="${product.product_title}">
			<!-- hidden으로 상품 번호 넘겨주기 -->
			<input type="hidden" name="product_no" value="${product.product_no}">
			리뷰 제목 : <input type="text" name="review_title" placeholder="리뷰 제목을 적어주세요."><Br>
			리뷰 내용 : <br>
			<textarea rows="7" cols="30" placeholder="리뷰할 내용을 적어주세요." name="review_content"></textarea><br>
			리뷰에 추가할 상품 사진 : <input type="file" name="uploadFile"><br>
			<hr>
			<input type="submit" value="리뷰 입력" id="reviewWriteBtn">
			<input type="reset" value="다시 입력">
		</form>
		
		<!-- jquery -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>