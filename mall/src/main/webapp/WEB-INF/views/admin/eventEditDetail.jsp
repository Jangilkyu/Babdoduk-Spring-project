<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="adminSideMenu.jsp"%>
<%@ include file="adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/admin/eventStyle.css">
<title>이벤트 등록 페이지</title>
</head>
<body>
<div class="admin-body-wrapper">
	<div class="register-wrap">
		<div class = "register-title">
			<h3>이벤트 등록</h3>
		</div>
		
		<div class="container">
		<div class="register-form">

			<form class="form-inline" id="event-edit" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group">
						<label for="event_no" class="inputtag">이벤트 번호</label>
						<input type="text" class="form-control inputbox" id="event_no" name="event_no" value="${event.event_no }" readonly>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="event_title" class="inputtag">이벤트명</label>
						<input type="text" class="form-control inputbox" id="event_title" name="event_title" value="${event.event_title }">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="event_link" class="inputtag">배너 링크</label>
						<input type="text" class="form-control inputbox" id="event_link" name="event_link" value="${event.event_link }">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="event_content" class="inputtag">상세설명</label>
						<textarea cols="100" rows="6" class="form-control inputbox" name="event_content" id="event_content" style="width: 900px; resize: none;">${event.event_content }</textarea>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="startDate" class="inputtag">시작일</label>
						<input type="date" class="form-control inputbox" value="2021-01-01" min="2021-01-01" max="2100-01-01" id="startDate" name="startDate">
					</div>
					<div class="form-group">
						<label for="startTime" class="sr-only"></label>
						<input type="time" class="form-control inputbox" value="00:00" id="startTime" name="startTime">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="endDate" class="inputtag">종료일</label>
						<input type="date" class="form-control inputbox" value="2021-01-01" min="2021-01-01" max="2100-01-01" id="endDate" name="endDate">
					</div>
					<div class="form-group">
						<label for="endTime" class="sr-only"></label>
						<input type="time" class="form-control inputbox" value="00:00" id="endTime" name="endTime">
					</div>
				</div>
				<div class="form-row">
					<div class="form-group">
						<label for="event_img" class="sr_only"></label>
						<input type="hidden" name="event_img" class="event_img" value="${event.event_img }">
						<label for="mainImgFile" class="inputtag">메인이미지</label>
						<input type="file" class="form-control inputbox" id="imgFile" name="imgFile" onchange="setImg(event, 'img');" style="width: 545px;">
						<img src="/img/${event.event_img }" id="img" onerror="this.src='/img/empty.png'" class="img-thumbnail-box">
					</div>							
				</div>
				<div class="form-row">
					<div class="button-group" id="register-button-group">
						<button type="button" class="button submit" id="event-register-submit">등록</button>
						<button type="button" class="button cancel" id="event_edit_cancel" onclick="location.href='/admin/event-edit'">취소</button>
					</div>
				</div>
			</form>
		</div>
		</div>
		
	</div>
</div>
<script type="text/javascript">
	let date = '${event.event_start }';
	let fDate = "${event.event_end }";
	
	let startDate = date.slice(0, 10);
	let startTime = date.slice(11, 16);
	let endDate = fDate.slice(0, 10);
	let endTime = fDate.slice(11, 16);
	
	document.getElementById('startDate').value = startDate;
	document.getElementById('startDate').min = startDate;
	document.getElementById('startTime').value = startTime;
	
	document.getElementById('endDate').value = endDate;
	document.getElementById('endDate').min = startDate;
	document.getElementById('endTime').value = endTime;
	
	let eventNo = document.getElementById('event_no').value;
	let ajaxUrl = '/admin/event-edit/' + eventNo;
	
	$('#event-register-submit').click(function(){
	
		let updateData = new FormData(document.getElementById('event-edit'));	
		$.ajax({
			url:ajaxUrl,
			data:updateData,
			type:'post',
			processData:false,
			contentType:false,
			success:function(){
				alert("이벤트 정보 수정에 성공하였습니다.");
			}
		});
	});
</script>
<script type="text/javascript" src="/static/js/admin/adminFuntions.js"></script>
</body>
</html>