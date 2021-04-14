<h1 align="center">🥗다양한 반찬이 필요할 땐?! 밥도둑 🥙</h1>

<img src ="https://user-images.githubusercontent.com/69107255/113665638-c664b580-96e8-11eb-93a2-a49fd3d65c23.png">

> 밥도둑은 현대인을 겨냥한 음식, 특히 반찬 전문 쇼핑몰 이용자와 운영자가 필요한 음식과 반찬을 
편하게 사고 팔 수 있도록 합니다.
> 쇼핑몰의 기본적인 기능에 더해 각정 편의기능을 더하고자 했습니다.

## 🛠️ 개발환경
<img src ="https://user-images.githubusercontent.com/69107255/114660025-92fcd900-9d2f-11eb-9031-1c26d7cd3917.png">

## **🌭 프로젝트 구현 목록**
- 로그인
    - 아이디 찾기
    - 비밀번호 찾기
- 마이페이지
    - 이메일 및 휴대전화 변경
    - 배송지 관리
    - 내가 한 문의
    - 비밀번호 변경
    - 회원 탈퇴
- 1:1 문의 게시판
- 결제 구현 

## **🍕 프로젝트에서 내가 구현한 디렉토리 구조**
```
📁mall
├📁src/main/java
├── 📁com.mall
│   ├─📄MallApplication.java
│   └─📄ServletInitializer.java
├── 📁com.mall.config
│   ├─📄LoginMvcConfig.java
│   └─📄SmtpComponent.java
├── 📁com.mall.controller
│   ├─📄InquiryController.java
│   ├─📄LoginController.java
│   ├─📄MypageController.java
│   └─📄OrderController.java
├── 📁com.mall.dao.order
│   └─📄OrderDao.java
├── 📁com.mall.dao.user
│   └─📄UserDAO.java
├── 📁com.mall.dao.inquiry
│   └─📄InquiryDao.java
├── 📁com.mall.dao.mypage
│   └─📄MypageDao.java
├── 📁com.mall.interceptor
│   └─📄LoginSessionListener.java
├── 📁com.mall.vo.Order
│   └─📄CartVo.java
│   └─📄OrderInfo.java
│   └─📄OrderListVo.java
│   └─📄OrderProdListVo.java
│   └─📄OrderShippingVo.java
│   └─📄OrderVo.java
├── 📁com.mall.vo.user
│   └─📄LoginRequestVo
└─🥬application.properties
📁src/main/resources
├──📁static
│   └─📁css
│    └─📄order.css
│     └─📁mypage
│       └─📄 deleteAccount.css
│       └─📄 idInquiry.css
│       └─📄 inquiryDetail.css
│       └─📄 inquiryList.css
│       └─📄login.css
│       └─📄myInqDetail.css
│       └─📄myInquiry.css
│       └─📄mypage.css
│       └─📄resetPassword.css
│       └─📄userInfoUpdate.css
│       └─📄viewInputPasswd.css
│       └─📄viewIdList.css
│       └─📄pwdInquiry.css
│       └─📄wrap.css
├─📁admin
│  └─📄deleteAccount.js
│  └─📄emailcertification.js
│  └─📄phonecertification.js
│  └─📄idInquiry.js
│  └─📄inquiry.js
│  └─📄inquiryDetail.js
│  └─📄inquiryValid.js
│  └─📄myposts.js
│  └─📄inquiryValid.js
│  └─📄resetPassword.js
│  └─📄ship.js
│  └─📄updateShipping.js
│  └─📄updateShipping.js
│  └─📄viewInputPasswd.js
│  └─📄viewPwdAuth.js
├📁WEB-INF
└─📁views
│ └─📁admin
│  └─📄inquiryDetail.jsp
│  └─📄inquiryList.jsp
├─📁login
│  └─📄idInquiry.jsp
│  └─📄pwdInquiry.jsp
│  └─📄userLogin.jsp
│  └─📄viewIdList.jsp
│  └─📄viewInputPasswd.jsp
│  └─📄viewInputPasswd.jsp
│  └─📄viewPwdAuth.jsp
├─📁mypage
│ └─📄deleteAccount.jsp
│ └─📄mypage.jsp
│ └─📄resetPassword.jsp
│ └─📄resetPwd.jsp
│ └─📄updateShipping.jsp
│ └─📄userInfoUpdate.jsp
├─📁payment
│ └─📄order.jsp
├📄pom.xml
```

## 🧀 메인 컨테이너

<table>
<tr>
    <td align="center">
    <a href="https://github.com/Jangilkyu"><img src="https://user-images.githubusercontent.com/69107255/114660602-904eb380-9d30-11eb-9b24-28f58d531a81.jpg" width="75px;" alt="IlkyuJang"/><br /><sub><b>장일규</b></sub></a><br />
    </td>
    <td>
    <a href="" title="what did I do">💻what did I do</a>
    <br/>
        <a href="https://github.com/noweyhc/foodmall_prj/commits?author=Jangilkyu" title="Code">📜 Commit Log</a>
        <br/>
    </td>
</tr>
</table>


## **🍗4. 프로젝트를 진행하면서 느낀점**

```
학원에서 만난 동료 개발자들과 처음으로 협업을 해보았습니다. 3주라는 짧은 기간동안 깃,브랜치 낯설었던 협업을 위한 툴에 익숙해지고 버전관리를 하면서 효율적인 코드에 대해서 많이 고민해 보았습니다. 좋은 동료들을 만나서 팀원 분들에게 감사드립니다.
```

![](https://user-images.githubusercontent.com/69107255/114662711-20dac300-9d34-11eb-9b36-b3c284b2ce06.gif)


<img src ="https://user-images.githubusercontent.com/69107255/113604293-0774af80-9680-11eb-996e-8c825294d125.png">