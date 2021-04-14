let phonecode; 

let phoneValid = {
	
	init : function(){
		let _this = this;
		
		$("#btn-phone").click(function(){
			_this.showPhoneForm();
		});	
		
        $("#btnPhoneCheckCancel").click(function(){
			_this.hiddPhoneChck();
		});
		
        $("#btnPhoneSendCode").click(function(){
			_this.sendPhoneCode();
		});		
		
        $("#btnPhoneCheck").click(function(){
			_this.chkPhone();
		});
	},
	
   	// 핸드폰 수정 클릭 시 visible 
	showPhoneForm : function(){
           $("#phoneForm").css('visibility','visible'); 	
		   $('#phone').focus();
	},
	
	// 핸드폰 수정 취소 클릭 시 visible 
	hiddPhoneChck : function(){
		   $("#phoneForm").css("visibility",'hidden');    
  		   $('#phone').val('');
		   $('#validPhoneInput').val('');
	},
	
	// 핸드폰 인증
	sendPhoneCode : function(){
       let phone = $("#phone").val();
       let data = {phone:phone};

	  // 만약 핸드폰 input창이 공백 일 경우
	  if($('#phone').val() == ''){
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
			toastr.error('핸드폰 번호를 정확히 입력해 주시기바랍니다.!');
			// 핸드폰input으로 다시 포커스
    		$('#phone').focus();
			return false;				
		}//end if

	   // 핸드폰 변경을 위한 인증코드 ajax      
       $.ajax({
           url :"/mypage/sendPhoneCode",
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
	            $('#validPhoneInput').focus();
       		phonecode = data;
       });		
	},
	
	//핸드폰 인증완료 후 수정완료 클릭 시 핸드폰번호 변경
	chkPhone : function(){
        let userCode = $("#validPhoneInput").val();
        let phone = $('#phone').val();
        	
        let data = {phone:phone};
        
        if(phonecode == userCode){
        	$.ajax({
        		url : "/mypage/updatePhone",
        		data:data
        	}).done(function(){
				// 인증 코드 일치 시 
				alert('성공적으로 변경이 완료되었습니다.');
				location.replace('/mypage/userInfoUpdate');
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
    		$('#validPhoneInput').val('');
			// 포커스 인증코드 input
    		$('#validPhoneInput').focus();
			return false;
        }//end if		
	}
}

phoneValid.init();