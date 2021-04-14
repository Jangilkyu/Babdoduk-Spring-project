
let setNo = document.getElementById('set_no').value;
let ajaxUrl = '/admin/set-edit/' + setNo;

$('#sale-register-submit').click(function(){
	let updateData = new FormData(document.getElementById('set-register'));	
	
	$.ajax({
		url:ajaxUrl,
		data:updateData,
		type:'post',
		processData:false,
		contentType:false,
		success:function(){
			alert("세트 정보가 수정되었습니다.");
		}
	});
});