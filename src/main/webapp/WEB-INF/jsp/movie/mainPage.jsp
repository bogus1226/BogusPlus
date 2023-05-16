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
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-main-movieInfo">
			<!-- 메인화면의 상단 인기영화 10개 슬라이드 포스터 -->
			<div class="swiper swiper-box poster-contents mt-4">
	   			<div class="swiper-wrapper posterBox">
	   				<c:forEach var="popularPosterList" items="${mainPagePopularPosterList}">
	        			<a href="/movie/detail/recommend/view?movieId=${popularPosterList.id}" class="swiper-slide">
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
				
					<c:if test="${not empty interestList}">
						<div class="swiper swiper-content">
							<div class="textWhite">관심 콘텐츠</div>
							<div class="swiper-wrapper contents d-flex mt-2" id="append0">
								<c:forEach var="interestList" items="${interestList}">
									<a href="/movie/detail/recommend/view?movieId=${interestList.movieId}"  class="movie-box swiper-slide"><img src="${interestList.posterPath}"></a>
								</c:forEach>
							</div>
							<div class="swiper-button-prev movieBackBtn" data-movie-info="0"></div>
		    				<div class="swiper-button-next movieNextBtn" data-movie-info="0"></div>
						</div>
					</c:if>
					<div class="swiper swiper-content">
						<div class="textWhite">한국 콘텐츠</div>
						<div class="swiper-wrapper contents d-flex mt-2" id="append1">
							<c:forEach var="koreaMovieList" items="${mainpageKoreaMovieList}">
								<a href="/movie/detail/recommend/view?movieId=${koreaMovieList.id}" class="movie-box swiper-slide"><img src="${koreaMovieList.poster_path}"></a>
							</c:forEach>
						</div>
						<div class="swiper-button-prev movieBackBtn" data-movie-info="1"></div>
	    				<div class="swiper-button-next movieNextBtn" data-movie-info="1"></div>
					</div>
					
					<div class="swiper swiper-content">
						<div class="textWhite">오늘의 <span class="logo">TOP</span> 콘텐츠</div>
						<div class="swiper-wrapper contents d-flex mt-2" id="append2">
							<c:forEach var="todayTopMovieList" items="${mainPageTodayTopMovieList}">
								<a href="/movie/detail/recommend/view?movieId=${todayTopMovieList.id}" class="movie-box swiper-slide"><img src="${todayTopMovieList.poster_path}"></a>
							</c:forEach>
						</div>
						<div class="swiper-button-prev movieBackBtn" data-movie-info="2"></div>
	    				<div class="swiper-button-next movieNextBtn" data-movie-info="2"></div>
					</div>
					
				</div>
				
				
			</section>
		</div>
		
	</div>
</body>

<script>

	$(document).ready(function(){
		
		let scrollCounting = 0;
		
		const swiperMovie = new Swiper(".swiper-content", {                 
		    slidesPerView: 7.5,
		    slidesPerGroup : 7,
		    spaceBetween: 20,  
		    observer: true,	
		    
		    navigation: {                      
		        nextEl: ".swiper-button-next",
		        prevEl: ".swiper-button-prev",
		    },
		   		
		});
		
		$(window).scroll(function() {
			  // 현재 스크롤 위치 계산
			  var currentPosition = $(window).scrollTop();
			  
			  

			  // 스크롤이 페이지 하단에 도달하면 추가 데이터 로드
			  if (currentPosition == $(document).height() - $(window).height() && scrollCounting == 0) {
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">애니메이션 영화</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append3">'
								+ '<c:forEach var="animationMovieList" items="${mainPageAnimationMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${animationMovieList.id}" class="movie-box swiper-slide"><img src="${animationMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="3"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="3"></div>'
						+ '</div>');
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">액션 <span class="icon">&</span> 스릴러</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append4">'
								+ '<c:forEach var="actionMovieList" items="${mainPageActionMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${actionMovieList.id}" class="movie-box swiper-slide"><img src="${actionMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="4"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="4"></div>'
						+ '</div>');
				  
				  $(".movie-conteiner").append('<div class="swiper swiper-content">'
							+ '<div class="textWhite">코미디</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append5">'
								+ '<c:forEach var="comedyMovieList" items="${mainPageComedyMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${comedyMovieList.id}" class="movie-box swiper-slide"><img src="${comedyMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="5"></div>'
							+ '<div class="swiper-button-next movieNextBtn" data-movie-info="5"></div>'
						+ '</div>');
				  
				  const swiperMovie = new Swiper(".swiper-content", {                 
					    slidesPerView: 7.5,
					    slidesPerGroup : 7,
					    spaceBetween: 20,  
					    observer: true,	
					    
					    navigation: {                      
					        nextEl: ".swiper-button-next",
					        prevEl: ".swiper-button-prev",
					    },
					   		
					});
					
					scrollCounting = 1;
					
			  } else if (currentPosition == $(document).height() - $(window).height() && scrollCounting == 1) {
			    // 추가 데이터 로드하는 코드 
				
			    
				$(".movie-conteiner").append('<div class="swiper swiper-content">'
						+ '<div class="textWhite">로맨스</div>'
						+ '<div class="swiper-wrapper contents d-flex mt-2" id="append6">'
							+ '<c:forEach var="romanceMovieList" items="${mainPageRomanceMovieList}">'
								+ '<a href="/movie/detail/recommend/view?movieId=${romanceMovieList.id}" class="movie-box swiper-slide"><img src="${romanceMovieList.poster_path}"></a>'
							+ '</c:forEach>'
						+ '</div>'
						+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="6"></div>'
						+ '<div class="swiper-button-next movieNextBtn" data-movie-info="6"></div>'
					+ '</div>');
			    
				$(".movie-conteiner").append('<div class="swiper swiper-content">'
						+ '<div class="textWhite logo">SF</div>'
						+ '<div class="swiper-wrapper contents d-flex mt-2" id="append7">'
							+ '<c:forEach var="sfMovieList" items="${mainPageSFMovieList}">'
								+ '<a href="/movie/detail/recommend/view?movieId=${sfMovieList.id}" class="movie-box swiper-slide"><img src="${sfMovieList.poster_path}"></a>'
							+ '</c:forEach>'
						+ '</div>'
						+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="7"></div>'
						+ '<div class="swiper-button-next movieNextBtn" data-movie-info="7"></div>'
					+ '</div>');
			    
				$(".movie-conteiner").append('<div class="swiper swiper-content">'
						+ '<div class="textWhite">호러</div>'
						+ '<div class="swiper-wrapper contents d-flex mt-2" id="append8">'
							+ '<c:forEach var="horrorMovieList" items="${mainPageHorrorMovieList}">'
								+ '<a href="/movie/detail/recommend/view?movieId=${horrorMovieList.id}" class="movie-box swiper-slide"><img src="${horrorMovieList.poster_path}"></a>'
							+ '</c:forEach>'
						+ '</div>'
						+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="8"></div>'
						+ '<div class="swiper-button-next movieNextBtn" data-movie-info="8"></div>'
					+ '</div>');
			    
				
			    
				const swiperMovie = new Swiper(".swiper-content", {                 
				    slidesPerView: 7.5,
				    slidesPerGroup : 7,
				    spaceBetween: 20,  
				    observer: true,	
				    
				    navigation: {                      
				        nextEl: ".swiper-button-next",
				        prevEl: ".swiper-button-prev",
				    },
				   		
				});
				    	   
				
				
				scrollCounting = 2;
				
			  } else if(currentPosition == $(document).height() - $(window).height() && scrollCounting == 2) {
				  
				  $(".movie-conteiner").append('<div class="swiper swiper-content">'
							+ '<div class="textWhite">가족</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append9">'
								+ '<c:forEach var="familyMovieList" items="${mainPageFamilyMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${familyMovieList.id}" class="movie-box swiper-slide"><img src="${familyMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="9"></div>'
							+ '<div class="swiper-button-next movieNextBtn" data-movie-info="9"></div>'
						+ '</div>');
				    
					$(".movie-conteiner").append(
							  '<div class="swiper swiper-content">'
								+ '<div class="textWhite">모험</div>'
								+ '<div class="swiper-wrapper contents d-flex mt-2" id="append10">'
									+ '<c:forEach var="adventureMovieList" items="${mainPageAdventureMovieList}">'
										+ '<a href="/movie/detail/recommend/view?movieId=${adventureMovieList.id}" class="movie-box swiper-slide"><img src="${adventureMovieList.poster_path}"></a>'
									+ '</c:forEach>'
								+ '</div>'
								+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="10"></div>'
			    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="10"></div>'
							+ '</div>');
				   
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">판타지</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append11">'
								+ '<c:forEach var="fantasyMovieList" items="${mainPageFantasyMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${fantasyMovieList.id}" class="movie-box swiper-slide"><img src="${fantasyMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="11"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="11"></div>'
						+ '</div>');
				  

				  const swiperMovie = new Swiper(".swiper-content", {                 
					    slidesPerView: 7.5,
					    slidesPerGroup : 7,
					    spaceBetween: 20,  
					    observer: true,	
					    
					    navigation: {                      
					        nextEl: ".swiper-button-next",
					        prevEl: ".swiper-button-prev",
					    },
					   		
					});
					    	   
				  
				  
				  scrollCounting = 3;
				  
			  } else if(currentPosition == $(document).height() - $(window).height() && scrollCounting == 3) {
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">전쟁</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append12">'
								+ '<c:forEach var="warMovieList" items="${mainPageWarMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${warMovieList.id}" class="movie-box swiper-slide"><img src="${warMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="12"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="12"></div>'
						+ '</div>');
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">음악</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append13">'
								+ '<c:forEach var="musicMovieList" items="${mainPageMusicMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${musicMovieList.id}" class="movie-box swiper-slide"><img src="${musicMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="13"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="13"></div>'
						+ '</div>');
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">범죄</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append14">'
								+ '<c:forEach var="crimeMovieList" items="${mainPageCrimeMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${crimeMovieList.id}" class="movie-box swiper-slide"><img src="${crimeMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="14"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="14"></div>'
						+ '</div>');
				 
				  const swiperMovie = new Swiper(".swiper-content", {                 
					    slidesPerView: 7.5,
					    slidesPerGroup : 7,
					    spaceBetween: 20,  
					    observer: true,	
					    
					    navigation: {                      
					        nextEl: ".swiper-button-next",
					        prevEl: ".swiper-button-prev",
					    },
					   		
					});
					    	   
				  
				  
				  scrollCounting = 4;
				  
			  } else if(currentPosition == $(document).height() - $(window).height() && scrollCounting == 4) {
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">다큐멘터리</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append15">'
								+ '<c:forEach var="documentaryMovieList" items="${mainPageDocumentaryMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${documentaryMovieList.id}" class="movie-box swiper-slide"><img src="${documentaryMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="15"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="15"></div>'
						+ '</div>');
				  
				  $(".movie-conteiner").append(
						  '<div class="swiper swiper-content">'
							+ '<div class="textWhite">역사</div>'
							+ '<div class="swiper-wrapper contents d-flex mt-2" id="append16">'
								+ '<c:forEach var="historyMovieList" items="${mainPageHistoryMovieList}">'
									+ '<a href="/movie/detail/recommend/view?movieId=${historyMovieList.id}" class="movie-box swiper-slide"><img src="${historyMovieList.poster_path}"></a>'
								+ '</c:forEach>'
							+ '</div>'
							+ '<div class="swiper-button-prev movieBackBtn" data-movie-info="16"></div>'
		    				+ '<div class="swiper-button-next movieNextBtn" data-movie-info="16"></div>'
						+ '</div>');
				  
				  $("#wrap").append(
						  '<footer class="text-center">'
							+ '<div class="footerLogo pt-2">Bogus+</div>'
							+ '<div class="copyRight mt-3">©2023 Bogus and its related entities. All Rights Reserved</div>'
							+ '<div class="copyRight">월트보거스컴퍼니코리아 유한책임회사  |  대표자:보거스  |  성남시 수정구  |   Email: help@boguspluse.kr  |  사업자등록번호: 000-11-23456</div>'
						+ '</footer>');
				  
				  const swiperMovie = new Swiper(".swiper-content", {                 
					    slidesPerView: 7.5,
					    slidesPerGroup : 7,
					    spaceBetween: 20,  
					    observer: true,	
					    
					    navigation: {                      
					        nextEl: ".swiper-button-next",
					        prevEl: ".swiper-button-prev",
					    },
					   		
					});
				  
				  scrollCounting = 5;
			  }
				
		});
		
		var movieNumberList = ["0", "1", "2", "16", "28,53", "35", "10749", "878", "27", "10751" 
			,"12", "14", "10752" , "10402", "80", "99", "36"];
		
		var clickList = new Array(17);
		
		var backList = new Array(17);
		
		const basicUrl = "/movie/detail/recommend/view?movieId=";
		
		$(".movieBackBtn").on("click",  function(){
			let movieInfo = $(this).data("movie-info");
			
			let backCount = backList[movieInfo];
			
			if(backCount == null) {
				backCount = 0;
			}
			
			backList[movieInfo] = backCount + 1;
	
		});
		
		$(document).on("click", ".movieNextBtn", function(){
			
			let movieInfo = $(this).data("movie-info");
			
			if(movieInfo == 0) {
				return;
			}
			
			let clickCount = clickList[movieInfo];
			
			if(clickCount == null) {
				clickCount = 0;
			}
			
			clickList[movieInfo] = clickCount + 1;
			
			let backCount = backList[movieInfo];
			
			if(backCount > 0) {
				backList[movieInfo] = backCount - 1; 
			} 
			
			if(backCount == 0 || backCount == null) {
				
				let click = clickList[movieInfo];
				
				let movieNumber = movieNumberList[movieInfo];
				
				$.ajax({
					type:"get"
					, url:"/movie/nextList"
					, data:{"click":click, "movieInfo":movieNumber}
					, success:function(data){
						if(data.result == "success") {
							
							let list = data.nextList;
							
							for (var i = 0; i < list.length; i++) {
								
								let appendNumber = "#append" + movieInfo;
								
								if(list[i].poster_path != null && !list[i].poster_path.endsWith("null")) {
									
									var aTagInfo = "<a href=\"/movie/detail/recommend/view?movieId=" + list[i].id + "\" class=\"movie-box swiper-slide\"><img src=" + list[i].poster_path + "></a>";
									
									$(appendNumber).append(aTagInfo);
								}
								
							};
							
							
								
						} else {
							alert("리스트추가 실패");
						}
					}
					, error:function(){
						alert("리스트추가 에러");
					}
						
				});
			}	 
			
		});
		
		
		
		
		
		
		
		
		
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
		});
		
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
