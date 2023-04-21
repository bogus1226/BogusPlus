<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 부트스트랩 4.0 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
	<!-- swiper-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	<link rel="stylesheet" href="/static/css/swiper.css" type="text/css">
<title>영화 메인화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">

		<header>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div class="headerLogo ml-5 pt-2 mr-4">Bogus+</div>
					<nav class="ml-5 pt-2 nav-item d-flex" id="movieHeaderLink">
						<a href="#" class="nav-link"><i class="bi bi-house-fill mr-1"></i>홈</a>
						<a href="#" class="nav-link"><i class="bi bi-search mr-1"></i>검색</a>
						<a href="#" class="nav-link"><i class="bi bi-plus-lg mr-1"></i>관심콘텐츠</a>
						<a href="#" class="nav-link"><i class="bi bi-caret-right-square-fill mr-1"></i>영화</a>
						<a href="#" class="nav-link"><i class="bi bi-chat-fill mr-1"></i>수다 <span class="textYellow">(스포주의)</span></a>
					</nav>
				</div>
				<div class="profile-container">
					<div class="profile mt-2 mr-2">
						<hr class="m-0">
						<div class="d-flex align-items-center">
							<div class="nickName mt-2 mr-2">${userName}</div>
							<div class="profileCircle mt-1"><img src="/static/image/groot.jpg"></div>
						</div>
						<hr class="m-0 mt-1">
					</div>
					<div>zz</div>
				</div>
			</div>
		</header>
		
		<!-- 메인화면의 상단 인기영화 10개 슬라이드 포스터 -->
		<div class="swiper swiper-box poster-contents mt-4">
   			<div class="swiper-wrapper posterBox">
   				<c:forEach var="popularPosterList" items="${mainPagePopularPosterList}">
        			<a href="#" class="swiper-slide">
        				<img src="${popularPosterList.backdrop_path}">
        				<span class="movie-title">${popularPosterList.title}<br><br><span class="movie-overview">${popularPosterList.overview}</span></span>
        			</a>
        		</c:forEach>
    		</div>
    		<div class="swiper-pagination mr-3"></div>
    		<div class="swiper-button-prev"></div>
    		<div class="swiper-button-next"></div>
		</div>
		
		<section class="movie-contents">
			<div class="movie-conteiner">
				<div class="swiper swiper-content">
					<div class="textWhite">시청 중인 콘텐츠</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="koreaMovieList" items="${mainpageKoreaMovieList}" varStatus="status">
							<a href="#" class="movie-box swiper-slide"><img src="${koreaMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next movieNextBtn"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">한국 콘텐츠</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="koreaMovieList" items="${mainpageKoreaMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${koreaMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next movieNextBtn"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">오늘의 <span class="logo">TOP</span> 콘텐츠</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="todayTopMovieList" items="${mainPageTodayTopMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${todayTopMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">애니메이션 영화</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="animationMovieList" items="${mainPageAnimationMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${animationMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">액션 <span class="icon">&</span> 스릴러</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="actionMovieList" items="${mainPageActionMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${actionMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">코미디</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="comedyMovieList" items="${mainPageComedyMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${comedyMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">로맨스</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="romanceMovieList" items="${mainPageRomanceMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${romanceMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite logo">SF</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="sfMovieList" items="${mainPageSFMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${sfMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">호러</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="horrorMovieList" items="${mainPageHorrorMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${horrorMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">가족</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="familyMovieList" items="${mainPageFamilyMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${familyMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">모험</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="adventureMovieList" items="${mainPageAdventureMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${adventureMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">판타지</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="fantasyMovieList" items="${mainPageFantasyMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${fantasyMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">전쟁</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="warMovieList" items="${mainPageWarMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${warMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">모험</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="musicMovieList" items="${mainPageMusicMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${musicMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">범죄</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="crimeMovieList" items="${mainPageCrimeMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${crimeMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">다큐멘터리</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="documentaryMovieList" items="${mainPageDocumentaryMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${documentaryMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
				
				<div class="swiper swiper-content">
					<div class="textWhite">역사</div>
					<div class="swiper-wrapper contents d-flex mt-2">
						<c:forEach var="historyMovieList" items="${mainPageHistoryMovieList}">
							<a href="#" class="movie-box swiper-slide"><img src="${historyMovieList.poster_path}"></a>
						</c:forEach>
					</div>
					<div class="swiper-button-prev"></div>
    				<div class="swiper-button-next"></div>
				</div>
			</div>
			
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		let click = null;
		
		$(".movieNextBtn").on("click", function(e){
			 click = 1;
			 
			 console.log(e);
			 
			 $.ajax({
					type:"get"
					, url:"/movie/mainpage/view"
					, data:{"click":click}
					, success:function(){
						alert("클릭 성공");
					}
					, error:function(){
						alert("클릭 에러");
					}
					
				});
			
		});
		
		const swiperMovie = new Swiper(".swiper-content", {                 
		    slidesPerView: 7.5,
		    slidesPerGroup : 7,
		    spaceBetween: 20,             
		    navigation: {                      
		        nextEl: ".swiper-button-next",
		        prevEl: ".swiper-button-prev",
		    },
		})
		
		const swiper = new Swiper(".swiper-box", {
		    loop: true,                        
		    slidesPerView: 1.1,
		    centeredSlides : true,
		    spaceBetween: 20,               
		    autoplay: {                         
		        delay: 2000,  
		    },                   
		    pagination: {                       
		        el: ".swiper-pagination",
		        clickable: true,
		    },
		    navigation: {                      
		        nextEl: ".swiper-button-next",
		        prevEl: ".swiper-button-prev",
		    },
		})
		
		$(".swiper-box").each(function(elem, target){
		    var swp = target.swiper;
		    $(this).hover(function() {
		        swp.autoplay.stop();
		    }, function() {
		        swp.autoplay.start();
		    });
		});
	


	});
</script>
</html>
