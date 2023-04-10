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
						<a href="#" class="circle"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
					</div>
				</div>
				
				<div>
					<div class="mt-4">마블</div>
					<div class="d-flex mt-2">
						<a href="#" class="circle"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
					</div>
				</div>
				
				<div>
					<div class="mt-4">고양이</div>
					<div class="d-flex mt-2">
						<a href="#" class="circle"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
					</div>
				</div>
				
				<div>
					<div class="mt-4">강아지</div>
					<div class="d-flex mt-2">
						<a href="#" class="circle"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
						<a href="#" class="circle ml-3"></a>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
</html>
