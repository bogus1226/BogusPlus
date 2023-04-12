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
	<link rel="stylesheet" href="/static/css/toggleSwitch.css" type="text/css">
<title>회원가입 (아이콘)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<form method="POST" action="/user/signup/catalogue/view">
			<section class="main-contents">
				<h5 class="pt-5"><b>닉네임 설정</b></h5>
				<input type="text" class="form-control mt-3" placeholder="닉네임" id="nickNameInput">
				<div class="textRed mt-1 d-none" id="nickNameNoneText">닉네임을 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="nickNameCountText">3글자 이상 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="nickNameSpaceText">공백없이 입력해주세요</div>
				<hr>
				<div class="d-flex justify-content-between">
					<div>
						<div class="textGray">키즈 프로필</div>
						<div class="textGray">어린이를 위해 엄선된 콘텐츠과 기능</div>
					</div>
					<label class="switch">
	          			<input type="checkbox" class="agreeSwitch" id="agreeSwitchInput">
	          			<span class="slider round"></span>
	       			</label>
				</div>
				<button type="button" class="blueBtn btn btn-block mt-3" id="saveBtn" data-email="${email}" data-password="${password}" data-catalogue="${catalogue}" data-icon="${icon}">저장</button>
			</section>
		</form>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		var kid = 0;
		
		$("#nickNameInput").on("input", function(){
			$("#nickNameNoneText").addClass("d-none");
			$("#nickNameCountText").addClass("d-none");
			$("#nickNameSpaceText").addClass("d-none");
		});
		
		$("input[type=checkbox][id=agreeSwitchInput]").change(function() {
			 if ($(this).is(":checked")) {
				kid = 1;
	        }
	        else {
	        	kid = 0;
	        }
		});
		
		$("#saveBtn").on("click", function() {
			
			let userId = ${userId};
			let icon = $(this).data("icon");
			let nickName = $("#nickNameInput").val();
			
					
			if(nickName == "") {
				$("#nickNameNoneText").removeClass("d-none");
				return;
			} else if(nickName.length < 3) {
				$("#nickNameCountText").removeClass("d-none");
				return;
			} else if(nickName.search(/\s/) != -1) {
				$("#nickNameSpaceText").removeClass("d-none");
				return;
			} 
			
			$.ajax({
				type:"post"
				, url:"/user/add/nickName"
				, data:{
					"nickName":nickName
					, "kid":kid
					, "userId":userId}
				, success:function(data){
					if(data.result == "success") {
						let form = document.createElement("form");
						
						let object = document.createElement("input");
						
						object.setAttribute("type", "hidden");
						object.setAttribute("name", "userId");
						object.setAttribute("value", userId);
						
						form.appendChild(object);
						form.setAttribute("method", "post");
						form.setAttribute("action", "/user/signup/pin/view");
						
						document.body.appendChild(form);
						form.submit();
					} else {
						console.log("닉네임 추가 실패");
					}	
				}
				, error:function(){
					console.log("닉네임 추가 에러");
				}
				
			});
			
		    
		});
		
	});
</script>
</html>
