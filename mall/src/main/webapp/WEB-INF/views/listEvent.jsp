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
	
    <link rel="stylesheet" href="static/css/listEventStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

</head>
<body>
	<div id="list">
		<div class="list-title">
			<h4>진행중인 이벤트</h4>
		</div>
		
		<div class="list-wrap">
			<c:forEach var="e" items="${eventList }">
				<div class="list-event-box">
					<a href="events/${e.event_no }"><img class="list-event-image" src="img/${e.event_img}"></a>
				</div>
			</c:forEach>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>