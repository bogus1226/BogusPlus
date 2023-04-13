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
<title>회원가입 (카탈로그)</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<section class="main-contents">
			<h5 class="pt-5"><b>카탈로그 전체에 액세스하세요</b></h5>
			<div class="textGray mt-2">
				<div><b>컨텐츠 등급을 19+ 등급으로 설정하세요</b></div>
				<div class="mt-1">- 카탈로그 전체를 볼 수 있게됩니다</div>
				<div>- 콘텐츠 등급은 '프로필 수정'에서 얼마든지 변경하실 수 있습니다</div>
			</div>
			<button type="button" class="blueBtn btn btn-block mt-3 selectBtn" data-catalogue="19">카탈로그 전체</button>
			<button type="button" class="grayBtn btn btn-block mt-3 selectBtn" data-catalogue="12">나중에</button>
			<div class="textGray mt-2">'나중에'를 선택하면 콘텐츠 등급이 12+ 등급으로 설정되며<br>다른 영화와 시리즈에 대한 액세스가 제한됩니다.</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>
<script>
	$(document).ready(function(){
		
		$(".selectBtn").on("click", function(){
			
			userId = ${userId};
			
			let catalogue = $(this).data("catalogue");
			
			$.ajax({
				type:"post"
				, url:"/user/add/catalogue"
				, data:{"catalogue":catalogue, "userId":userId}
				, success:function(data){
					if(data.result == "success") {
						let form = document.createElement("form");
						
						let object = document.createElement("input");
						
						object.setAttribute("type", "hidden");
						object.setAttribute("name", "userId");
						object.setAttribute("value", userId);
						
						form.appendChild(object);
						form.setAttribute("method", "post");
						form.setAttribute("action", "/user/signup/icon/view");
						
						document.body.appendChild(form);
						form.submit();
					} else {
						console.log("카탈로그 추가 실패");
					}	
				}
				, error:function(){
					console.log("카탈로그 추가 에러");
				}
				
			});
			
		}); 		
		
	});
</script>
</html>
