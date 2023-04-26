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
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>까페 메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="movie-wrap wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section class="post-container d-flex">
		
			<div class="writingBtn-container"></div>
			
			<section class="suda-main-contents">
				<div class="fontBMJUA text-center">마블에 진심인 사람</div>
				
				<nav class="pt-2 nav-item d-flex" id="postNavLink">
					<a class="nav-link"><span class="select">수다</span></a>
					<a href="#" class="nav-link">함께하기</a>
					<a href="#" class="nav-link">대기중</a>
					<a href="#" class="nav-link">참석완료</a>
					<a href="#" class="nav-link">MyPage</a>
					<a href="#" class="nav-link">글쓰기</a>
				</nav>
				
				<div class="sudaPost mt-2">
					<div class="post-header d-flex align-items-center justify-content-between">
						<div class="userName ml-3">보거스</div>
						<i class="bi bi-three-dots btn iconBtn"></i>
					</div>
					
					<div class="post-image">
						<img src="/static/image/spider.jpg">
					</div>
					
					<div class="post-text-container d-flex align-items-center">
						<div class="post-text d-flex justify-content-center">
							<div class="textWhite mt-2">스파이더맨이다</div>
						</div>
						<div class="post-text-icon mt-2">
							<i class="bi bi-caret-down-fill iconBtn"></i>
						</div>
					</div>
					
					<hr class="mt-1">
					
					<div class="post-comment-container d-flex">
						<div class="post-userName">
							<div class="textWhite ml-3">그루트</div>
						</div>
						
						<div class="post-comment ml-2">
							<div class="commentText">아이엠 그루트</div>
						</div>
					</div>
					
					<div class="post-comment-button d-flex justify-content-center mt-3">
						<div class="input-group col-8 comment-button-box">
							<input type="text" class="form-control" placeholder="내용을 입력해주세요">
							<div class="input-group-append">
								<button class="btn grayBtn" type="button">게시</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
		

			

		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		
		$("#profile-container").hover(
			function() {
				$("#profile-container").removeClass("d-none");
				$("#profile").addClass("d-none");
			},
			function() {
				$("#profile-container").addClass("d-none");
				$("#profile").removeClass("d-none");
			}
		);
				
				
		$("#profile").hover(
			function() {
				$("#profile-container").removeClass("d-none");
				$("#profile").addClass("d-none");
			},
			function() {
				$("#profile-container").addClass("d-none");
				$("#profile").removeClass("d-none");
			}
		);

	});
</script>
</html>
