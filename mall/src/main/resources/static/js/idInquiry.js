let code;
let mem_id;
let emailcode;

let idInquiry = {
	
	init : function() {
		let _this = this;
		
		$('.radio-value').on('click',function(){
			_this.showBox();			
		});
		
		$('.phonebtn').on('click',function(){
			_this.sendPhoneValid();
		});
		
		$('.emailbtn').on('click',function(){
			_this.sendEmailValid();
		});
		
		$('#phoneSubmit').on('click',function(){
			_this.Check();
		});
		$('#emailSubmit').on('click',function(){
			_this.emailCheck();
		});
	},
	
	showBox : function(){
		
        let boxVal = $('.radio-value:checked').val();;
	
		if(boxVal == 0){
			$('.phone-auth').show();
			$('.email-auth').hide();
			// 폰 라디오박스 오픈 시 이메일 텍스트 다 삭제해줌
			$('#mem_email_name').val('');
			$('#mem_email').val('');
			$('#mem_email_auth').val('');
			
			
		}// end if
		if(boxVal == 1){
			$('.email-auth').show();
			$('.phone-auth').hide();
			// 폰 라디오박스 오픈 시 이메일 텍스트 다 삭제해줌
			$('#mem_phone_name').val('');
			$('#mem_phone').val('');
			$('#mem_phone_auth').val('');
		}// end if
	},
	
	sendPhoneValid : function(){

	if($('#mem_phone_name').val() == ''){
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
				toastr.error('이름을 정확히 입력해 주시기바랍니다.');
		return false;		
	}
	
	if($('#mem_phone').val() == ''){
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
				toastr.error('핸드폰번호를 정확히 입력해 주시기바랍니다.');
		return false;		
	}
		
		$.ajax({
			url : '/login/phoneAuth',
			type : 'POST',
			dataType : 'json',
			contentType:'application/json; charset=utf-8',				
			data : JSON.stringify({
				'mem_name' : $('#mem_phone_name').val(),
				'mem_phone': $('#mem_phone').val(),
			})
		}).done(function(data){
			if(data.result == 1){
				alert('인증번호가 전송되었습니다.');
				$('#mem_phone_auth').attr('disabled',false);
				$('#mem_phone_auth').focus();
				code = data.code;
				mem_id = data.mem_id;
				$('#mem_id').val(mem_id);
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
						toastr.error('이름 및 휴대전화가 일치하는 회원이 존재하지 않습니다.');
				return false;				
			}
		})
	},

	sendEmailValid : function(){
		
		if($('#mem_email_name').val() == ''){
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
				toastr.error('이름을 정확히 입력해 주시기바랍니다..');
			return false;	
		}
		
		if($('#mem_email').val() == ''){
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
				toastr.error('이메일을 정확히 입력해 주시기바랍니다..');
			return false;
		}//end if	
		
		$.ajax({
			url : '/login/emailAuth',
			type : 'POST',
			contentType:'application/json; charset=utf-8',				
			data : JSON.stringify({
				'mem_name' : $('#mem_email_name').val(),
				'mem_email': $('#mem_email').val(),
			})
		}).done(function(data){
			if(data.result == 1){
				alert('인증 메일이 전송 되었습니다.');
				$('#mem_email_auth').attr('disabled',false);
				$('#mem_email_auth').focus();	
				emailcode = data.code;
				mem_id = data.mem_id;
				$('#mem_id2').val(mem_id);
			}else{
				$('mem_email_auth').attr('disabled',true);
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
						toastr.error('이름 및 이메일이 일치하는 회원이 존재하지 않습니다.');
				return false;
			}
		});
	},
	
	emailCheck : function(){
		idInquiry.CheckEmail();
	},
	Check : function(){
		idInquiry.Check();	
	}
	
}//idInquiry

function CheckEmail(){
		if($('#mem_email_auth').val() != emailcode){
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
				toastr.error('인증번호를 정확히 입력해 주시기바랍니다.');
		return false;		
	}
}

function Check(){
	if($('#mem_phone_auth').val() != code){
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
				toastr.error('인증번호가 일치하지 않습니다.');
		return false;				
	}
	
}//Check

idInquiry.init();