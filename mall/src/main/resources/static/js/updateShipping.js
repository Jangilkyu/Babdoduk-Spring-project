let ShipValid = {
	
	init : function(){
		let _this = this;
		
		$('#sendAddr').on('click',function(){
				_this.Check();			
		});
	},

	Check : function(){
		ShipValid.Check();
	}
}

function Check(){
	/* 우편번호 materializecss프레임워크 특징상 label과 겹치기 때문에 value=' ' 공백으로 설정되어있어서 '' 이거나 ' ' 인경우 유효성검사를 해줘야한다. */
	if(($("#mem_zipcode").val()) == ' ' || $('#mem_zipcode').val() == '') {
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
				toastr.error('우편번호를 정확히 입력해 주시기바랍니다..');
			return false;
	}//end if

	if(($("#mem_address").val()) == ' ' || $('#mem_address').val() == '') {
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
				toastr.error('주소를 정확히 입력해 주시기바랍니다..');
			return false;
	}//end if
	mem_detailaddress
	
	if(($("#mem_detailaddress").val()) == ' ' || $('#mem_detailaddress').val() == '') {
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
				toastr.error('상세 주소를 정확히 입력해 주시기바랍니다.');
			return false;
	}//end if
	
	return true;
}
