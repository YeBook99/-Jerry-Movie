<div align="center">
  
## 🧀 JERRY MOVIE _ 실시간 영화 예매 사이트
실시간 영화 예매 사이트
</div>

<br>

> Full-Stack
> <br>
> 2024.07.24 ~ 2024.08.21

<br>

### ✏️ Summary

##### 친숙한 캐릭터의 이름으로 사용자가 친근하게 접근할 수 있는 실시간 영화 예매 사이트입니다.
##### 실시간 좌석 확인 및 예매 기능을 지원하고, 다양한 영화 정보와 리뷰를 제공함으로써 편리한 영화 예매가 가능합니다.
##### 자체 이벤트 진행으로 사용자들의 접근성을 높이고자 하였습니다.

<br>

### 🛠 ️Skills
![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=java&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![Spring](https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white)
![MyBatis](https://img.shields.io/badge/MyBatis-0A53A1?style=flat-square&logo=mybatis&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-F6A800?style=flat-square&logo=java&logoColor=white)
![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=flat-square&logo=jquery&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=flat-square&logo=apache-tomcat&logoColor=black)
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white)

![Naver OAuth2](https://img.shields.io/badge/Naver%20OAuth2-03C75E?style=flat-square&logo=naver&logoColor=white)
![Kakao OAuth2](https://img.shields.io/badge/Kakao%20OAuth2-FFCD00?style=flat-square&logo=kakao&logoColor=black)
![Google OAuth2](https://img.shields.io/badge/Google%20OAuth2-4285F4?style=flat-square&logo=google&logoColor=white)

![SMTP Naver](https://img.shields.io/badge/SMTP%20(Naver%20Mail)-03C75A?style=flat-square&logo=naver&logoColor=white)

<br>

### 👩‍💻 My Role
#### 👤 인증 및 계정 관리
##### 1. 로그인
- DB에서 일치하는 아이디, 비밀번호 매치 후 로그인
- 로그인한 계정이 관리자 계정일 시 관리자 페이지로 연결
##### 2. 소셜 로그인
- 구글은 사용자의 전화번호를 제공하지 않아 구글 로그인 시 사용자의 이메일을 DB의 이메일과 매치하여 로그인
- 네이버, 카카오 로그인 시 사용자의 전화번호, 이메일을 DB의 전화번호, 이메일과 매치하여 로그인
##### 3. 회원가입
- AJAX를 활용한 아이디, 이메일 입력 시 실시간 중복 확인 문구 노출
- 네이버 SMTP 프로토콜을 통한 이메일 인증 구현
##### 4. 아이디 찾기 / 비밀번호 재설정
- 1차로 입력한 정보를 DB와 모두 일치하는지 여부 확인
- 아이디 찾기 시 1차 DB 검증 후 아이디의 일부만 조회 가능
- 전체 아이디 조회 시 네이버 SMTP 프로토콜을 통하여 메일로 전체 아이디 발송
- 비밀번호 재설정 시 네이버 SMTP 프로토콜을 통한 이메일 인증 진행
- 이메일 인증 완료 시 비밀번호 재설정 가능

#### 🖥️ Front-End
##### - 메인 페이지 UI
<img src="etc/메인UI_1.png" alt="Project Logo" style="width: 100%; height: auto;" />
<img src="etc/메인UI_2.png" alt="Project Logo" style="width: 100%; height: auto;" />
<img src="etc/메인UI_3.png" alt="Project Logo" style="width: 100%; height: auto;" />

---

##### - 로그인 페이지 UI
<img src="etc/로그인UI.png" alt="Project Logo" style="width: 100%; height: auto;" />

<br>

### 📋 ERD
<img src="etc/다이어그램ver1.4.png" alt="Project Logo" style="width: 100%; height: auto;" />
