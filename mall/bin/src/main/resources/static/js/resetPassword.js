
let pwd = /^[A-Za-z0-9]{6,12}$/;


		$("#changeSubmit").click(function(){
	           let currPassword = $("#currPassword").val();
	            let data = {currPassword:currPassword};
	            
	            $.ajax({
	                url :"/getPassword.do",
	                data:data,
					type: "POST"
	            }).done(function(data){
					if(currPassword !== data){
						alert("aa");
					}
					if(currPassword != data){
						alert("a");
					}
	            });
		});
		
    $('#newPassword').keyup(function(){
      $('#chkpwd').html('');
    });

    $('#newChkPassword').keyup(function(){

        if($('#newPassword').val() != $('#newChkPassword').val()){
          $('#chkpwd').html('비밀번호가 일치하지 않습니다.<br><br>');
          $('#chkpwd').attr('color', '#FF0000');
        } else{
          $('#chkpwd').html('비밀번호 일치합니다.<br><br>');
          $('#chkpwd').attr('color', '#0099FF');
        }
    });