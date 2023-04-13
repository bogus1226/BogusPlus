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
<title>로그인 (비밀번호)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<form id="signinPasswordForm">
			<section class="main-contents">
				<h5 class="pt-5"><b>비밀번호를 입력하세요</b></h5>
				<div class="textGray mt-2">이 이메일과 비밀번호로 보거스+ 계정에 로그인하여<br>좋아하는 영화를 시청하실수 있습니다.</div>
				<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput" maxlength="8">
				<div class="textRed mt-1 d-none" id="passwordSpaceText">비밀번호를 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="passwordIsDuplicateText">비밀번호를 확인해주세요</div>
				<div class="textGray mt-1">(대소문자 구분)</div>
				<button type="submit" class="blueBtn btn btn-block mt-3" data-email="${email}">로그인</button>
				<div class="mt-4">
					<a href="#">비밀번호 찾기</a>
				</div>
			</section>
		</form>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$("#passwordInput").on("input", function(){
			$("#passwordSpaceText").addClass("d-none");
			$("#passwordIsDuplicateText").addClass("d-none");
		});
		
		$("#signinPasswordForm").on("submit", function(e){
			
			e.preventDefault();
			
			let email = "${email}";
			let password = $("#passwordInput").val();
			
			if(password == "") {
				$("#passwordSpaceText").removeClass("d-none");
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/signin"
				, data:{"email":email, "password":password}
				, success:function(data){
					if(data.result == "success") {
						alert("로그인 성공!!");
					} else if(data.EmailResult) {
						$("#passwordIsDuplicateText").removeClass("d-none");
					} else {
						alert("로그인 실패");
					}
					
				}
				, error:function(){
					alert("로그인 에러");
				}
				
			});

			
		});
	});
</script>
</html>
