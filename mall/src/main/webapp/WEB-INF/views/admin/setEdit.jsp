<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/css/admin/listStyle.css">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-body-wrapper">
		<div class="list-wrap">
			<div class="list-title">
				<h3>세트 목록</h3>
			</div>
		
			<div class="table-container">
				<div class="table-wrap">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>세트번호</th>
							<th>세트명</th>
							<th>구성품</th>
							<th>가격</th>
							<th>재고</th>
							<th>메인이미지</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>

					<c:forEach var="s" items="${setList }">
						<tr>
							<td id="${s.set_no }">${s.set_no }</td>
							<td>${s.set_title }</td>
							<td>
								<c:forEach var="c" items="${compList }">
									<c:if test="${s.set_no == c.component.set_no }">
										<span>${c.product.product_title }<br></span>
									</c:if>
								</c:forEach>
							</td>
							<td>${s.set_price }</td>
							<td>${s.set_stock }</td>
							<td><img src="/img/${s.set_img }" style="width: 90px; height: 45px; object-fit: cover;"></td>
							<td><i class="fas fa-edit" id="edit-icon" onclick="location.href='/admin/set-edit/${s.set_no }'"></i></td>
							<td><i class="fas fa-trash-alt" id="delete-icon" onclick="deleteConfirm('${s.set_no }','${s.set_title }')"></i></td>
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
		let deleteConfirm = confirm(no +'번 세트 : ' + title + ' 삭제합니다');
		if(deleteConfirm){
			location.href = '/admin/set-edit/delete?no=' + no;
		}
	}
</script>
</body>
</html>