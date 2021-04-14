<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[밥도둑] 주문상세페이지</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<!-- icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- css -->
	<link rel="stylesheet" href="/static/css/myPage/orderList.css">
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="orderList.css">

</head>
<body>

<!-- 전체 wrap -->
<div class="wrap">
  <div>
    <!--주문 목록-->
    <div class="order-background">
    	<div class="order-title-wrap">
        	<h4 class="order-title">주문상세</h4>
        </div>
        <hr class="order-hr">
        <!-- 테이블 div box-->
        <div class="order-form-container">
            <table class="order-table">
                <tbody>
	                 <c:forEach var="odList" items="${odList }">
	                    <tr>
	                        <td class="order-img"><a href="../detailProducts.do?no=${odList.order_date}"><img src="../img/${odList}" class="order-item-img"></a></td>
	                        
	                        <td class="order-item"><p id="order-title-p"><a href="../detailProducts.do?no=${odList}">${odList }</a><br>
	                        <span class="order-subtitle">${odList.order_phone }원</span>
	                        <span>${odList} 개</span></td>
	                        
	                        <td class="order-amount"><button>장바구니 담기</button></td>
	                        
                                <td class="order-btn-wrap">
                                        <div class="order-btn"><input type="button" value="1:1문의하기"></div>
                                        <div class="order-btn"><input type="button" value="구매후기쓰기"></div>
                                </td>
	                    </tr>
					</c:forEach>
                </tbody>
            </table>  
           </div>
        </div>
    </div>
 </div>
</body>
</html>