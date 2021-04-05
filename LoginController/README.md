# **LoginController**

# **로그인 View**
- `아이디`와 `비밀번호` 유효성 검증은 서버로 넘어간 후 검증하였습니다.

<img src ="https://user-images.githubusercontent.com/69107255/113581679-6fb49880-9662-11eb-9725-19c62c25c9b0.png">

- **아이디 불일치 시**
<img src ="https://user-images.githubusercontent.com/69107255/113582037-d76ae380-9662-11eb-9234-e1476743b9d7.png">

- **비밀번호 불일치 시**
<img src ="https://user-images.githubusercontent.com/69107255/113581914-baceab80-9662-11eb-8e4b-3b3ac1ef97e5.png">

# **아이디 찾기**

- 아이디 찾기는 [휴대폰인증] 및 [이메일인증] 둘 다 radio 박스를 통해 클릭 시 보여지는 형식입니다.

<img src ="https://user-images.githubusercontent.com/69107255/113582263-1c8f1580-9663-11eb-96da-d153608a473c.png">

## **[회원정보에 등록한 휴대전화로 인증] 클릭 시**

1. radio박스를 클릭하면 아래와 같이 [이름],[휴대전화],[인증번호]를 클릭 할 수 있는 박스가 나옵니다.

<img src ="https://user-images.githubusercontent.com/69107255/113582424-53652b80-9663-11eb-8342-8d809346a96c.png">

3. [이름]과 [휴대전화]를 입력 후 존재하는 회원이 있다면 아래와 같이 문자 메시지 발송 후 [인증번호]input태그가 활성화가 됩니다

<img src ="https://user-images.githubusercontent.com/69107255/113583788-0bdf9f00-9665-11eb-80a9-0f3c8cb7610c.png">

<img src ="https://user-images.githubusercontent.com/69107255/113583514-b3100680-9664-11eb-817a-8b9838c805ee.png">

4. toastr을 이용해 만약 인증번호가 일치하지 않을 시 경고 문구를 화면에 뿌려줍니다.

<img src ="https://user-images.githubusercontent.com/69107255/113584058-62e57400-9665-11eb-8be3-ebea9532245d.png">

5. 만약 인증번호가 일치 시에 아래와 같이 아이디를 보여준 후 [로그인] 또는 [비밀번호 찾기]로 이동합니다. 

<img src ="https://user-images.githubusercontent.com/69107255/113584433-d8e9db00-9665-11eb-970c-24286b9bd47b.png">

## **[본인확인 이메일로 인증] 클릭 시 **

- 위와 방식은 동일합니다.

<img src ="https://user-images.githubusercontent.com/69107255/113582605-87d8e780-9663-11eb-8361-adaa4ff2ddae.png">

1. [인증번호] 일치 시 아래와 같은 인증 메일을 발송합니다.

<img src ="https://user-images.githubusercontent.com/69107255/113584778-4269e980-9666-11eb-81f7-d8727ebfc991.png">

# **비밀번호 찾기**

<img src ="https://user-images.githubusercontent.com/69107255/113584946-84932b00-9666-11eb-9940-fd2413033bac.png">

1. 존재하는 아이디가 없거나 공백으로 [다음] 버튼 클릭 시

<img src ="https://user-images.githubusercontent.com/69107255/113585101-b906e700-9666-11eb-8e13-37c6df8f82df.png">

2. 회원 정보에 [등록한 휴대전화번호]로 인증 할 수 있습니다.

<img src ="https://user-images.githubusercontent.com/69107255/113585271-f9fefb80-9666-11eb-843d-e0f555687aed.png">

- 만약 [이름] 및 [휴대전화]가 공백일 경우

<img src ="https://user-images.githubusercontent.com/69107255/113585575-5feb8300-9667-11eb-88b2-ea9dbbd1edcd.png">

3. [이름] 및 [휴대전화] 일치한 회원이 있을 경우 [인증번호]input태그가 활성화 되면서 toastr로 안내 멘트를 띄워준다.

<img src ="https://user-images.githubusercontent.com/69107255/113585662-801b4200-9667-11eb-81c7-1cb4af61da9c.png">

4. 비밀번호를 변경할 수 있습니다.

<img src ="https://user-images.githubusercontent.com/69107255/113585996-eb651400-9667-11eb-8a1f-80ae1a6d5d38.png">