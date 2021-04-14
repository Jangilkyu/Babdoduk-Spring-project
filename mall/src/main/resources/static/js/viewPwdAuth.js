let code;

let pwdAuth = {
	init : function(){
			let _this = this;
		
			$('#btnPhoneAuthNo').on('click',function(){
				_this.btnPhoneAuthNo();
			});
			
			$('#btnNext').on('click',function(){
				_this.btnNext();
			});
			
	},
	
	btnPhoneAuthNo : function(){
		$.ajax({
			
			url : '/login/pwdPhoneAuth',
			type : 'POST',
			dataType : 'json',
    	    contentType:'application/json; charset=utf-8',				

			data : JSON.stringify({
				'mem_name' : $('#mem_name').val(),
				'mem_phone' : $('#mem_phone').val()
			})
		}).done(function(data){
			if(data.result == 1){
				code = data.code;
				$('#mem_id').val(data.mem_id);
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
						  "timeOut": "10000",
						  "extendedTimeOut": "1000",
						  "showEasing": "swing",
						  "hideEasing": "linear",
						  "showMethod": "fadeIn",
						  "hideMethod": "fadeOut"
								                  };
						toastr.info('인증번호가 고객님에 핸드폰으로 전송되었습니다.');
					$('#phoneAuthNo').attr('disabled',false);
					$('#phoneAuthNo').focus();
			}else{
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
						toastr.warning('이름 및 휴대전화에 일치하는 회원이 존재하지 않습니다.');
				return false;								
			}
		});
	},
	
	btnNext : function(){
		$('#mem_id').val(data.mem_id);
		pwdAuth.CheckPwdAuth();
	}
}

function CheckPwdAuth() {
		// 인증번호 값이 비어있는경우
		if($('#phoneAuthNo').val() == ''){
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
						toastr.warning('인증번호를 입력해주시기바랍니다.');	
			
			return false;		
		}//end if
		
		if($('#phoneAuthNo').val() != code){
			// 인증번호가 일치하지 않는경우.
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
					toastr.warning('인증번호가 일치하지 않습니다. 확인해주시기바랍니다.');	
			
			return false;					
		}//end if	
}


pwdAuth.init();