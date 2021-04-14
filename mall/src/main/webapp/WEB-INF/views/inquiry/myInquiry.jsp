<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<%@ include file="../menubar.jsp" %>
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
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">
    	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
</head>
<body>

<div class="wrap">
	<h2>내가 문의한 목록</h2>
	<hr>
      <table class="highlight">
        <thead>
          <tr>
              <th>문의 번호</th>
              <th>문의 제목</th>
              <th>문의 유형</th>
              <th>문의 일자</th>
              <th>답변 여부</th>
          </tr>
        </thead>

        <tbody>
				<c:forEach var="l" items="${list }">
        	<tr>
					<td>${l.cs_no }</td>
					<td id="cs_title"><a href="myInqDetail/${l.cs_no }">${l.cs_title }</a></td>
					<td>[${l.cs_category_two }]</td>
					<td>${l.cs_regdate }</td>
					<td>${l.cs_response }</td>
			</tr>
				</c:forEach>
        </tbody>
      </table>
      
	  <!-- search -->	
	  <form action="myInquiry" onsubmit="return inqValid();">
	      <div class="iq-List-wrap">
	        <div id="select-container">
	          <div class="input-field">
					  <select class="browser-default" id="searchFeild" name="searchFeild" >
		    				<option value="" disabled selected>선택</option>
							<option value="cs_title">제목</option>
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
		
      
      <!-- Pagination  -->
	  <ul class="pagination" id="page">
      <c:forEach var="i" begin="1" end="${totalPage }">
      		<li class="waves-effect"><a  href="myInquiry?pageNUM=${	i }&keyword=${keyword}&searchFeild=${searchFeild}">${i }</a></li>
      </c:forEach>
	  </ul>
</div>
 		<%@ include file="../footer.jsp" %>
</body>
</html>