    	let code;

    	/* =============== 이메일 수정 클릭 시 visible =================*/
        $("#btn-email").click(function(){
           $("#emailForm").css("visibility",'visible'); 
        });    

    	/* =============== 이메일 수정 취소 클릭 시 visible =================*/
        $("#btnEmailCheckCancel").click(function(){
		   $("#emailForm").css("visibility",'hidden');        
        });
        
    	/* =============== 이메일 인증 =================*/
        $("#btnEmailSendCode").click(function(){
           let email = $("#email").val();
           
            if (email == '') {
            	$('#emailValidCheck').html('인증번호를 입력해주시기바랍니다.').css('color','red');
            	$('#email').val('');
            	$('#email').focus();
            }
            
            let data = {email:email};
            
            $.ajax({
                url :"/sendEmailCode.do",
                data:data
            }).done(function(data){
                code = data;
                alert(code);
                alert("인증코드를 발송하였습니다.");
            });
            
        });
        
        /*================이메일 인증완료 후 수정완료 클릭 시 이메일 변경====================*/
        $("#btnEmailCheck").click(function(){
        
        	let userCode = $("#inputPhone").val();
        	let email = $('#email').val();
        	
        	let data = {email:email};
        
        	if(code == userCode){
        		$.ajax({
        			url : "/updateEmail.do",
        			data:data
        		}).done(function(data){
        			$("") // jstl문법 변수처리 가능한지 확인해보기
        		});
        	
        	}else{
        		alert("일치하지않습니다.");
        		$('#validInput').val('');
        	}
        });