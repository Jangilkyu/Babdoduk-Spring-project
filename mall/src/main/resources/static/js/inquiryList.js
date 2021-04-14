let inquirySearch = {
	
	init : function(){
		let _this = this;
		
		$('#btnSearch').on('click',function(){
			_this.search();
		});
	},
	
	search : function(){
		inquirySearch.inqValid();
	}
}
function inqValid(){
	if($('#searchFeild option:selected').val() == ''){
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
			toastr.warning('검색 조건을 선택해 주시기바랍니다.');
			
			return false;
	}	

	if($('#keyword').val() == ''){
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
			toastr.warning('검색창이 공백일 수 없습니다.');
			
			return false;		
	}

}

inquirySearch.init();