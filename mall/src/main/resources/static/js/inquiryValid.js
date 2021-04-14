// 정규식
let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

let inquiryValid = {
	
	init : function(){
		let _this = this;
		
		$('#send1').on('click',function(){
				_this.Check();			
		});
	},

	Check : function(){
		inquiryValid.Check();	
	}
}

function Check(){
	
	// 문의 유형이 선택이 되지 않은경우
	// 0은 선택해주세요 기본값
	if(($("#value1 option:selected").val()) == 0) {
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
				toastr.error('문의유형을 선택해 주시기바랍니다.');
			return false;
	}//end if
	
	// 문의 제목 미입력 시
	if($('#cs_title').val() === ''){
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
				toastr.error('제목을 입력해주시기 바랍니다.');		
		return false;
	}//end if
	
	// 문의 내용이 비어있을 경우
	if($('#cs_content').val() === ''){
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
				toastr.error('내용을 입력해주시기 바랍니다.');		
		return false;
	}//end if

    if($('#cs_email').val() == ''){
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
				toastr.error('이메일 주소를 확인해주시기 바랍니다.');		
        return false;
    }//end if

    if($('#cs_phone').val() == ''){
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
				toastr.error('핸드폰 번호를 확인해주시기 바랍니다.');		
        return false;
    }//end if

	return true;
}


inquiryValid.init();