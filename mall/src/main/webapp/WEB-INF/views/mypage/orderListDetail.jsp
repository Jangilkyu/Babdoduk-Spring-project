<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[밥도둑] 결제페이지</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<!-- icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<!-- css -->
	<link rel="stylesheet" href="/static/css/order.css">
	<link rel="stylesheet" href="/static/css/myPage/wrap.css">
	<link rel="stylesheet" href="orderDetail.css">

</head>
<body>

<!-- 전체 wrap -->
<div class="wrap">
  <div>
    <!--주문 목록-->
    <div class="order-background">
    	<div class="order-title-wrap">
        	<h4 class="order-title">상세페이지</h4>
        </div>
        <hr class="order-hr">
        <!-- 테이블 div box-->
        <div class="order-form-container">
            <table class="order-table">
                <tbody>
	                 <c:forEach var="cVo" items="${cVoList }">
	                    <tr>
	                        <td class="order-img"><a href="../detailProducts.do?no=${cVo.product_no}"><img src="../img/${cVo.product_main_img }" class="order-item-img"></a></td>
	                        
	                        <td class="order-item"><p id="order-title-p"><a href="../detailProducts.do?no=${cVo.product_no}">${cVo.product_title }</a><br>
	                        <span class="order-subtitle">${cVo.product_total }원</span>
	                        <span>${cVo.product_qty } 개</span></td>
	                        
	                        
	                        <td class="order-amount"><button>장바구니 담기</button></td>
                                <td class="order-btn-wrap">
                                        <div class="order-btn"><input type="button" value="1:1문의하기"></div>
                                        <div class="order-btn"><input type="button" value="구매후기쓰기"></div>
                                        <div class="order-btn"><input type="button" value="주문상세보기"></div>
                                <td>
	                    </tr>
					</c:forEach>
                    <tr>
                    </tr>
                </tbody>
            </table><!-- table -->
            <div>
               <h6><span id="recd-info">받는사람 정보</span></h6>
               <p>받는 사람 : </p>
               <p>연락처 :</p>
               <p>받는 주소 :</p>
            </div>    
          </div>
        </div>
    </div>
  </div>
</html>