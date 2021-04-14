<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<%@ include file="menubar.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>listEvents</title>
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/listEventStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<div id="list">
		<div class="list-title">
			<h4>이벤트 안내</h4>
		</div>
		
		<div class="event-title">
			<span>${event.event_title }</span>
		</div>
		<div class="event-period">
			<span>이벤트 기간 : ${event.event_start } - ${event.event_end }</span>
		</div>
		<div class="event-content">
			<img class="event-image" src="${pageContext.request.contextPath}/img/${event.event_img}">
			<span>${event.event_content }</span><br>
			<a href="${event.event_link }"><span>관련 페이지 바로가기</span></a>
		</div>
		
		<div class="list-title">
			<h4>진행중인 이벤트</h4>
		</div>
		<div class="list-wrap">
			<c:forEach var="e" items="${eventList }">
				<c:if test="${e.event_no != event.event_no }">
					<div class="list-event-box">
					<a href="${e.event_no }"><img class="list-event-image" src="${pageContext.request.contextPath}/img/${e.event_img}"></a>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>