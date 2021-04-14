   
//상품 삭제 시 확인창을 띄우는 함수
function deleteConfirm(no, productName){
	let deleteConfirm = confirm(no +'번 상품 : ' + productName + ' 삭제합니다');
	if(deleteConfirm){
		location.href = "/admin/product-edit/delete?no=" + no;
	}
}

//이미지 업로드 시 미리보기 기능 구현
function setImg(event, imgId) {
	let reader = new FileReader();
	reader.onload = e => {
		let img = document.getElementById(imgId);
		img.src = e.target.result;
	}
	reader.readAsDataURL(event.target.files[0]);				
};
