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
<title>회원가입 (2차 비밀번호)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="main-contents">
			<h5 class="pt-5 mb-1"><b>프로필 잠금 PIN으로 엑세스를<br>제한 할까요?</b></h5>
			<div class="textGray">4자리 PIN을 설정하세요</div>
			<div class="pin-contents mt-2">
				<input type="text" class="pin pinBox text-center mr-2" maxlength="1">
				<input type="text" class="pin pinBox text-center mr-2" maxlength="1">
				<input type="text" class="pin pinBox text-center mr-2" maxlength="1">
				<input type="text" class="pin pinBox text-center" maxlength="1">
			</div>
			<button type="button" class="blueBtn btn btn-block mt-3">프로필 PIN 설정</button>
			<button type="button" class="grayBtn btn btn-block mt-3">나중에</button>
			<div class="textGray mt-2">PIN은 '프로필 수정'에서 언제든지 설정하실 수 있습니다.</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$(".pin").on("keyup", function() {

		    if(this.value.length == 1) {
		    	$(this).next().focus();   
		    	}	
		    
		});
		
	});
</script>
</html>
