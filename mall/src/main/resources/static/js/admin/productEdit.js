
//상품 수정 상세페이지 이동 시, 드랍박스 항복 값을 상품 정보에 맞춰 선택
let storageBox = document.getElementById('product_storage');
let storageOptions = Array.from(storageBox.children);
let storage = document.getElementById('product_storage_hidden').value;

storageOptions.forEach(function(option){
	if(option.value == storage){
		option.setAttribute('selected', 'selected');
	}
})


let productNo = document.getElementById('product_no').value;
let ajaxUrl = '/admin/product-edit/' + productNo;

$('#product_edit_submit').click(function(){
	
	if(checkProductForm('edit')){
		let updateData = new FormData(document.getElementById('product_editor'));	
		$.ajax({
			url:ajaxUrl,
			data:updateData,
			type:'post',
			processData:false,
			contentType:false,
			success:function(){
				alert("상품 정보가 수정되었습니다.");
			}
		});
	}
});
