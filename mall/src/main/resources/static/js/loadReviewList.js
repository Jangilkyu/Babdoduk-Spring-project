
//js 시작
$(function(){
	
	
	//검색을 위한 전역변수
	let keyword = '';
	
	
	//페이지 번호와 키워드를 받아서 게시판을 로딩한다.
	function loadList(pageNumber, keyword){
		
		//컨트롤러로 넘길 값을 객체로 생성해서 넘긴다.
		let data = {
			pageNumber : pageNumber,
			keyword : keyword
		}//data
		
		
		//ajax통신을 통해서 해당하는 값을 받아온다.
		$.ajax({
			url:'/loadList',
			type:'post',
			data:JSON.stringify(data),
			datatype:'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(response){
			//넘어온 응답으로는 JSON객체가 넘어오는데 토탈페이지와 리뷰정보를 담은 리스트가 넘어온다.
			let loadedList = response.reviewList;
			let totalPage = response.totalPage;
			
			//여기서 1차 확인 (확인 o)
			//alert(JSON.stringify(loadedList));
			//alert(totalPage);
			
			//먼저 리스트 값 초기화
			$('#reviewListBody').empty();
			
			//리뷰리스트에 값 추가
			$.each(loadedList,function(index,item){
				$('#reviewListBody')
					.append(`<tr>
								<td>${item.review_no}</td>
								<td><a href="reviewDetail/${item.review_no}">${item.review_title}</a></td>
								<td>${item.mem_id}</td>
								<td>${item.review_hit}</td>
								<td>${item.review_update}</td>
							</tr>`)
			})//end each
			
			//페이지 번호 초기화			
			$('#pagiNation').empty();
			//페이지 번호 추가
			for(let i = 1; i<= totalPage; i++){
				//페이지 번호를 생성한다.
				$('#pagiNation').append(`<span id='pagiNation-${i}'>${i}</span>`);
				//생성된 페이지 번호에 이벤트를 추가
				$(`#pagiNation-${i}`).on('click',function(){
					//먼저 span을 선택시 그 span안에 있는 값을 가져온다.
					let page = $(this).text();
					//가져온 페이지 번호와 keyword를 이용해 검색
					loadList(page,keyword);
				})
			}//end for
			
		}).fail(function(error){
			alert(JSON.stringify(error));
		})//end ajax
			
	}//loadList
	
	
	//검색시작
	$('#searchBtn').on('click',function(){
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
	
	
	//페이지 로딩시 페이지번호 1번과 키워드 없는 것으로 검색
	loadList(1,'');
})