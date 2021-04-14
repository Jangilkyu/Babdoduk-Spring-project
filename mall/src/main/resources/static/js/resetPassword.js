const EXISTID = 1;
const EXIS = 0;
//유효성
let pwd = /^[A-Za-z0-9]{6,12}$/;

let pwdValid = {
	
	init : function(){
		let _this = this;
		
		$("#sendPwd").click(function() {
			_this.updatePwd();
		});
	},
	
	chckPwd : function(){
		
		$.ajax({
			url: "/getPassword.do",
			type: "POST",
			data: $('#currPassword').val(),
			dataType:'json',
            contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			if (data == EXIS) {
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
			}
		}).fail(function(){
			alert('aaa');
		});
		
		pwdValid.updatePwd();
	},
	
	updatePwd : function(){
		$.ajax({
				url: "/resetPassword.do",
				data: $('#newChkPassword').val(),
				type: "POST",
				dataType:'json',
        	    contentType:'application/json; charset=utf-8'				
			}).done(function(data) {
				alert("성공적으로 비밀번호가 변경되었습니다.");
			}).fail(function() {
				alert("실패");
			});		
			
	}
	
	
	
}
pwdValid.init();
/*
$("#changeSubmit").click(function() {
	let currPassword = $("#currPassword").val();
	let newPassword = $("#newPassword").val();
	let newChkPassword = $("#newChkPassword").val();

	if (!currPassword) {
		alert("현재 비밀번호를 입력해주세요.");
		return false;
	}

	if (!newPassword || !newChkPassword) {
		alert("비밀번호를 입력해주세요.");
		return false;
	}

	if (newPassword !== newChkPassword) {
		alert("비밀번호가 일치하지않습니다.");
		return false;
	}
});

$("#changeSubmit").click(function() {
	let data = { newPassword: newPassword };

	$.ajax({
		url: "/resetPassword.do",
		data: data,
		type: "POST"
	}).done(function(data) {
		alert("성공적으로 비밀번호가 변경되었습니다.");
	}).fail(function() {
		alert("실패");
	});
});

$('#newChkPassword').keyup(function() {
	if ($('#newPassword').val() != $('#newChkPassword').val()) {
		$('#chkpwd').html('비밀번호가 일치하지 않습니다.<br><br>');
		$('#chkpwd').attr('color', '#FF0000');
	} else {
		$('#chkpwd').html('비밀번호 일치합니다.<br><br>');
		$('#chkpwd').attr('color', '#0099FF');
	}
});
*/