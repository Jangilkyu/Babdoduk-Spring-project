<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/admin/listStyle.css">
<title>할인 상품 목록</title>
</head>
<body>
	
	<div class="admin-body-wrapper">
		<div class="list-wrap">
			<div class="list-title">
				<h3>이벤트 목록</h3>
			</div>
			
			<div class="table-container">
				<div class="table-wrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>글번호</td>
							<td>이벤트명</td>
							<td>시작일</td>
							<td>종료일</td>
							<td>배너</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
					</thead>
					
					<c:forEach var="e" items="${list }">
						<tr>
							<td id="${e.event_no }">${e.event_no }</td>
							<td>${e.event_title }</td>
							<td>${e.event_start }</td>
							<td>${e.event_end }</td>
							<td><img src="/img/${e.event_img }" style="width: 150px; height: 35px; object-fit: cover;"></td>
							<td><i class="fas fa-edit" id="edit-icon" onclick="location.href='/admin/event-edit/${e.event_no }'"></i></td>
							<td><i class="fas fa-trash-alt" id="delete-icon" onclick="deleteConfirm('${e.event_no}','${e.event_title}')"></i></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
<script type="text/javascript">
	function deleteConfirm(no, title){
		let deleteConfirm = confirm(no +'번 이벤트 : ' + title + ' 삭제합니다');
		if(deleteConfirm){
			location.href = '/admin/event-edit/delete?no=' + no;
		}
	}
</script>
</body>
</html>