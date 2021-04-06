<h1 align="center">🥗다양한 반찬이 필요할 땐?! 밥도둑 🥙</h1>

# 디렉토리 구조
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

## **프로젝트를 진행하면서 느낀점**

학원에서 처음으로 혼자서 프로젝트도 만들어보고 학원에서 만난 동료 개발자들과 처음으로 협업을 해보았습니다. 3주라는 짧은 기간동안 깃,브랜치 낯설었던 협업을 위한 툴에 익숙해지고 버전관리를 하면서 효율적인 코드에 대해서 많이 고민해 보았습니다. 좋은 동료들을 만나서 팀원 분들에게 감사드립니다.

<img src ="https://user-images.githubusercontent.com/69107255/113604222-eca23b00-967f-11eb-866f-3ad57e093f56.png">

<img src ="https://user-images.githubusercontent.com/69107255/113604293-0774af80-9680-11eb-996e-8c825294d125.png">

<img src ="https://user-images.githubusercontent.com/69107255/113604601-781bcc00-9680-11eb-88f3-22e52f4feb5b.png">