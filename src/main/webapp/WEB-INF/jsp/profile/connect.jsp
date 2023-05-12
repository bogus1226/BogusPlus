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
<title>프로필 접속</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="connectProfileContents">
			<div class="d-flex justify-content-center connectProfileBox">
				<div>
					<div class="circle bg-info"><img src="${user.icon}"></div>
					<div class="textWhite text-center mt-2">${user.nickName	}</div>
				</div>		
			</div>
			
			<div class="textWhite text-center mt-4">프로필 PIN을 입력하세요</div>
			
			<div class="d-flex justify-content-center ml-2 mt-2">
				<div class="pin-contents mt-2">
					<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin1">
					<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin2">
					<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin3">
					<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin4">
				</div>
			</div>
			
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
		
		
		$("#pin4").on("input", function(){
			
			let pin1 = $("#pin1").val();
			let pin2 = $("#pin2").val();
			let pin3 = $("#pin3").val();
			let pin4 = $("#pin4").val();
			
			pin = pin1 + pin2 + pin3 + pin4;
			
			
			$.ajax({
				type:"get"
				, url:"/profile/connect"
				, data:{"pin":pin}
				, success:function(data){
					if(data.result == "success") {
						location.href = "/movie/mainpage/view";
					} else {
						console.log("프로필 접속 실패");
					}	
				}
				, error:function(){
					console.log("프로필 접속 에러");
				}
				
			});
			
		});
	});
</script>
</html>
