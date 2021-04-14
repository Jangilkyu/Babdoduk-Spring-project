let  valid = {
    init : function (){
        let _this = this;

	    $('#ship1').on('click',function(){
	        $('#ship-wrap1').show();
	        $('#ship-wrap2').hide();
	    });

	    $('#ship2').on('click',function(){
			_this.ship2();
	    })
		$('#payment').on('click',function(){
			_this.payment();		
		})
    },
	ship1 : function (){
        $('#ship-wrap1').show();
        $('#ship-wrap2').hide();
	},
    ship2 : function (){
        $('#ship-wrap2').show();
        $('#ship-wrap1').hide();
		$('#newName').val('');
		$('#newPhone').val('');
		$('#newZipcode').val('');
		$('#newAddr').val('');
		$('#newDetAddr').val('');
    },
	payment : function (){
		let name;
		let phone;
		let zipcode;
		let addr;
		let detailAddr;
		let mem_id = $('#mem_id').val();
		
		// 만약 ship2 radio가 선택되었다면
		if($('input:radio[id="ship2"]').is(":checked")){
			// 만약 새 배송지에 모든 값이 전부 채워져있지 않다면
			if($('#newName').val() == '' || $('#newPhone').val() == '' || $('#newZipcode').val() == '' || $('#newAddr').val() == '' || $('#newDetAddr').val()== ''){
				alert('새 배송지에 내용을 전부 정확하게 입력해주세요.');
				$(location).attr('href', '/payment/order');
				return false;
			}
		}
		
		/* 수령인 */
		// 새배송지 수령인이 비어있는 경우
		if($('#newName').val() == ''){
			name = $('#currName').val();
		}else{
			name = $('#newName').val();
		}//end 
		
		/*연락처*/
		// 새 배송지 휴대전화란이 비어있는경우
		if($('#newPhone').val() == ''){
			phone = $('#currPhone').val();
		}else{
			phone = $('#newPhone').val();
		}//end else
		
		/* 우편번호 */
		if($('#newZipcode').val() == ''){
			zipcode = $('#currZipcode').val();
		}else{
			zipcode = $('#newZipcode').val();
		}
		/* 주소 */
		if($('#newAddr').val() == ''){
			addr = $('#currAddr').val();
		}else{
			addr = $('#newAddr').val();			
		}
		/* 상세주소 */
		if($('#newDetAddr').val() == ''){
			detailAddr =$('#currDetAddr').val();
		}else{
			detailAddr =$('#newDetAddr').val();			
		}
	// 만약 약관을 체크하지않고 결제 하려는 경우
	if(!$('#order-agree').is(':checked')){
		alert('결제를 하려면 약관 동의를 하셔야합니다.');
		return false;
	}else{
	let lastTot = $('#lastTot').val();

	// 약관을 체크 했다면 결제 진행
    $(function(){
	        var IMP = window.IMP; // 생략가능
	        IMP.init('imp91911023'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '밥도둑',
				// lastTot
	            amount : lastTot,
	            buyer_email : '',
	            buyer_name : name,
	            buyer_tel : phone,
	            buyer_addr : addr + detailAddr,
	            buyer_postcode : zipcode,
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
							
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
						// db에 결제 내용 저장 하는 Ajax
						$.ajax({
							url : '/payment/paymentResult',
							type : 'POST',
							dataType : 'json',
			        	    contentType:'application/json; charset=utf-8',				

							data : JSON.stringify({
								'lastTot' : $('#lastTot').val(),
								'name' : name,
								'phone' : phone,
								'addr' : addr,
								'zipcode' : zipcode,
								'detailAddr' : detailAddr,
								'mem_id' : mem_id
							})
						});
	                //성공시 이동할 페이지
	                location.href='/';
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="/payment/order";
	                alert(msg);
	            }
	        });
	    });
	  }		
	}
}     

valid.init();