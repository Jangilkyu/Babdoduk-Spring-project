<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰게시판 업데이트</title>
	</head>
	<body>
		<h2>업데이트</h2>
		<hr>
		<form action="/updateReview" method="POST" enctype="multipart/form-data">
			<!-- hidden으로 수정할 값 이외 값들 넘겨주기 -->
			<input type="hidden" name="review_no" value="${review.review_no }">
			<input type="hidden" name="review_fname" value="${review.review_fname}">
			리뷰 제목 : <input type="text" name="review_title" value="${review.review_title}"><Br>
			리뷰 내용 : <br>
			<textarea rows="7" cols="30" name="review_content">${review.review_content}</textarea><br>
			
			리뷰 사진 수정 : <input type="file" name="uploadFile"><br>
			<hr>
			<c:choose>
				<c:when test="${review.review_fname eq 'notExist' }">
					<p>등록된 사진 없음</p>
				</c:when>
				<c:otherwise>
					현재 등록 된 사진 : <br>
					<img alt="" src="/img/${review.review_fname}">
				</c:otherwise>
			</c:choose>
			<hr>
			<input type="submit" value="리뷰 수정">
			<input type="reset" value="다시 입력">
		</form>
	</body>
</html>