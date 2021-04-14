<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰게시판 디테일</title>
	</head>
	<body>
		<h2>리뷰 디테일</h2>
		<hr>
		<!-- 현재 여기에는 VO가 넘어와서 이 것을 가지고 처리를 해야한다. -->
		리뷰 번호 : ${review.review_no}<br>
		리뷰 제목 : ${review.review_title }<br>
		리뷰 내용 : ${review.review_content}<br>
		리뷰 조회수 : ${review.review_hit }<br>
		리뷰 date : ${review.review_update }<br>
		<c:choose>
			<c:when test="${review.review_fname eq 'notExist'}">
				<p>리뷰로 등록된 사진 없음</p>
			</c:when>
			<c:otherwise>
				<p>등록 사진</p>
				<img alt="" src="/img/${review.review_fname}"><br>
			</c:otherwise>
		</c:choose>
		<hr>
		<a href="/reviewList">리뷰리스트로 돌아가기</a> <br>
		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="/deleteReview/${review.review_no}">삭제하기</a>
		<a onclick="return confirm('리뷰를 수정하시겠습니까?')" href="/updateReview/${review.review_no}">수정하기</a>
	</body>
</html>