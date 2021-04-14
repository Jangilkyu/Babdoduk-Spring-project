 
//상품 등록 및 수정 시 정보 유효성을 검사하는 함수
function checkProductForm(formtype){
	
	let test = document.getElementsByClassName('product_main_img');
	
	// 숫자만 있어야 하는 항목들
	let reg = /^[0-9]+$/;
	let regTarget = new Map();
	regTarget.set(document.getElementById('product_stock'), '재고');
	regTarget.set(document.getElementById('product_caloies'), '칼로리');
	regTarget.set(document.getElementById('product_price'), '가격');
	
	// 재고, 칼로리, 가격 항목에 숫자만 있는지 확인
	for(let [key, name] of regTarget){
		if(!reg.test(key.value)){
			numClean(key, name);
			return false;
		}
	}

	// 텍스트 필수 기재인 항목들 
	let checkTarget = new Map();
	checkTarget.set(document.getElementById('product_category'), '카테고리');
	checkTarget.set(document.getElementById('product_title'), '상품명');
	checkTarget.set(document.getElementById('product_subtitle'), '상품 부제');
	checkTarget.set(document.getElementById('product_detail_text'), '상세설명');
	checkTarget.set(document.getElementById('product_origin'), '원산지');
	checkTarget.set(document.getElementById('product_ingredient'), '재료');
	
	// 해당 항목들에 기재된 내용이 있는지 확인
	for(let [key, name] of checkTarget){
		if(key.value == ''){
			textClean(key, name);
			return false;
		}
	}
	
	if(formtype == 'register'){
		// 이미지 경로를 통해 필수 이미지가 있는지 확인
		let img = document.getElementById('mainImgFile');
		let detail1 = document.getElementById('detailImgFile1');
		
		if(img.value == ''){
			alert('메인이미지는 필수로 있어야 합니다')
			img.focus();
			return false;
		}
		
		if(detail1.value == ''){
			alert('상세이미지1은 필수로 있어야 합니다')
			detail1.focus();
			return false;
		}
	}

	return true;
}

//세일 등록 시 유효성을 검사하는 함수
function checkSaleForm(){
	let reg = /^[0-9]+$/;
	let salePrice = document.getElementById('salePrice');
	let originPrice = document.getElementById('productPrice').value;
	let productNo = document.getElementById('productNo').value;
	let start = document.getElementById('startDate').value + document.getElementById('startTime').value;
	let end = document.getElementById('endDate').value + document.getElementById('endTime').value;

	//상품을 선택했는지 검증
	if(productNo == ''){
		alert('할인 할 상품을 선택하세요');
		return false;
	}
	
	//세일가를 기입했는지 확인
	if(salePrice.value == ''){
		textClean(salePrice, '할인가');
		return false;
	}
	
	//세일가에 숫자만 들어있는지 확인
	if(!reg.test(salePrice.value)){
		numClean(salePrice, '할인가');
		return false;
	}
	
	//세일가가 정상가보다 낮은지 확인
	if(salePrice.value >= originPrice){
		alert('할인가는 원가격보다 낮아야합니다');
		salePrice.value = '';
		salePrice.focus();
		return false;
	}
	
	//세일 기간이 정상적으로 설정되었는지 확인
	if(start >= end){
		alert('할인 종료일이 시작일보다 이르거나 같습니다\n기간을 확인하고 다시 설정하세요');
		return false;
	}
	
	return true;
	
}

function numClean(target, name){
	alert(name + ' 항목에는 숫자만 넣어주세요');
	target.value = '';
	target.focus();
}

function textClean(target, name){
	alert(name + ' 항목은 필수 기재 항목입니다');
	target.focus();
}



//상품 삭제 시 확인창을 띄우는 함수
function deleteConfirmProduct(no, productName){
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
	try{
		reader.readAsDataURL(event.target.files[0]);						
	}catch{
		document.getElementById(imgId).src = '/img/empty.png';
	}
};


//할인 삭제 시 확인창을 띄우는 함수
function deleteConfirmSale(no){
	let deleteConfirm = confirm(no +'번 상품 할인을 삭제합니다');
	if(deleteConfirm){
		location.href = "/admin/sale-edit/delete?no=" + no;
	}
}


//상품 검색창 띄우기
function popupSearch(){
	let width = 800;
	let height = 600;
	let xpos = Math.ceil(( window.screen.width - width )/2);
	let ypos = Math.ceil((window.screen.height - height)/2) - 80;
	window.open('http://localhost:8080/admin/product-search', '상품 검색', 'width=800, height=600, left=' + xpos + ', top=' + ypos);
}

//상품명 검색 시 검색 결과를 바로바로 반영하는 기능
//searchBoxId : 검색어가 입력되는 input 칸의 id
function search(searchBoxId){
	//검색 키워드를 입력창에서 키가 입력될 때 마다 받아옴
	let keyword = document.getElementById(searchBoxId).value;
	let data = {'keyword' : keyword};
	if(keyword != ''){
		$.ajax({
			url:'/admin/product-search',
			data: data,
			type:'post',
			success:function(data){
				$("#resultList").empty();
				$("#resultList").append('<th>상품번호</th><th>카테고리</th><th>상품명</th><th>재고</th><th>원가격</th>');
				
				$.each(data, function(index, item){
					let tr = $("<tr></tr>");
					let td1 = $("<td></td>").html(item.product_no);
					let td2 = $("<td></td>").html(item.product_category);
					let td3 = $("<td></td>").html(item.product_title);
					let td4 = $("<td></td>").html(item.product_stock);
					let td5 = $("<td></td>").html(item.product_price);
					
					$(tr).click(function(){
						sendItem(item);
					});
					$(tr).append(td1,td2,td3,td4,td5);
					$("#resultList").append(tr);
				})
			}
		})
	}
}

//상품 검색창을 호출한 부모창의 주소에 따라 갖고있는 상품 정보 처리
function sendItem(item){
	let target = window.opener.location.href

		// 세트 등록창의 경우, 구성품 목록에 추가시킴
		if(target.includes('set-register') || target.includes('set-edit')){
			let productNoData = '<div class="form-group product-no-group" id="' +
			item.product_no + '"> ' +
			'<label for="productNo" class="sr-only">번호</label><input type="hidden" name="productNo" value=' + 
			item.product_no + '></div>';
			let tr = $("<tr></tr>");
			let td1 = $("<td></td>").html(item.product_no);
			let td2 = $("<td></td>").html(item.product_category);
			let td3 = $("<td></td>").html(item.product_title);
			let td4 = $("<td></td>").html(item.product_price);
			let td5 = $("<td></td>").html(item.product_stock);
			let td6 = $("<td></td>").html('<i class="fas fa-window-close" onclick="deleteRow(this,' + 
											item.product_no + ')"</i>');
			$(tr).append(td1,td2,td3,td4,td5,td6);
			$(opener.document).find('#component-list').append(tr);
			$(opener.document).find('#set-register').append(productNoData);
			window.close();
		}
			


		// 세일 등록창의 경우, 필요한 상품 정보를 골라 넘김
		if(target.includes('sale-register')){
			
			opener.document.getElementById("productNo").value = item.product_no;
			opener.document.getElementById("productTitle").value = item.product_title;
			opener.document.getElementById("productPrice").value = item.product_price;
			window.close();
		}


}

//세트 구성품 목록에서 테이블 행을 삭제하고 폼에서 hidden으로 전달되는 값도 삭제 
function deleteRow(obj, index){
	document.getElementById(index).remove();
	let tr = $(obj).parent().parent();
	tr.remove();
}


