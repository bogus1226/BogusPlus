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
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>회원가입 (아이콘)</title>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="d-flex justify-content-between">
				<div class="headerLogo ml-5 pt-2">Bogus+</div>
				<button type="button" class="grayBtn btn mt-3 mr-3">건너뛰기</button>
			</div>
			<hr>
		</header>
		
		<section class="icon-contents">
			<h5 class="mt-4"><b>아이콘 선택</b></h5>
			<div class="mt-4">
				<div>
					<div>보거스+ 추천</div>
					<div class="d-flex mt-2">
						<button type="button" class="iconBtn btn circle p-0" data-icon="/static/image/spider.jpg"><img src="/static/image/spider.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/groot.jpg"><img src="/static/image/groot.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/cat3.jpg"><img src="/static/image/cat3.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog1.jpg"><img src="/static/image/dog1.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog3.jpg"><img src="/static/image/dog3.jpg"></button>
					</div>
				</div>
				
				<div>
					<div class="mt-4">마블</div>
					<div class="d-flex mt-2">
						<button type="button" class="iconBtn btn circle p-0" data-icon="/static/image/ironman.jpg"><img src="/static/image/ironman.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/groot.jpg"><img src="/static/image/groot.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/spider.jpg"><img src="/static/image/spider.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/hulk.jpg"><img src="/static/image/hulk.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/black.jpg"><img src="/static/image/black.jpg"></button>
					</div>
				</div>
				
				<div>
					<div class="mt-4">고양이</div>
					<div class="d-flex mt-2">
						<button type="button" class="iconBtn btn circle p-0" data-icon="/static/image/cat1.jpg"><img src="/static/image/cat1.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/cat2.jpg"><img src="/static/image/cat2.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/cat3.jpg"><img src="/static/image/cat3.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/cat4.jpg"><img src="/static/image/cat4.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/cat5.jpg"><img src="/static/image/cat5.jpg"></button>
					</div>
				</div>
				
				<div>
					<div class="mt-4">강아지</div>
					<div class="d-flex mt-2">
						<button type="button" class="iconBtn btn circle p-0" data-icon="/static/image/dog1.jpg"><img src="/static/image/dog1.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog2.jpg"><img src="/static/image/dog2.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog3.jpg"><img src="/static/image/dog3.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog4.jpg"><img src="/static/image/dog4.jpg"></button>
						<button type="button" class="iconBtn btn circle p-0 ml-3" data-icon="/static/image/dog5.jpg"><img src="/static/image/dog5.jpg"></button>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$(".iconBtn").on("click", function(){
			
			userId = ${userId};
			
			let icon = $(this).data("icon");
			
			$.ajax({
				type:"get"
				, url:"/user/add/icon"
				, data:{"icon":icon, "userId":userId}
				, success:function(data){
					if(data.result == "success") {
						location.href = "/user/signup/nickName/view?userId=" + userId;
					} else {
						console.log("아이콘 추가 실패");
					}	
				}
				, error:function(){
					console.log("아이콘 추가 에러");
				}
				
			});
			
		}); 		
		
	});
</script>
</html>
