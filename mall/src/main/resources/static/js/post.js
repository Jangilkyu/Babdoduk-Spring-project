let  post = {
    init : function (){
        let _this = this;
        $('#postBtn').on('click',function (){
            _this.addPost();
        })
    },
    addPost : function (){
        new daum.Postcode({
            oncomplete: function(data) {   
                let addr = data.roadAddress;
                if(data.userSlectedType !== 'R'){
                    addr = data.jibunAddress;
                }
                //이 후 회원가입 창에 값을 넣어준다.
                //우편번호 넣기
                $('#mem_zipCode').val(data.zonecode);
                //주소 넣기
                $('#mem_address').val(addr);
                //다음 상세주소로 포커싱
                $('#mem_detailAddress').focus();
            }
        }).open();
    }
}
post.init();