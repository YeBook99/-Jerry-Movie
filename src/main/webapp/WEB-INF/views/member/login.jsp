<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${!empty joinMsg}">
		<script>
			alert('${joinMsg}');
		</script>
	</c:if>
	<c:if test="${!empty resetNewPw}">
		<script>
			alert('${resetNewPw}');
			window.close();
		</script>
	</c:if>
	<c:if test="${!empty sendId}">
		<script>
			alert('${sendId}');
			window.close();
		</script>
	</c:if>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section>
		<div class="loginWrap">
			<div class="container" id="login_container">
				<div class="form-container sign-in-container">
					<%-- 					<form action="${path}/memberLogin" method="post"> --%>
					<form action="${path}/memberLogin" method="post"
						onsubmit="return loginCheck();">
						<h1>로그인</h1>
						<br>
						<div class="loginSizeBox">
							<input type="text" placeholder="Id" name="id" /> <input
								type="password" placeholder="Password" name="password" /> <a
								href="${path}/memberFind" target="memberFind"
								onclick="this.href=this.href;window.open(this.href, 'memberFind', 'width=400,height=600,scrollbars=no');return false;">아이디
								/ 비밀번호 찾기</a> <br>
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
								href="https://kauth.kakao.com/oauth/authorize?client_id=d3e6a0c61bec8134f5e1f6f551822f3b&redirect_uri=http://localhost:8090/cinema/kakaoLogin&response_type=code"><img class="socialLogin"
								src="${path}/resources/img/login/카카오.png" alt="카카오로그인" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			var loginMessage = "${loginMessage}";
			if (loginMessage) {
				alert(loginMessage);
			}

			// 로그인창 빈칸일 경우 알림창
			function loginCheck() {
				var id = document.querySelector('input[name="id"]').value;
				var password = document.querySelector('input[name="password"]').value;
				
				if(id.trim()==="" || password.trim()===""){
					alert("아이디와 비밀번호를 모두 입력해주세요.");
					return false;
				}
				return true;
			}
			
			
			
			
		</script>

	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>