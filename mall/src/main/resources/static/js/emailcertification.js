let code;

let emailValid = {

	init : function(){
		let _this = this;
		
		$("#btn-email").on('click',function(){
			_this.showEmailForm();
		});
        $("#btnEmailCheckCancel").click(function(){
			_this.btnChkCan();	
		});
        $("#btnEmailSendCode").click(function(){
			_this.sendEmaCode();		
		});
        $("#btnEmailCheck").click(function(){
			_this.chckEmail();
		});
	},
	
	// 이메일 수정
	showEmailForm : function(){
       $("#emailForm").css("visibility",'visible'); 
	   $('#email').focus();
	},
	
	// 이메일 수정 취소
	btnChkCan : function(){
	   $("#emailForm").css("visibility",'hidden');       
 	   $('#email').val('');
	   $('#inputEmail').val(''); 
	},
	
	// 이메일 수정 버튼 클릭 시
	sendEmaCode : function(){
           let email = $("#email").val();
            // 만약 email값이 공백이면 에러
            if ($('#email').val() == '') {
				toastr.options = {
						  "closeButton": false,
						  "debug": false,
						  "newestOnTop": false,
						  "progressBar": false,
						  "positionClass": "toast-bottom-right",
						  "preventDuplicates": false,
						  "onclick": null,
						  "showDuration": "300",
						  "hideDuration": "1000",
						  "timeOut": "5000",
						  "extendedTimeOut": "1000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
				};
					// 안내 문구
					toastr.error('이메일을 정확히 입력해 주시기바랍니다.!');
					// 이메일input으로 다시 포커스
            		$('#email').focus();
					return false;
            }//end if
            
			// 이메일 변경 위한 인증 코드 발송
            let data = {email:email};
            
            $.ajax({
                url :"/mypage/sendEmailCode",
                data:data
            }).done(function(data){
                code = data;
				toastr.options = {
						  "closeButton": false,
						  "debug": false,
						  "newestOnTop": false,
						  "progressBar": false,
						  "positionClass": "toast-bottom-right",
						  "preventDuplicates": false,
						  "onclick": null,
						  "showDuration": "300",
						  "hideDuration": "1000",
						  "timeOut": "100000",
						  "extendedTimeOut": "1000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
				};
				toastr.info('인증코드를 발송하였습니다.');
	            $('#inputEmail').focus();
            });
            
	},
	// 수정 완료 버튼 클릭 시
	chckEmail : function(){
		    let userCode = $("#inputEmail").val();
        	let email = $('#email').val();
        	
        	let data = {email:email};
        
			// 만약 고객이 input창에 입력한 인증 번호와 메일로 전송 된 인증코드가 일치 한다면
        	if(code == userCode){
        		$.ajax({
        			url : "/mypage/updateEmail",
        			data:data,
					type:'GET'
        		}).done(function(){
					// 인증 코드 일치 시 
					alert('성공적으로 변경이 완료되었습니다.');
					location.replace('/mypage/userInfoUpdate');
        		}).fail(function(){
					alert("실패");
				});
        	}else{
			// 인증 코드 불 일치 시
				toastr.options = {
						  "closeButton": false,
						  "debug": false,
						  "newestOnTop": false,
						  "progressBar": false,
						  "positionClass": "toast-bottom-right",
						  "preventDuplicates": false,
						  "onclick": null,
						  "showDuration": "300",
						  "hideDuration": "1000",
						  "timeOut": "5000",
						  "extendedTimeOut": "1000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
				};
					// 안내 문구
					toastr.error('인증번호가 일치하지 않습니다.');
					// 인증코드 값 비우고 
	        		$('#validInput').val('');
					// 포커스 인증코드 input
            		$('#validInput').focus();
					return false;
        	}
	}
}

emailValid.init();