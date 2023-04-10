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
<title>회원가입 (이메일)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="main-contents">
			<div class="textGray pt-5 small">1/2단계</div>
			<h5><b>이메일을 입력하세요</b></h5>
			<div class="textGray mt-3">이 이메일과 비밀번호로 보거스+ 계정에 로그인하여<br>좋아하는 영화를 시청하실수 있습니다.</div>
			<input type="text" class="form-control mt-4" placeholder="이메일">
			<div class="form-check mt-2">
			  <input class="form-check-input" type="checkbox" value="" id="signupCheck">
			  <label class="form-check-label textGray" for="signupCheck">
			      예, 보거스+에 관한  최신 소식, 특별 혜택 및 기타 정보를 받아<br>보겠습니다.
			  </label>
			</div>
			<div class="form-check mt-2">
			  <input class="form-check-input" type="checkbox" value="" id="signupCheck">
			  <label class="form-check-label textGray" for="signupCheck">
			      본인은 만 19세 이상이며 보거스+ 이용약관에 동의합니다.
			  </label>
			</div>
			<div class="form-check mt-2">
			  <input class="form-check-input" type="checkbox" value="" id="signupCheck">
			  <label class="form-check-label textGray" for="signupCheck">
			      보거스+의 개인정보 수집 및 이용에 동의합니다.
			  </label>
			</div>
			<button type="button" class="btn btn-block mt-4">동의하고 진행하기</button>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>
