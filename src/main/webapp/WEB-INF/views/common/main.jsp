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
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- Slick JS 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
<!-- main css파일 -->
<link href="${path}/resources/css/main/main.css" rel="stylesheet" />
<!-- js 파일 -->
<script src="${path}/resources/js/main/main.js"></script>
<title>JERRY MOVIE</title>
</head>
<body>
	<section>

		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- 트레일러 캐러셀 -->
		<div id="carouselExampleCaptions" class="carousel slide">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_10라이브즈예고편.mp4"
						class="d-block w-100 main_trailer">
					</video>
					<div class="fade-out-box">
						<div class="trailer_details">
							<h5 class="trailer_title">10라이브즈</h5>
							<p class="trailer_content">
								엉뚱한 동물로 또 다시 태어난다고?!<br> 배우 소유진 강력 추천 영화!
							</p>
							<button type="button" class="btn btn-light trailer_button">상세보기</button>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_극장총집편예고편.mp4"
						class="d-block w-100 main_trailer">
					</video>
					<div class="fade-out-box">
						<div class="trailer_details">
							<h5 class="trailer_title">극장총집편 봇치 더 록! 전편</h5>
							<p class="trailer_content">
								결속밴드! CGV에서 다시 결속!<br> 8월 7일 대개봉
							</p>
							<button type="button" class="btn btn-light trailer_button">상세보기</button>
						</div>
					</div>
				</div>
				<div class="carousel-item">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_파일럿예고편.mp4"
						class="d-block w-100 main_trailer">
					</video>
					<div class="fade-out-box">
						<div class="trailer_details">
							<h5 class="trailer_title">파일럿</h5>
							<p class="trailer_content">
								웃음 공감 다잡은<br> 일등석 코미디
							</p>
							<button type="button" class="btn btn-light trailer_button">상세보기</button>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<!-- 트레일러 캐러셀 끝 -->
		<!-- 무비차트/상영예정작 -->
		<div class="movie_chart_wrap" style="background-color: #FDFDFB;">
			<div class="movie_chart_button">
				<div class="movie_chart_tabButton">
					<h3>
						<a href="#">무비차트</a>
					</h3>
					<div style="background: lightgray; width: 2px;"></div>
					<h3>
						<a href="#">개봉예정작</a>
					</h3>
				</div>

			</div>

			<div class="slider center">
				<!-- 이미지를 순서에 맞게 배치 -->
				<div>
					<img src="${path}/resources/img/mypageimg/결백.jpg" alt="Slide 1">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/그녀가죽었다.jpg" alt="Slide 2">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/달짝지근해.jpg" alt="Slide 3">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/도그데이즈.jpg" alt="Slide 4">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/드림.jpg" alt="Slide 5">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/범죄도시4.jpg" alt="Slide 6">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/아바타.jpg" alt="Slide 7">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/오늘밤.jpg" alt="Slide 8">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/파묘.jpg" alt="Slide 9">
				</div>
				<div>
					<img src="${path}/resources/img/mypageimg/하이재킹.jpg" alt="Slide 10">
				</div>
			</div>
		</div>
	</section>
</body>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>