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