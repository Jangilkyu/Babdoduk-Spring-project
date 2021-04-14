let account = {
	
	init : function(){
		let _this = this;
		
		$("#deleteCheck").on('click',function(){
			_this.deleteAccount();
		});
	},
	
	deleteAccount : function(){
	    if(!$("#deleteVaild").is(":checked")){
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
				// 안내 문구
				toastr.error('탈퇴를 하려면 동의 체크박스를 선택하셔야합니다.');
	    }else{
	    	$("#deleteForm").submit();
	    }		
	}
}

account.init();