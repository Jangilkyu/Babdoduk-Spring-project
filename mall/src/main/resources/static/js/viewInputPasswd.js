let passwd = {
	
	init : function(){
		_this = this;
		$('#nextBtn').on('click',function(){
			_this.validPwd();
		});
	},
	
	validPwd : function(){
		
		if($('#currPwd').val() == ''){
			alert('현재 비밀번호를 입력해주시기 바랍니다.');
			return false;
		}
		
		if($('#newPwd').val() == ''){
			alert('새 비밀번호를 입력해주시기 바랍니다.');
			return false;
		}
		
		if($('#currPwd').val() !== $('#newPwd').val()){
			alert('비밀번호가 같지 않습니다.');
			return false;
		}
	}
	
}

passwd.init();