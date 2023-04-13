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
					<nav class="ml-5 pt-3 nav-item d-flex" id="movieHeaderLink">
						<a href="#" class="nav-link">홈</a>
						<a href="#" class="nav-link">검색</a>
						<a href="#" class="nav-link">관심	콘텐츠</a>
						<a href="#" class="nav-link">영화</a>
						<a href="#" class="nav-link">수다</a>
					</nav>
				</div>
				<div class="d-flex mt-2">
					<div class="nickName pt-4 mr-2">보거스</div>
					<div class="profileCircle mt-2 mr-3"></div>
				</div>
			</div>
		</header>
		
		<div class="swiper swiper-box mt-4">
   			<div class="swiper-wrapper">
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터1.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터2.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터1.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터2.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터1.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터2.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터1.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터2.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터1.jpg"></a>
        		<a href="" class="swiper-slide"><img src="/static/image/영화포스터2.jpg"></a>
    		</div>
    		<div class="swiper-pagination mr-3"></div>
    		<div class="swiper-button-prev"></div>
    		<div class="swiper-button-next"></div>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
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
