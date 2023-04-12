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
				<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin1">
				<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin2">
				<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin3">
				<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin4">
			</div>
			<div class="textRed mt-1 d-none" id="pinText">4자리를 모두 입력해주세요</div>
			<button type="button" class="blueBtn btn btn-block mt-3" id="pinSetBtn">프로필 PIN 설정</button>
			<a href="/user/signin/email/view" type="button" class="grayBtn btn btn-block mt-3">나중에</a>
			<div class="textGray mt-2">PIN은 '프로필 수정'에서 언제든지 설정하실 수 있습니다.</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$(".pin").on("keydown", function(event) {
			
			$("#pinText").addClass("d-none");
			
			var keyCode = event.keyCode;
				
		    if(this.value.length == 1 && keyCode != 8) {
		    	$(this).next().focus();   
		    } else if(this.value.length != 1 && keyCode == 8) {
		    	$(this).prev().focus();
		    }
   
		});
		
		$("#pinSetBtn").on("click", function(){
			
			let userId = ${userId};
			let pin1 = $("#pin1").val();
			let pin2 = $("#pin2").val();
			let pin3 = $("#pin3").val();
			let pin4 = $("#pin4").val();
			let pin = pin1 + pin2 + pin3 + pin4;
			
			if(pin1 == "" || pin2 == "" || pin3 == "" || pin4 == "") {
				$("#pinText").removeClass("d-none");
				return;
			}
			
			
			
			$.ajax({
				type:"post"
				, url:"/user/add/pin"
				, data:{"pin":pin, "userId":userId}
				, success:function(data){
					if(data.result == "success") {
						location.href = "/user/signin/email/view";
					} else {
						console.log("2차 비밀번호 설정 실패");
					}	
				}
				, error:function(){
					console.log("2차 비밀번호 설정 에러");
				}
				
			});	
			
		});
	});
</script>
</html>
