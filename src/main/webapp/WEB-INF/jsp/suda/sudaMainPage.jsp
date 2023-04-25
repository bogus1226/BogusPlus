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
<title>수다 메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="movie-wrap wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div id="searchLine">
			<div class="textWhite text-center mb-3">수다</div>
			<input type="text" class="searchBox" id="cafeSearchInput" placeholder="까페 검색"></input>
		</div>
		
		<section class="sudaMainPageContents">
			<div class="fontBMJUA mt-3 text-center"><span class="hotText">Hot</span> 수다 카페</div>
			<a href="#" class="hotCafeBox btn btn-block textWhite mt-3">마블에 진심인 사람</a>
			<a href="#" class="hotCafeBox btn btn-block textWhite mt-3">추리 장인</a>
			<a href="#" class="hotCafeBox btn btn-block textWhite mt-3">무서운이야기</a>
			
			<c:choose>
				<c:when test="${is_duplicate eq 0}">
					<div class="cafe-create">
						<div class="fontBMJUA mt-5 text-center ">까페 만들기</div>
						<input type="text" class="form-control mt-2" placeholder="까페 이름" maxlength="32" id="cafeNameInput">
						<div class="textRed mt-1 d-none" id="cafeNameText">까페 이름을 입력해주세요</div>
						<div class="d-flex justify-content-end mt-3">
							<button type="button" class="btn blueBtn col-2" id="saveBtn">저장</button>
						</div>
					</div>
				</c:when>
				
				<c:otherwise>
					<div class="my-cafe">
						<div class="fontBMJUA mt-5 text-center"><span class="myText">My</span> 카페</div>
						<a href="#" class="hotCafeBox btn btn-block textWhite mt-2">${name}</a>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
		
		<section class="searchInfo mb-5 d-none"></section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		
		$("#cafeSearchInput").on("input", function(){
			
			$(".searchInfo").empty();
			
			let cafeSearch = $("#cafeSearchInput").val();
			
			if(cafeSearch == "") {
				$(".sudaMainPageContents").removeClass("d-none");
				$(".searchInfo").addClass("d-none");
			} else {
				$(".sudaMainPageContents").addClass("d-none");
				$(".searchInfo").removeClass("d-none");
			}
			
			$.ajax({
				type:"get"
				, url:"/suda/searchInfo"
				, data:{"search":cafeSearch}
				, success:function(data){
					if(data.result == "success") {
						console.log("검색 성공");
						
						let list = data.searchList;
						
						for (var i = 0; i < list.length; i++) {
							
							var aTagInfo = "<a href=\"#\" class=\"hotCafeBox btn btn-block textWhite mt-3\">" + list[i].name + "</a>";
							
							$(".searchInfo").append(aTagInfo);
							
						};
					} else {
						console.log("검색 결과 없음");
					}	
				}
				, error:function(){
					console.log("검색 에러");
				}
				
			});	
		});
		
		$("#cafeNameInput").on("input", function(){
			$("#cafeNameText").addClass("d-none");
		});
		
		$("#saveBtn").on("click", function(){
			
			let name = $("#cafeNameInput").val().trim();
			
			if(name == "") {
				$("#cafeNameText").removeClass("d-none");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/suda/cafe/create"
				, data:{"name":name}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("까페 만들기 실패");
					}	
				}
				, error:function(){
					console.log("까페 만들기 에러");
				}
				
			});	
		});
		
		$("#profile-container").hover(
			function() {
				$("#profile-container").removeClass("d-none");
				$("#profile").addClass("d-none");
			},
			function() {
				$("#profile-container").addClass("d-none");
				$("#profile").removeClass("d-none");
			}
		);
				
				
		$("#profile").hover(
			function() {
				$("#profile-container").removeClass("d-none");
				$("#profile").addClass("d-none");
			},
			function() {
				$("#profile-container").addClass("d-none");
				$("#profile").removeClass("d-none");
			}
		);

	});
</script>
</html>
