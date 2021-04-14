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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/static/css/myPage/myInqDetail.css">
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="css/mainPage/footerStyle.css">
</head>
<body>

<div class="wrap">
	<h4 class="qna-info-title">문의 내용</h4>
    <div class="qna-info-container">
	  <div class="row">
	    <div class="col s12">
	      <div class="row">
	        <div class="input-field col s4">
			  <i class="material-icons prefix">thumb_up</i>
	          <input disabled value="${detailVo.cs_no }" id="cs_no" type="text" class="validate" >
	          <label for="cs_no">글번호</label>
	        </div>
	        <div class="input-field col s3">
	          <i class="material-icons prefix">account_box</i>
	          <input disabled value="${detailVo.cs_mem_id }" id="cs_mem_id" type="text" class="validate" >
	          <label for="cs_mem_id">작성 아이디</label>
	        </div>
	        <div class="input-field col s3">
	          <i class="material-icons prefix">hearing</i>
	          <input disabled value=${detailVo.cs_response } id="cs_response" type="text" class="validate" >
	          <label for="cs_response">답변 여부</label>
	        </div>        
	      </div>
	      <div class="row">
	        <div class="input-field col s3">
	          <i class="material-icons prefix">looks_one</i>
	          <input disabled value=${detailVo.cs_category_one } id="cs_category_one" type="text" class="validate" >
	          <label for="cs_category_one">문의 유형</label>
	        </div>
	        <div class="input-field col s3">
	          <i class="material-icons prefix">looks_two</i>
	          <input disabled value=${detailVo.cs_category_two } id="cs_category_two" type="text" class="validate" >
	          <label for="cs_category_two">세부 문의 유형</label>
	        </div> 
	        <div class="input-field col s4">
	          <i class="material-icons prefix">date_range</i>
	          <input disabled value=${detailVo.cs_regdate } id="cs_regdate" type="text" class="validate" >
	          <label for="cs_regdate">작성일</label>
	        </div>         
	      </div>
	        <div class="input-field col s10">
	          <i class="material-icons prefix">title</i>
	          <input disabled value=${detailVo.cs_title } id="ans_title" type="text" class="validate" >
	          <label for="ans_title">문의제목</label>
	        </div>       
	      <div>
	      <div class="row">
	        <div class="input-field col s10">
	          <i class="material-icons prefix">mode_edit</i>
	          <textarea id="icon_prefix2" class="materialize-textarea" disabled="disabled">${detailVo.cs_content }</textarea>
	          <label for="icon_prefix2">문의 내용</label>
	        </div>
	      </div>
	      </div>
	      
		  <div class="row">
		  	<div class="input-field col s5">
		  	<i class="material-icons prefix">image</i>
		  	<br>
		  	<br>
			<c:choose>
				<c:when test="${detailVo.cs_fname eq 'notExist'}">
					<p>첨부 된 사진이 없습니다.</p>
				</c:when>
				<c:otherwise>
				  	<label for="cs_fname">첨부 이미지</label>
		        <div class="img-wrap">
				  		<img src="/inquiry/${detailVo.cs_fname }" id="cs_fname">
				</div>
				</c:otherwise>
			</c:choose>
	        </div>   
		  </div>      
	    </div>
	  </div>
    </div>
	  <hr>
	  
	  <h4 class="qna-info-title">문의 답변</h4>
	  <c:if test="${midrVo eq null }">
	  	<h5 id="resp-title">관리자가 확인 중에 있습니다. 확인 후 답변드리겠습니다. </h5>
	  </c:if> 
 	  
 	  <c:if test="${midrVo ne null }">
	        <div class="row">
		      <div class="row">
		        <div class="input-field col s6">
		          <i class="material-icons prefix">mode_edit</i>
		          <textarea id="icon_prefix2" class="materialize-textarea" readonly="readonly">${midrVo.ans_title }</textarea>
		          <label for="icon_prefix2">문의 제목</label>
		        </div>
		      </div>
	        <div class="input-field col s6">
	        </div>
	        	문의 내용
	         	 <p id="resp-content">
			      	<!-- 문의 내용 -->
			      	${midrVo.ans_content }
	         	 </p>
	      </div> 
	  </c:if>
</div>
	  	<%@ include file="../footer.jsp" %>
</body>
</html>