<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!--  내가 가지고 있는 파일 포함하기  -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myMovie--container">
        <div class="myMovie--infoBox">
            <div class="myMovie--memberInfo">
                <div style="display: flex;">
                    <div>
                        <img src="${path}/resources/img/mypageimg/열동그라미.png" alt="" class="myMovie--profileimg">
                    </div>
                    <div class="myMovie--memberInfo2">
                        <h2>${member.memberName}님의 마이페이지</h2>
                        <p>${member.memberId}</p>
                    </div>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--stmapcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">스탬프</h3>
                        <h2>${member.memberStamp} / 9</h2>
                    </a>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--couponcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">쿠폰</h3>
                        <h2>${member.memberCoupon}개</h2>
                    </a>
                </div>
            </div>
        </div>
        <div class="myEdit--main">
            <div class="myConfirm--category">
                <div class="myConfirm--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myConfirm--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myConfirm--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myConfirm--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myEdit--content">
                <div class="myEdit--title">
                    <h2>회원정보 수정</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                
                <div class="myEdit--editbox">
                    <form action="editMember" method="post" onsubmit="return validateForm()">
                        <label for="name">이름</label>
                        <input type="text" name="name" id="name" value="${member.memberName}" disabled><br><br>
                        
                        <label for="id">아이디</label>
                        <input type="text" name="id" id="id" value="${member.memberId}" disabled><br><br>
                        
                        <label for="pw">비밀번호</label>
                        <input type="password" name="pw" id="pw" required><br><br>
                        
                        <label for="confrimpw">비밀번호 확인</label>
                        <input type="password" name="confirmpw" id="confirmpw" onkeyup="psCheck()" required>
                        <span id="checkMsg"></span><br><br>
                        
                        <label for="email">이메일</label>
                        <input type="email" name="email" id="email" value="${member.memberEmail}" disabled><br><br>
                        
                        <label for="gender">성별</label>
                        <input type="text" name="gender" id="gender" value="${member.memberGender}" disabled><br><br>
                        
                        <label for="phone">핸드폰</label>
                        <input type="text" name="phone" id="phone" value="${member.memberPhone}" minlength="13" maxlength="13" required><br><br>
                        
                        <input type="submit" value="수정">
                    </form>
                </div>

            </div>

        </div>
    </div>

	<script>
		function psCheck() {
			var pw = document.getElementById("pw").value;
			var confirmpw = document.getElementById("confirmpw").value;
			var checkMsg = document.getElementById("checkMsg");

			if (pw === confirmpw) {
				checkMsg.style.color = "green";
				checkMsg.innerHTML = "비밀번호가 일치합니다.";
			} else {
				checkMsg.style.color = "red";
				checkMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			}
		}

		function validateForm() {
			var pw = document.getElementById("pw").value;
			var confirmpw = document.getElementById("confirmpw").value;

			if (pw !== confirmpw) {
				alert("비밀번호가 일치하지 않습니다!!");
				return false;
			}

		}
	</script>
	
	

</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>