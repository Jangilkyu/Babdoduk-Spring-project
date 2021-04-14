<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listCart</title>
	
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

    <link rel="stylesheet" href="static/css/mainpageStyle.css">
    <link rel="stylesheet" href="static/css/listCartStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
	
    
    <!-- 아래 세 개는 임시 추가된 태그로, 작업 편의를 위해 캐시를 저장하지 않게 하는 태그입니다 -->
    <meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
		
</head>
<body>

	<%@ include file="header.jsp" %>
	<%@ include file="menubar.jsp" %>
	
 	<section id=listCart><br>
			<div id="title" align="center">
				<h2>내 장바구니</h2>	
			</div>
			
			<div id="cart-list" align="center">
				<hr>
				
				<c:choose>
					<c:when test="${map.count==0 }">
						장바구니가 비어있습니다.
					</c:when>
					
					<c:otherwise>
						<form name="form-cart" id="form-cart" method="post" action="/update.do">
							<table border="1" class="table table-bordered" style="padding: 0 10px; text-align: center">
								<thead class="thead-dark">
								<tr>
									<th><input type="checkbox" class="allCheck" name="allCheck" /></th>
									<th>상품이미지</th>
									<th>상품명</th>
									<th>단가</th>
									<th>수량</th>
									<th>금액</th>
									<th></th>
								</tr>
								<c:forEach var="c" items="${map.list}">
								<tr>
									<td>
										<input type="checkbox" class="checkBox" name="checkBox" data-cartNum="${c.cart_no }">
									</td>
									<td>
										<a href="/detailProducts.do?no=${c.product_no }">
										<img src="img/${c.product_main_img}" width="100" height="100">
										</a>
									</td>
									<td>
										<a href="/detailProducts.do?no=${c.product_no }">
										${c.product_title }
										</a>
									</td>
									<td style="width: 100px">
										<fmt:formatNumber value="${c.product_price }" pattern="###,###,###"/>원
									</td>
									<td>
										<input type="number" style="width: 50px" name="product_qty" value="${c.product_qty }">
										<input type="hidden" name="product_no" value="${c.product_no }">
										<button type="submit" id="btn_update">변경</button>
									</td>
									<td style="width: 100px">
										<fmt:formatNumber value="${c.product_total }" pattern="###,###,###"/>원
									</td>
									<td>
										<a href="/delete.do?cart_no=${c.cart_no }" style="color: blue;">삭제</a>
									</td> 
								</tr>
								</c:forEach>
								
								<tr>
									<td colspan="7" align="right">
										상품금액 합계 : 	<fmt:formatNumber value="${map.sumPriceCart }" pattern="###,###,###"/>원<br>
										배송료 : <fmt:formatNumber value="${map.fee }" pattern="###,###,###"/>원<br>
										전체 주문금액 : <fmt:formatNumber value="${map.totalPriceCart }" pattern="###,###,###"/>원
									</td>
								</tr>
							</thead>
							</table>
							<input type="hidden" name="count" value="${map.count }">
						</form>
					</c:otherwise>
				</c:choose>
				<br><br>
				<button type="button" id="btn_selectDelete" class="button">선택상품 삭제</button>
				<button type="button" id="btn_selectOrder" class="button">선택상품 결제</button>
				<button type="button" id="btn_order" class="button">전체상품 결제</button><br><br>
				<hr>10만원 이상 구매시 무료배송
				<button type="button" id="btn_list" class="button">상품 더보기</button><br><br>
			</div>
	</section>
	
	<%@ include file="footer.jsp" %>
	
</body>

	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		// 상품 목록 페이지로 이동
		$(function(){
			$("#btn_list").click(function(){
				location.href="/listProducts.do";
			});	
		});
		
		// 결제페이지 이동
		$(function(){
			$("#btn_order").click(function(){
				location.href="/payment/order";
			});	
		});
				
		// 상품 전체선택
		$(function(){
			$(".allCheck").click(function(){
				 var chk = $(".allCheck").prop("checked");
				 if(chk) {
				  $(".checkBox").prop("checked", true);
				 } else {
				  $(".checkBox").prop("checked", false);
				 }
			});
		});
		
		// 상품 개별선택
		$(function(){
			 $(".checkBox").click(function(){
			  $(".allCheck").prop("checked", false);
			 });
		 });
		 		 
		 // 선택상품 삭제
		 $(function(){
		 	$("#btn_selectDelete").click(function(){
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				  if(confirm_val) {
				   var checkArr = new Array();
				   
				   $("input[class='checkBox']:checked").each(function(){
				   	checkArr.push($(this).attr("data-cartNum"));
				   });
				   
				   $.ajax({
				    url : "/selectDelete",
				    type : "post",
				    data : { checkBox : checkArr }, success :function(){ 
						location.href = "/listCart.do";
				    }
				   });
				  } 
			 });
		 });
		 
		 // 선택상품 결제
		 $(function(){
		 	$("#btn_selectOrder").click(function(){
				alert("선택한 상품이 결제됩니다.");
			 });
		 });

	
	</script>
</html>