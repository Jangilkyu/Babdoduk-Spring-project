
//js 시작
$(function(){
	
	//검색시작
	$('#btnSearch').on('click',function(){
		//alert('검색버튼 클릭');
		
		//검색에 필요한 값 가져오기
		let inputKeyword = $('#keyword').val();
		//alert(inputKeyword);
		
		//만약 검색할 키워드를 입력하지 않고 검색했을 경우
		if(inputKeyword == ''){
			alert('키워드를 입력 후 사용해주세요.');
			return;
		}//end if
		
		//정상적인 값을 가지고 왔다면 키워드 전역변수에 값을 넣어준다.
		keyword = inputKeyword;
		
		//이후 키워드를 가지고 검색
		loadList(1,keyword);
	})

})