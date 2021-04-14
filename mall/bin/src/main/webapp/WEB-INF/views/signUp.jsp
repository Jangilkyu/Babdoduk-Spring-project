<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype HTML>
<html>
<head>
	<meta charset="UTF-8">
    <title>반찬</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body>
    <div class="container" style="margin-bottom: 20px">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <!-- Brand/logo -->
			<a class="navbar-brand" href="shopList.do">반찬가게</a>
            <!-- Links -->
            <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#">반찬</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signUp.do">회원가입</a>
                    </li>
            </ul>
        </nav>
    </div>
    <div class="container">
    <div class="jumbotron signUp">
    	<div></div>
    	<div>
	        <div class="page-header">
	            <div>
	                <h3>회원가입</h3>
	            </div>
	        </div>
        <div>
            <form action="signUp.do" method="post" role="form" id="signUpForm" name="member">
                <div class="form-group"> <label for="mem_id">아이디</label>
                    <input type="text" class="form-control" id="mem_id" name="mem_id" placeholder="ID" required>
                    <div id="id_check"></div>
                </div>
                <div class="form-group">
                    <label for="mem_pwd">Password</label>
                    <input type="password" class="form-control" id="mem_pwd" name="mem_pwd" placeholder="PASSWORD" required>
                    <div id="pw_check"></div>
                </div>
                <div class="form-group"> <label for="mem_pwd2">비밀번호 확인</label>
                    <input type="password" class="form-control" id="mem_pwd2" name="mem_pwd2" placeholder="PASSWORD ONEMORE" required>
                    <div  id="pw2_check"></div>
                </div>
                <div class="form-group">
                    <label for="mem_name">이름</label>
                    <input type="text" class="form-control" id="mem_name" name="mem_name" placeholder="Name" required>
                    <div  id="name_check"></div> </div> <div class="form-group">

                <label for="mem_birth">생일</label>
                <input type="date" class="form-control" id="mem_birth" name="mem_birth" placeholder="ex) 19961127" required>
                <div  id="birth_check"></div>
            </div>
                <div class="form-group">
                    <label for="mem_email">이메일</label>
                    <input type="email" class="form-control" id="mem_email" name="mem_email" placeholder="E-mail" required>
                    <div  id="email_check"></div>
                </div>
                <div class="form-group">
                    <label for="mem_phone">핸드폰 번호</label>
                    <input type="tel" class="form-control" id="mem_phone" name="mem_phone" placeholder="Phone Number" required>
                    <div  id="phone_check"></div>
                </div>
                <div class="form-group">
                    <input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="mem_zipCode" id="mem_zipCode" type="text" readonly="readonly">
                    <button type="button" class="btn btn-default" id="postBtn">
                        <i class="fa fa-search"></i>우편번호 검색</button>
                </div>
                <div class="form-group">
                    <input class="form-control" style="top: 5px;" placeholder="address" name="mem_address" id="mem_address" type="text" readonly="readonly"/>
                </div>
                <div class="form-group">
                    <input class="form-control" placeholder="detail address" name="mem_detailAddress" id="mem_detailAddress" type="text" required />
                </div>
                <div class="form-group text-center">
                    <button type="button" class="btn btn-dark singUpBtn" id="signUpBtn">회원가입</button>
                    <input type="reset" class="btn btn-dark" id="signUpReset" value="다시입력"></input>
                </div>
            </form>
        </div>
	    </div>
	    <div></div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/static/js/post.js"></script>
<script type="text/javascript" src="/static/js/signUpValidation.js"></script>
</body>
</html>