    	/* =============== 핸드폰 수정 클릭 시 visible =================*/
        $("#btn-phone").click(function(){
           $("#phoneForm").css('visibility','visible'); 
        });
        
    	/* =============== 핸드폰 수정 취소 클릭 시 visible =================*/
        $("#btnPhoneCheckCancel").click(function(){
		   $("#phoneForm").css("visibility",'hidden');        
        });

    	/* =============== 핸드폰 인증 =================*/
        $("#btnPhoneSendCode").click(function(){
           let phone = $("#phone").val();
            code;
            let data = {phone:phone};
            
            $.ajax({
                url :"/sendPhoneCode.do",
                data:data
            }).done(function(data){
                code = data;
                alert("인증코드를 발송하였습니다.");
            });
        });

        /*=================== 핸드폰 인증완료 후 수정완료 클릭 시 핸드폰번호 변경====================*/
        $("#btnPhoneCheck").click(function(){
        
        	let userCode = $("#validPhoneInput").val();
        	let phone = $('#phone').val();
        	
        	let data = {phone:phone};
        
        	if(code == userCode){
        		$.ajax({
        			url : "/updatePhone.do",
        			data:data
        		}).done(function(data){
        			$("") // jstl문법 변수처리 가능한지 확인해보기
        		});
        	
        	}else{
        		alert("일치하지않습니다.");
        		$('#validInput').val('');
        	}
        });
		