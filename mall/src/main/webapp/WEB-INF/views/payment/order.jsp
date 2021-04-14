<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="../header.jsp" %>
 <%@ include file="../menubar.jsp" %>
   	
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
	<link rel="stylesheet" href="order.css">

</head>
<body>

<!-- 전체 wrap -->
<div class="wrap">
  <div>
    <input type="hidden" value="${totAmount }" id="totAmount">
    <input type="hidden" value="${prodQty }" id="prodQty">
    <input type="hidden" value="${lastTot }" id="lastTot">
    <input type="hidden" value="${mem_id }" id="mem_id">
    <!--주문 목록-->
    <div class="order-background">
    	<div class="order-title-wrap">
        	<h4 class="order-title">주문목록</h4>
        </div>
        <hr class="order-hr">
        <!-- 테이블 div box-->
        <div class="order-form-container">
            <table class="order-table">
                <thead>
                   <tr>
                        <th class="order-img">상품이미지</th>
                        <th class="order-item">상품 정보</th>
                        <th class="order-amount">수량</th>
                        <th class="order-price">가격</th>
                    </tr>
                </thead>
                <tbody>
	                 <c:forEach var="cVo" items="${cVoList }">
	                    <tr>
	                        <td class="order-img"><a href="../detailProducts.do?no=${cVo.product_no}"><img src="../img/${cVo.product_main_img }" class="order-item-img"></a></td>
	                        <td class="order-item"><p id="order-title-p"><a href="../detailProducts.do?no=${cVo.product_no}">${cVo.product_title }</a></p><span id ="">${cVo.product_subtitle }</span></td>
	                        <td class="order-amount">${cVo.product_qty } 개</td>
	                        <td class="order-price">${cVo.product_total }원</td>
	                    </tr>
					</c:forEach>
                    <tr>
                    	<td colspan="1" style="text-align: right">총 ${totQty } 개</td>
                        <td colspan="3" style="text-align: right"><span id="totAmount">${totAmount }원</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="order-title-wrap">
      <!-- 배송지 -->
      <div class="row">
          <!--radio box-->
          <p>
           <!-- 기본 배송지 -->
            <label>
              <input class="with-gap" name="shipping" type="radio" id="ship1" checked />
              <span>기본 배송지</span>
            </label>
            <!-- 새 배송지 -->
            <label>
              <input class="with-gap" name="shipping" type="radio" id="ship2" />
              <span>새 배송지</span>
            </label>
          </p>
          <!-- 기본 배송지 정보 -->
          <div class="shipping-wrap" id ="ship-wrap1">
              <div class="shipping-container">
                  <div class="shipping-background">
                     <!--수령인-->
                      <div class="row">
                        <div class="input-field col s12">
                          <input disabled value="${ospVo.mem_name }" id="currName" type="text" class="validate">
                          <label for="disabled">수령인</label>
                        </div>
                      </div>
                      <!-- 연락처 -->
                       <div class="row">
                        <div class="input-field col s12">
                          <input disabled value="${ospVo.mem_phone }" id="currPhone" type="text" class="validate">
                          <label for="disabled">연락처</label>
                        </div>
                      </div> 
                      <!-- 주소 -->                    
                      <div class="row">
                            <!-- 현재 우편번호 -->
                            <div class="input-field col s1">
                              <input disabled value="${ospVo.mem_zipcode }" id="currZipcode" type="text" class="validate">
                              <label for="currZipcode">우편번호</label>
                            </div>
                            <!-- 현재 주소  -->
                            <div class="input-field col s3">
                              <input disabled value="${ospVo.mem_address }" id="currAddr" type="text" class="validate">
                              <label for="currAddr">주소</label>
                            </div>
                            <!-- 현재 상세주소  -->
                            <div class="input-field col s6">
                              <input disabled value="${ospVo.mem_detailaddress }" id="currDetAddr" type="text" class="validate">
                              <label for="currDetAddr">상세주소</label>
                            </div>
                        </div>                      
                  </div>
              </div>
          </div>
          <!-- 기본 배송지 정보 -->
          <div class="shipping-wrap" id="ship-wrap2">
              <div class="shipping-container">
                  <div class="shipping-background">
                     <!--수령인-->
                      <div class="row">
                        <div class="input-field col s12">
                          <input type="text" id="newName" name="newName" class="validate">
                          <label for="newName">수령인</label>
                        </div>
                      </div>
                      <!-- 연락처 -->
                      <div class="row">
                        <div class="input-field col s12">
                          <input type="text" id="newPhone" name="newPhone" class="validate">
                          <label for="newPhone">연락처</label>
                        </div>
                      </div>                      
                    <div class="row">
                        <!-- 새 우편번호 -->
                        <div class="input-field col s1">
                          <input type="text" id="mem_zipcode" name="newZipcode" class="validate">
                          <label for="newZipcode">우편번호</label>
                        </div>
                        <!-- 새 주소  -->
                        <div class="input-field col s3">
                          <input type="text" id="mem_address" name="newAddr" class="validate">
                          <label for="newAddr">주소</label>
                        </div>
                        <!-- 새 상세주소  -->
                        <div class="input-field col s6">
                          <input type="text" id="newDetAddr" name="newDetAddr" class="validate">
                          <label for="newDetAddr">상세주소</label>
                        </div>
                        <!-- 우편번호 찾기 버튼  -->
                        <div class="row">
                          <a class="waves-effect waves-light btn-small" onclick="PostCode()"><i class="material-icons left">search</i>우편번호 찾기</a>
                        </div>                       
                    </div>
                  </div>
              </div>
          </div>
      </div>    
          
    <div class="order-title-wrap">
    	<h4 class="order-title" style="font-weight: 600;">결제</h4>
    </div>
    <hr class="order-hr">
     <!-- 결제 수단-->
      <div class="row">
          <p>결제수단</p>
          <!--radio box-->
          <p>
            <label>
              <input class="with-gap" name="payment" type="radio" checked />
              <span>일반 결제</span>
            </label>
          </p>            
      </div>
      <div class="row">
          <!--radio box-->
          <p>
            <label>
              <input class="with-gap" name="payment" type="radio" disabled="disabled"/>
              <span>무통장 입금</span>
            </label>
          </p>
      </div>
    <!--결제 금액-->
    <div class="amount_of_Payment">
        <h6>결제 금액</h6>
       <div class="aop-container">
           <div class="aop-bckground">
                  <div class="row">
                    <div class="input-field col s12">
                      <input disabled value="${totAmount }원" id="disabled" type="text" class="validate">
                      <label for="disabled">주문금액</label>
                    </div>
                  </div>
                  <div class="row">
                    <div class="input-field col s12">
                      <input disabled value="${fee }원" id="disabled" type="text" class="validate">
                      <label for="disabled">배송비</label>
                    </div>
                  </div>
                  <hr id="dotted-hr">
                  <div class="row">
                    <div class="input-field col s12">
                      <input disabled value="${lastTot }원" id="disabled" type="text" class="validate">
                      <label for="disabled">최종 결제 금액</label>
                    </div>
                  </div>
            </div>        
        </div>
    </div>
    
	<hr class="order-hr">
    <p>
      <label>
        <input type="checkbox" id="order-agree"/>
        <span id="payment-agree-chkbox">결제 진행 필수 동의</span><br>
        개인정보 수집·이용 및 위탁동의<span>(필수)</span><a href="">약관보기</a><br>
        결제대행 서비스 약관 동의<span>(필수)</span><a href="">약관보기</a><br>
      </label>
    </p>
    <div id="payment-btn">
	   <a class="waves-effect waves-light btn s12" id="payment"><i class="material-icons left">payment</i>결제하기</a>
	</div>
   </div>
 </div>
</div>
<!-- iamport -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 제이쿼리  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 지도 api  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/static/js/myposts.js"></script>
<script src="/static/js/order.js"></script>

<script>
/*
    $('#ship2').on('click',function(){
        $('#ship-wrap2').show();
        $('#ship-wrap1').hide();
    });
    
    $('#ship1').on('click',function(){
        $('#ship-wrap1').show();
        $('#ship-wrap2').hide();
    });
        
	/*최종 금액*/
	let totAmount = $('#totAmount').val();
	/*이메일*/
	
$('#payment').on('click',function(){
	if(!$('#order-agree').is(':checked')){
		alert('결제를 하려면 약관 동의를 하셔야합니다.');
		return false;
	}else{
$('#payment').on('click',function(){
    $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp91911023'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '밥도둑',
	            amount : totAmount,
	            buyer_email : totAmount,
	            buyer_name : '장일규',
	            buyer_tel : '01066827082',
	            buyer_addr : 'adad',
	            buyer_postcode : '456465',
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                        $.ajax(function(){
	                        	
	                        
	                        });
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="<%=request.getContextPath()%>/order.do";
	                alert(msg);
	            }
	        });
	    });
	  });	
	}
});
*/
</script>
<%@ include file="../footer.jsp" %>
</body>
</html>