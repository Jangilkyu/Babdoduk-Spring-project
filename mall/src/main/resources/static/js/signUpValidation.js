//아이디 혹은 이메일이 존재할 경우 DB에서 1을 반환하기 때문에 상수처리 및 가독성 증가
const EXISTID = 1;
const SIGNUPSUCCESS = 1;
//아이디 및 이메일 중복검사 후 결과 저장
let validationArr = new Array(2).fill(false);

//정규식
let id = /^[a-z0-9][a-z0-9_\-]{4,11}$/;
let pwd = /^[A-Za-z0-9]{6,12}$/;
let name = /^[가-힣]{2,5}$/;
let email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
let phone = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

//validation
let signUpValidation = {
    init : function (){
        let _this = this;

        $('#mem_id').on('blur' , function (){
            _this.idVaildation();
        });
        $('#mem_pwd').on('blur',function (){
            _this.pwdValidation();
        });
        $('#mem_pwd2').on('blur',function (){
            _this.pwd2Validation();
        });
        $('#mem_name').on('blur',function (){
            _this.nameValidation();
        });
        $('#mem_email').on('blur',function (){
            _this.emailValidation();
        });
        $('#mem_phone').on('blur',function (){
            _this.phoneValidation();
        })
        $('#signUpReset').on('click',function (){
            _this.reset();
        })
    },
    //아이디 유효성 검사
    idVaildation : function (){
        //아이디 입력은 브라우저에서 잡아주고 유효한 값인지 검사
        if(id.test($('#mem_id').val())!=true){
            $('#id_check').text('5~12자의 영문 소문자, 숫자, 특수문자 (_),(-)만 가능합니다.');
            $('#id_check').css('color','red');
        //유효성 검사에 통과했다면            
        }else{
          
            //ajax통신을 하여 중복값을 확인하고
            $.ajax({
                url:'/idCheck.do',
                type:"post",
				data:$('#mem_id').val(),
                dataType:'json',
                contentType:'application/json; charset=utf-8'
            }).done(function (response){
                    //아이디가 중복됬다는 가정에 경고창을 생성하고
                    $('#id_check').text('이미 존재하는 아이디 입니다.');
                    $('#id_check').css('color','red');
                    //만약 중복이 되지 않으면 
                    if(response !== EXISTID){
                        //사용가능하다고 안내하고
                        $('#id_check').text('사용가능한 아이디 입니다.');
                        $('#id_check').css('color','blue');
                        //사용가능한 아이디라면 입력창에 일기전용을 추가해서 다음으로 넘어간다.
                        $('#mem_id').prop('readonly',true);
                        validationArr[0] = true;
                    }//if
            }).fail(function (error){
                alert(JSON.stringify(error))
            });
        }//end if
    },
    //비밀번호 유효성 검사
    pwdValidation : function (){
        //만약 유효한 값이라면 넘어간다.
        if(pwd.test($('#mem_pwd').val())) {
            $('#pw_check').text('사용가능한 비밀번호 입니다.');
            $('#pw_check').css('color', 'blue');
            return;
        }
        //기본값
        $('#pw_check').text('숫자와 문자 포함 형태의 6~12자리만 가능합니다.');
        $('#pw_check').css('color', 'red');
    },
    //비밀번호 확인 유효성 검사
    pwd2Validation : function (){
        //만약 유효한 값이라면 넘어간다.
        if(pwd.test($('#mem_pwd2').val()) && ($('#mem_pwd').val()===$('#mem_pwd2').val())){
            $('#pw2_check').text('비밀번호가 일치합니다.');
            $('#pw2_check').css('color', 'blue');
            return;
        }
        //기본값
        $('#pw2_check').text('숫자와 문자 포함 형태의 6~12자리만 가능하며 입력한 비밀번호와 동일해야 합니다.');
        $('#pw2_check').css('color', 'red');
    },
    //이름 유효성 검사
    nameValidation : function (){
        //만약 유효한 값이라면 넘어간다.
        if(name.test($('#mem_name').val())){
           $('#name_check').text('');
           return;
        };
        //기본값
        $('#name_check').text('한글 2~5자 이내로 입력하세요. (특수기호, 공백, 숫자, 영문 사용 불가');
        $('#name_check').css('color','red');
    },
    //이메일 유효성 검사
    emailValidation : function (){
        //만약 유효한 값이라면 넘어간다.
        if(email.test($('#mem_email').val())!=true){
            $('#email_check').text('이메일 형식에 맞춰서 입력해주세요');
            $('#email_check').css('color','red');
        //유효한 값이라면    
        }else{
            //ajax 통신 후 중복 검사
            $.ajax({
                url:'/emailCheck.do',
                type:'post',
                data:$('#mem_email').val(),
                dataType:'json',
                contentType:'application/json; charset=utf-8'
            }).done(function (response){
                //기본 값을 존재하는 이메일로 설정
                $('#email_check').text('이미 존재하는 이메일 입니다.');
                $('#email_check').css('color','red');
                //만약 가입되어 있지 않은 이메일이라면
                if(response !== EXISTID){
                    //사용가능하다고 안내하고
                    $('#email_check').text('사용가능한 이메일 입니다.');
                    $('#email_check').css('color','blue');
                    //사용가능한 이메일이라면 입력창에 일기전용을 추가해서 다음으로 넘어간다.
                    $('#mem_email').prop('readonly',true);
                    //중복검사 통과하면 true값 저장
                    validationArr[1] = true;
                }//if
            }).fail(function (error){
                alert(JSON.stringify(error))
            })
        }
    },
    //휴대폰 번호 유효성 검사
    phoneValidation : function (){
        //만약 유효한 값이라면 넘어간다.
        if(phone.test($('#mem_phone').val())){
            $('#phone_check').text('');
            return;
        }//end if
        //기본값
        $('#phone_check').text('휴대폰 번호를 형식에 맞게 입력해주세요. (-없이)');
        $('#phone_check').css('color','red');
    },
    //다시 입력
    reset : function (){
        //다시 false값으로 변경
        validationArr.fill(false);
        $('#id_check').text("");
        $('#email_check').text('');
        $('#mem_id').prop('readonly',false);
        $('#mem_email').prop('readonly',false);
    }
}

//회원가입 을 눌렀을 경우
let signUpSubmit = {

    init : function (){
        let _this = this;
        $('#signUpBtn').on('click',function (){
           _this.signUp();
        });
    },
    signUp : function (){

        let data = {
            mem_id : $('#mem_id').val(),
            mem_pwd : $('#mem_pwd').val(),
            mem_name : $('#mem_name').val(),
            mem_birth : $('#mem_birth').val(),
            mem_email : $('#mem_email').val(),
            mem_phone : $('#mem_phone').val(),
            mem_zipCode : $('#mem_zipCode').val(),
            mem_address : $('#mem_address').val(),
            mem_detailAddress : $('#mem_detailAddress').val()
        };
        
        //유효성 검사
        if(!id.test(data.mem_id)){
            alert('아이디를 확인해주세요');
            return false;
        }//end if

        if(!pwd.test(data.mem_pwd) || !pwd.test($('#mem_pwd2').val())){
            alert('비밀번호를 확인해주세요');
            return false;
        }//end if

        if(!data.mem_pwd === $('#mem_pwd2').val()){
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')
            return false;
        }

        if(!name.test(data.mem_name)){
            alert('이름을 확인해주세요');
            return false;
        }//end if

        if(!email.test(data.mem_email)){
            alert('이메일을 확인해주세요');
            return false;
        }//end if

        if(!phone.test(data.mem_phone)){
            alert('휴대폰 번호를 확인해주세요');
            return false;
        }//end if

        if(data.mem_address === '' || data.mem_zipCode === ''){
            alert('우편번호 검색을 해주세요');
            return false;
        }

        if(validationArr[0] === false || validationArr[1] === false){
            alert('아이디 및 이메일 중복검사를 진행해주세요')
            return  false;
        }

        //유효성 검사가 통과한다면 ajax통신으로 DB처리
        $.ajax({
            url:'/signUp.do',
            type: 'post',
            data:JSON.stringify(data),
            contentType: 'application/json; charset=utf8',
            dataType: 'json'
        }).done(function (response){
            //회원가입이 완료되면 로그인 페이지로 이동
            if(response == SIGNUPSUCCESS){
                alert('회원 가입이 완료되었습니다.');
                window.location.href='/';
            }//end if
        }).fail(function (error){
            alert('오류가 발생하였습니다 잠시 후 다시 시도해주세요.');
            window.location.href='/';
        })
    }//sign up
}//signUpSubmit

//init 실행
signUpValidation.init();
signUpSubmit.init();