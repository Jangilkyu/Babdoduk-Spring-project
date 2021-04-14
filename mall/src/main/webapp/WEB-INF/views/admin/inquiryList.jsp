<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../admin/adminSideMenu.jsp"%>
<%@ include file="../admin/adminToolbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link rel="stylesheet" href="/static/css/myPage/myInquiry.css">
    <!-- css -->
	<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css'/>
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="/static/css/myPage/inquiryList.css">
	<link rel="stylesheet" href="/static/css/admin/adminBodyStyle.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	
</head>
<body>
	<div class="admin-body-wrapper">
	<div class="body-container">
	
	<div class="wrap">
		<h2>반찬가게 CS문의</h2>	
			<hr>
			<table class="highlight">
				<thead>
					<tr>
						<th>문의번호</th>
						<th>문의제목</th>
						<th>분류</th>
						<th>소분류</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변처리</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="l" items="${list }">
							<tr>
								<td>${l.cs_no }</td>
								<td id="cs_title"><a href="inquiryDetail.do?cs_no=${l.cs_no }">${l.cs_title }</a></td>
								<td>[${l.cs_category_one }]</td>
								<td>[${l.cs_category_two }]</td>
								<td>${l.cs_mem_id }</td>		
								<td>${l.cs_regdate }</td>
								<td id="cs_response" >${l.cs_response }</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty list}">
				<h4 id="none_list">아직 작성 된 문의가 없거나 검색결과가 일치하지 않습니다. :( </h4>
			</c:if>	
			
		    <form action="inquiryList" onsubmit="return inqValid();">
		      <div class="iq-List-wrap">
		        <div id="select-container">
		          <div class="input-field">
						  <select class="browser-default" id="searchFeild" name="searchFeild" >
			    				<option value="" disabled selected>선택</option>
								<option value="cs_title">제목</option>
								<option value="cs_mem_id">작성자</option>
			 			 </select>
		          </div>
		        </div>
		        <div id="input-container">			
		              <input type="hidden" name="pageNUM" value="1" >
		              <div class="row">
		                <div class="input-field col s10">
		                  <input type="text" name="keyword" id="keyword" class="validate">
		                  <label for="disabled">검색</label>
		                </div>
		              </div>
		        </div>
		        <div id="btn-container">
		          <button class="btn waves-effect waves-light" id="btnSearch" type="submit" name="action">검색
		            <i class="material-icons right">send</i>
		          </button>
		        </div>
		      </div>
		    </form>  
			
<%-- 			
			<c:forEach var="i" begin="1" end="${totalPage }">
				<a href="inquiryList.do?pageNUM=${i }">${i }</a>
			</c:forEach> --%>
		    <!-- Pagination  -->
		    <div class="pagination-wrap">
				<ul class="pagination" id="page">
				    <c:forEach var="i" begin="1" end="${totalPage }">
				    	<li  class="waves-effect"><a href="inquiryList?pageNUM=${i }&keyword=${keyword}&searchFeild=${searchFeild}">${i }</a></li>
				    </c:forEach>
				</ul>
		    </div>
			
	</div>
	
	</div>
	</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script type="text/javascript" src="/static/js/inquiryList.js"></script>
</body>
</html>