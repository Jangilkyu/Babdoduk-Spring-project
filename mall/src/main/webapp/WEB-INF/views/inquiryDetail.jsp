<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ include file="menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/inquiry.css">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- css -->
    <link rel="stylesheet" href="/static/css/myPage/inquiryDetail.css">
    <link rel="stylesheet" href="/static/css/myPage/wrap.css">

	<!-- summer note -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet"> 
</head>
<body>


<div class="row wrap">
	<h2>문의 사항 답변하기</h2>
	<hr>
	<br>
	<br>
	<input type="hidden" name="ans_no" id="cs_no" value="${userIqVo.cs_no }">
	<input type="hidden" name="cs_mem_id" id="cs_mem_id" value="${userIqVo.cs_mem_id }">
	<input type="hidden" name="cs_respcheck" id="cs_respcheck" value = "${userIqVo.cs_respcheck }">
	  <!-- 글번호 -->
      <div class="row">
        <div class="input-field col s3">
          <i class="material-icons prefix">thumb_up</i>
          <input disabled value="${userIqVo.cs_no }" id="dis_cs_no" type="text" class="validate">
          <label for="dis_cs_no">글번호</label>
        </div>
        <div class="input-field col s3">
          <i class="material-icons prefix">account_box</i>
          <input disabled value="${userIqVo.cs_mem_id}" id="dis_cs_no" type="text" class="validate">
          <label for="dis_cs_no">작성자 아이디</label>
        </div>        
        <div class="input-field col s4">
		  <i class="material-icons prefix">date_range</i>
          <input disabled value="${userIqVo.cs_regdate}" id="cs_regdate" type="text" class="validate">
          <label for="cs_regdate">작성 일자</label>
        </div>        
      </div>
      
      <div class="row">
        <div class="input-field col s4">
          <i class="material-icons prefix">looks_one</i>
          <input disabled value="${userIqVo.cs_category_one}" id="cs_category_one" type="text" class="validate">
          <label for="cs_category_one">문의 유형</label>
        </div>   
        <div class="input-field col s4">
          <i class="material-icons prefix">looks_two</i>
          <input disabled value="${userIqVo.cs_category_two}" id="cs_category_two" type="text" class="validate">
          <label for="cs_category_two">세부 문의 유형</label>
        </div>   
      </div>
      <!-- 문의 제목  -->
	  <div class="row">      
		<div class="input-field col s6">
          <i class="material-icons prefix">title</i>
          <input disabled value="${userIqVo.cs_title }" id="cs_title" type="text" class="validate">
          <label for="cs_title">문의 제목</label>
        </div>
      </div>
      <!-- 문의 내용 -->
	  <div class="row">      
		<div class="input-field col s10">
          <i class="material-icons prefix">mode_edit</i>
          <input disabled value="${userIqVo.cs_content }" id="cs_content" type="text" class="validate">
          <label for="cs_content">문의 내용</label>
        </div>
      </div>      	
      <!-- 문의 첨부한 이미지 -->
	  <div class="row">
	  	<div class="input-field col s5">
	  	<i class="material-icons prefix">image</i>
	  	<label for="cs_fname">첨부 이미지</label>
	  		<br>
	  		<br>
	  		<br>
	  		<img src="../inquiry/${userIqVo.cs_fname }" id="cs_fname">
        </div>   
	  </div>   
	
	  <!-- 답변 하기 버튼 -->
	  <div class="row">
		  <a class="waves-effect waves-light btn" id="btnReply"><i class="material-icons left">send</i>답변 하기</a>
	  </div>  
	  

	  <div id="answer_wrap">
		  <!-- 답변 제목 -->
		  <div class="row">
			 <div class="input-field col s10">
		        <i class="material-icons prefix">title</i>
			    <input  id="ans_title" name="ans_title" type="text" class="validate">
			    <label for="ans_title">답변 제목</label>
			</div>  		
		  </div>	
		  <textarea id="ans_content"></textarea><br>
	    
		  <!-- 전송 하기 버튼 -->
		  <div class="row">
			  <a class="waves-effect waves-light btn" id="btnsend"><i class="material-icons left">send</i>답변 전송 하기</a>
		  </div>  
    </div>
</div>

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 섬머노트  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> 
<script src="/static/js/inquiryDetail.js"></script>

<script>
	// 답변여부	
	var resp = $('#cs_respcheck').val();
	
	$('#btnReply').on('click',function(){
        $('#answer_wrap').show(); 
        
        $('#btnsend').on('click',function(){
        	let ans_content = $("#ans_content").val();
        	let cs_no = $("#cs_no").val();
        	let ans_title = $("#ans_title").val();
        	let cs_mem_id = $("#cs_mem_id").val();
        	
            let data = {"ans_content" : ans_content, "cs_no" : cs_no, "ans_title" : ans_title, "cs_mem_id" : cs_mem_id};
            $.ajax({
               url : 'sendQnA.do',
               data : data,
               type : 'POST'
            }).done(function(data){
            });
        });
    });

	if(resp == 1){
		$("#btnReply").hide();
	}

    
    /*summber note*/
	$('#ans_content').summernote('code', '${board_data.BOARD_CONTENT}');
    $('#ans_content').summernote({ 
    placeholder: '실제로 고객에 마이페이지에 전송되는 텍스트입니다. 수정이 불가능 하오니 신중히 작성 후 안내 부탁드리겠습니다.',
     height: 1000,
     tabsize: 2, 
     lang: "ko-KR"
    }); 
</script>
	<%@ include file="footer.jsp" %>
</body>
</html>