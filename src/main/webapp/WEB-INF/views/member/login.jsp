<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JERRY - login</title>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section>
		<div class="loginWrap">
			<div class="container" id="login_container">
				<div class="form-container sign-in-container">
					<form action="#">
						<h1>로그인</h1>
						<br>
						<div class="loginSizeBox">
							<input type="text" placeholder="Id" name="id" /> <input
								type="password" placeholder="Password" name="password" /> <a
								href="${path}/memberFind"
								onclick="memberFind(event)">아이디 / 비밀번호 찾기</a> <br>
							<button type="submit" id="login">로그인</button>
							<br>
					</form>
					<button type="button" id="signUp"
						onclick="location.href='${path}/join'">회원가입</button>
				</div>
			</div>
			<div class="overlay-container">
				<div class="overlay">
					<div class="overlay-panel overlay-right">
						<h1>소셜 로그인</h1>
						<br>
						<div class="loginSizeBox">
							<a href=""><img class="socialLogin"
								src="${path}/resources/img/login/네이버로그인1.png" alt="네이버로그인" /></a> <a
								href=""><img class="socialLogin"
								src="${path}/resources/img/login/카카오.png" alt="카카오로그인" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		function memberFind(event) {
			event.preventDefault();
			
			const screenWidth = window.innerWidth;
            const screenHeight = window.innerHeight;
			
            const popupWidth = 400;
            const popupHeight = 600;

            const left = (screenWidth - popupWidth) / 2;
            const top = (screenHeight - popupHeight) / 2;
			
			window.open('${path}/memberFind', 'memberFind', 'width=400,height=600,scrollbars=yes');
		}
	</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>