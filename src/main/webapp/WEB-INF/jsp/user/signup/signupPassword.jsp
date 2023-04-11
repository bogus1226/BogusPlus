<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>회원가입 (비밀번호)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<form method="post" action="/user/signup/catalogue/view?email=${email}">
			<section class="main-contents">
				<div class="textGray pt-5 small">2/2단계</div>
				<h5><b>비밀번호를 생성하세요</b></h5>
				<div class="textGray mt-2">이 이메일과 비밀번호로 보거스+ 계정에 로그인하여<br>좋아하는 영화를 시청하실수 있습니다.</div>
				<input type="password" class="form-control mt-3" placeholder="비밀번호" maxlength="8" id="passwordInput" name="password">
				<div class="textRed mt-1 d-none" id="lengthText">8자리까지 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="spaceText">공백없이 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="engText">알파벳을 포함해주세요</div>
				<div class="textRed mt-1 d-none" id="numText">숫자를 포함해주세요</div>
				<div class="textRed mt-1 d-none" id="speText">특수 문자를 포합해주세요</div>
				<div class="passwordRule mt-2">알파벳, 숫자, 특수 문자 3가지를 모두 포함해 총 8자(대소문자 구분)<br>이상이어야 합니다.</div>
				<div class="loginEmail d-flex mt-2">
					<div class="lengthLine"></div>
					<div class="emailInfo ml-2 d-flex align-items-center">
						<div class="ml-2">
							<div class="emailInfoText"><b>로그인에 사용할 이메일:</b></div>
							<div>${email}</div>
						</div>
					</div>
				</div>
				<button type="button" class="blueBtn btn btn-block mt-3" id="joinBtn" data-email="${email}">가입하기</button>
				<button type="submit" class="d-none" id="submitBtn"></button>
			</section>
		</form>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$("#passwordInput").on("input", function(){
			$("#lengthText").addClass("d-none");
			$("#spaceText").addClass("d-none");
			$("#engText").addClass("d-none");
			$("#numText").addClass("d-none");
			$("#speText").addClass("d-none");
		});
		
		$("#joinBtn").on("click", function(){
			
			let email = $(this).data("email");
			
			let password = $("#passwordInput").val();
			let number = password.search(/[0-9]/g); 
			let english = password.search(/[a-z]/ig); 
			let special = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
			 
			if(password.length < 8){
				$("#lengthText").removeClass("d-none");
				return false;
			} else if(password.search(/\s/) != -1) {
				$("#spaceText").removeClass("d-none");
				return false;
			} else if(english < 0) {
				$("#engText").removeClass("d-none");
				 return false;
			} else if(number < 0) {
				$("#numText").removeClass("d-none");
				return false;
			} else if(special < 0) {
				$("#speText").removeClass("d-none");
				return false;
			} else {
				$("#submitBtn").click();
			}

		});
		
		
	});
</script>
</html>
