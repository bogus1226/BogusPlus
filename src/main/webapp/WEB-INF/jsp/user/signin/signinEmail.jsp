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
<title>로그인 (이메일)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<form id="signinEmailForm">
			<section class="main-contents">
				<h5 class="pt-5"><b>이메일 주소로 로그인하세요</b></h5>
				<div class="textGray mt-2">이 이메일과 비밀번호로 보거스+ 계정에 로그인하여<br>좋아하는 영화를 시청하실수 있습니다.</div>
				<input type="text" class="form-control mt-3" placeholder="이메일" id="emailInput">
				<div class="textRed mt-1 d-none" id="emailSpaceText">이메일을 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="emailIsDuplicateText">일치하는 이메일이 없습니다</div>
				<button type="submit" class="blueBtn btn btn-block mt-3">다음</button>
				<div class="d-flex mt-4">
					<div class="textGray">보거스+에 처음이신가요?</div>
					<a class="ml-2" href="/user/signup/email/view">가입하기</a>
				</div>
			</section>
		</form>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$("#emailInput").on("input", function(){
			$("#emailSpaceText").addClass("d-none");
			$("#emailIsDuplicateText").addClass("d-none");
		});
		
		$("#signinEmailForm").on("submit", function(e){
			
			e.preventDefault();
			
			let email = $("#emailInput").val();
			
			if(email == "") {
				$("#emailSpaceText").removeClass("d-none");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/user/isDuplicate"
				, data:{"email":email}
				, success:function(data){
					if(!data.isDuplicate) {
						$("#emailIsDuplicateText").removeClass("d-none");
					} else if(data.isDuplicate) {
						location.href = "/user/signin/password/view?email="+email;
					} else {
						console.log("중복확인 실패");
					}	
				}
				, error:function(){
					console.log("중복확인 에러");
				}
				
			});	 
			
		});
	});
</script>
</html>
