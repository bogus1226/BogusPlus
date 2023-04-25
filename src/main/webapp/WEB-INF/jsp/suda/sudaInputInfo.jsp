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
	<!-- 부트스트랩 아이콘 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<!-- 폰트 -->
	<link href="https://fonts.googleapis.com/css2?family=Comic+Neue:wght@700&display=swap" rel="stylesheet">
	<!-- stylesheet -->
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>영화 메인화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section id="suda-input-info">
			<div class="textWhite text-center">수다</div>
			<input type="text" class="form-control mt-3" placeholder="MBTI" id="mbtiInput" maxlength="4" style="text-transform: uppercase;">
			<div class="textRed mt-1 d-none" id="mbtiText">양식을 확인해주세요</div>
			<input type="text" class="form-control mt-3" placeholder="내 소개   ex) 마블 빠돌이" id="introduceInput" maxlength="32">
			<input type="text" class="form-control mt-3" placeholder="영화 보는타입   ex) 떠들면서 보는편!" id="typeInput" maxlength="32">
			<div class="mt-3 d-flex justify-content-end">
				<button type="button" class="btn blueBtn col-2" id="saveBtn">저장</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		$("#mbtiInput").on("input", function(){
			$("#mbtiText").addClass("d-none");
			
			$(this).val($(this).val().toUpperCase());
		});
		
		
		$("#saveBtn").on("click", function(){
			
			let mbti = $("#mbtiInput").val();
			
			let introduce = $("#introduceInput").val().trim();
			
			let type = $("#typeInput").val().trim();
			
			if(introduce == "") {
				introduce = null;
			}
			
			if(type == "") {
				type = null;
			}
			
			var regMBTI = /^[E|I]{1}[S|N]{1}[T|F]{1}[J|P]{1}$/;
			
			if(!regMBTI.test(mbti)) {
				console.log(mbti);
				$("#mbtiText").removeClass("d-none");
				return;
			} 
			
			$.ajax({
				type:"get"
				, url:"/suda/inputInfo"
				, data:{"mbti":mbti, "introduce":introduce, "type":type}
				, success:function(data){
					if(data.result == "success") {
						alert("수다 정보입력 성공");
					} else {
						console.log("수다 정보입력 실패");
					}	
				}
				, error:function(){
					console.log("수다 정보입력 에러");
				}
				
			});	
		});


	});
</script>
</html>
