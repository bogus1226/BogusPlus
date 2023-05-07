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
<title>영화 상세화면(추천작)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-detail-container mt-5">
			<div class="movieName">올빼미</div>
			
			<div class="d-flex mt-3">
				<div class="age-limit-fifteen mr-3">15</div>
				<div class="textWhite mr-3">2022</div>
				<div class="textWhite">1시간 58분</div>
			</div>
			
			<div class="d-flex smallGray">
				<div class="mr-2">드라마,</div>
				<div class="mr-2">역사,</div>
				<div>스릴러</div>
			</div>
			
			<div class="d-flex mt-4 movie-select-btns">
				<button type="button" class="btn btn-light mr-4" id="playBtn">
					<i class="bi bi-play-fill playIcon"></i>
					<span class="textBlack ml-1">재생</span>
				</button>
				
				<button type="button" class="btn" id="interestBtn">
				    <i class="bi bi-plus-lg plusIcon"></i>
				</button>
			</div>
			
			<div class="textWhite mt-5 overview">밤에만 앞이 보이는 맹인 침술사 경수가 소현세자의 죽음을 목격하게 되고, 진실을 알리려는 찰나 더 큰 비밀과 음모가 드러나며, 목숨마저 위태로운 상황에 빠진다.</div>
			
			<div class="info-text-review d-flex justify-content-between mt-5">
				<div class="d-flex mt-2">
					<button type="button" class="btn notBackground detailText"><span class="select">추천작</span></button>
					<button type="button" class="btn notBackground detailText">상세정보</button>
					<button type="button" class="btn notBackground detailText">후기</button>
				</div>
				<div class="d-flex review mt-3">
					<div class="textWhite mr-3">Bogus+ 후기</div>
					<div class="textYellow mr-1">평점 10.0</div>
				</div>
			</div>
			
			<hr class="mt-1">
			
			<div class="recommend">
				<img src="/static/image/ironman.jpg">
				<img src="/static/image/ironman.jpg">
				<img src="/static/image/ironman.jpg">
				<img src="/static/image/ironman.jpg">
				<img src="/static/image/ironman.jpg">
			</div>
			
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		$("#wrap").css({
			  "background-image": "url(https://image.tmdb.org/t/p/w1280//9j0V8Fw5u4cv9cESUXUmTGmpXU5.jpg)",
			  "background-size": "cover"
			});
		
		$("#cafeSearchInput").on("input", function(){
			
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
						
						$(".searchInfo").empty();
						
						let list = data.searchList;
						
						for (var i = 0; i < list.length; i++) {
							
							var aTagInfo = "<a href=\"/suda/cafe/mainpage/view?cafeId=" + list[i].id + "\"" + "class=\"hotCafeBox btn btn-block textWhite mt-3\">" + list[i].name + "</a>";
							
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
		
		
	});
</script>
</html>
