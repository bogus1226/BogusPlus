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
	<link rel="stylesheet" href="/static/css/datePicker.css" type="text/css">
	<!-- 네이버 map API -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b5vyxgh7co&submodules=geocoder"></script>
	<script type="text/javascript" src="/static/js/naver.js"></script>
	<!-- 데이트 피커 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<title>까페 글쓰기(함께하기)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-main-movieInfo">
			<section class="post-container previw-container">
				
				<section class="suda-main-contents">
					<div class="fontBMJUA text-center">${cafe.name} <span class="myText">글쓰기</span></div>
					
					<nav class="pt-2 nav-item d-flex" id="postNavLink">	
						<a href="/suda/cafe/upload/view?cafeId=${cafe.id}" class="nav-link">수다</a>
						<a class="nav-link"><span class="select">함께하기</span></a>
					</nav>
					
					<input type="text" class="form-control fontBMJUA" id="titleInput" placeholder="제목을 입력해주세요">
					<div class="textRed mt-1 d-none" id="titleText">제목을 입력해주세요!</div>
					<div class="d-flex mt-2">
						<div class="choosePlace d-flex align-items-center col-8">
							<i class="bi bi-geo-alt placeIcon" id="placeBtn"></i>
							<div class="fontBMJUA mt-2 ml-2 placeSelect">장소 선택</div>
						</div>
						
						<div class="choosePlace d-flex align-items-center col-5">
							<i class="bi bi-calendar calendarIcon"></i>
							<input type="text" id="datepicker" class="datepicker-input">
							<div class="fontBMJUA mt-2 ml-2 calendarSelect">날짜 선택</div>
						</div>	
					</div>
					
					<div class="d-flex">
						<div class="choosePlace d-flex align-items-center col-8">
							<div class="textRed d-none" id="placeSelectText">장소를 선택해주세요!</div>
						</div>
						
						<div class="choosePlace d-flex align-items-center col-5">
							<div class="textRed d-none" id="dateSelcetText">날짜를 선택해주세요!</div>
						</div>	
					</div>
					
					<div class="textArea-container d-none">
						<textarea cols="25" rows="7" class="form-control mt-3 fontBMJUA" placeholder="내용을 입력해주세요" id="contentArea"></textarea>
						<div class="textRed mt-1 d-none" id="contentText">내용을 입력해주세요</div>
						
						<div class="d-flex justify-content-end">
							<button type="button" class="btn btn-secondary mt-3 mr-2" id="backButton">취소</button>
							<button type="button" class="btn btn-primary mt-3" id="saveBtn" data-cafeid="${cafeId}">저장</button>
						</div>
					</div>
				   
				</section>
				
				<div style="width:1140px;margin:auto;" class="placeBox mt-2 mb-5">
					<div id="map" style="width:1140px;height:600px;">
				        <div class="input-group search col-4">
							<input id="address" type="text" class="form-control" placeholder="검색할 주소">
							<div class="input-group-append">
								<input id="submit" type="button" class="btn" value="검색">
							</div>
						</div>
						<div class="placeText textRed d-none">주소를 정확히 입력해주세요!</div>
			    	</div>
			    	
			    	<div class="d-flex justify-content-end mt-2">
			    		<button type="button" class="btn btn-secondary" id="deleteBtn">취소</button>
			    		<button type="button" class="btn btn-primary ml-2" id="placeSaveBtn">저장</button>
			    	</div>
				</div>	
			</section>
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		$("#backButton").click(function() {
		    window.history.back();
		});
		
		$("#titleInput").on("input", function(){
			$("#titleText").addClass("d-none");
		});
		
		$("#contentArea").on("input", function(){
			$("#contentText").addClass("d-none");
		});
		
		var dateString = null;
		
		$("#saveBtn").on("click", function(){
			
			var placeAddressList = placeAddress.split(",");
			
			if(placeAddressList != null) {
				var placeAddressX = placeAddressList[0];
				var placeAddressY = placeAddressList[1];
			}
			
			if(dateString != null) {
				var date = dateString;
			}
			
			let cafeId = $(this).data("cafeid");
			
			let content = $("#contentArea").val();
			
			content = content.replaceAll("\n", "<br>");
			content = content.replaceAll("\u0020", "&nbsp;");
			
			let title = $("#titleInput").val();
			
			let placeName = placeString;
			
			if(title.trim() == "") {
				$("#titleText").removeClass("d-none");
				return;
			}
			
			let placeSelectString = $(".placeSelect").text();
			
			if(placeSelectString == "장소 선택" && dateString == null) {
				$("#placeSelectText").removeClass("d-none");
				$("#dateSelcetText").removeClass("d-none");
				return;
			}
			
			if(placeSelectString == "장소 선택") {
				$("#placeSelectText").removeClass("d-none");
				return;
			}
			
			if(dateString == null) {
				$("#dateSelcetText").removeClass("d-none");
				return;
			}
			
			if(content.trim() == "") {
				$("#contentText").removeClass("d-none");
				return;
			}
			
			
			$.ajax({
				type:"post"
				, url:"/suda/cafe/together/create"
				, data:{"cafeId":cafeId
					, "title":title
					, "placeName":placeName
					, "placeAddressX":placeAddressX
					, "placeAddressY":placeAddressY
					, "date":date
					, "content":content}
				, success:function(data){
					if(data.result == "success") {
						location.href = "/suda/cafe/mypage/view?cafeId=" + cafeId;
					} else {
						console.log("함께하기 저장 실패");
					}	
				}
				, error:function(){
					console.log("함께하기 저장 에러");
				}
				
			});	
			
			
			
			
		});
		
		
		$("#datepicker").datepicker({minDate:0});
		
		$.datepicker.setDefaults({
			  dateFormat: "yy년 mm월 dd일",
			  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  showMonthAfterYear: true,
			  yearSuffix: '년'
			});
		 
		$(".calendarIcon").on("click", function(){
			 $("#datepicker").datepicker("show").addClass("datepicker");
		});
		
		$("#datepicker").on("change", function(){
			
			$("#dateSelcetText").addClass("d-none");
			
			dateString = $(this).val();
			
			$(".calendarSelect").text(dateString);
			
		});
		
		
		$("#address").on("input", function(){
			$(".placeText").addClass("d-none");
		});
		
		$("#placeSaveBtn").on("click", function(){
			
			if(placeString != null) {
				$("#placeSelectText").addClass("d-none");
				
				$(".placeSelect").empty();
				$(".placeSelect").append(placeString); 
				
				$(".textArea-container").removeClass("d-none");
				$(".placeBox").addClass("d-none");
				placeSelectNumber = 1;
			}
		});
		
		let placeSelectNumber = 0;
		
		$("#deleteBtn").on("click", function(){
			$(".textArea-container").removeClass("d-none");
			$(".placeBox").addClass("d-none");
			placeSelectNumber = 1;
		});
		
		$("#placeBtn").on("click", function(){
			
			if(placeSelectNumber == 0) {
				$(".textArea-container").removeClass("d-none");
				$(".placeBox").addClass("d-none");
				placeSelectNumber = 1;
			} else {
				$(".textArea-container").addClass("d-none");
				$(".placeBox").removeClass("d-none");
				placeSelectNumber = 0;
			}
			
		});
		
		// 네이버 API 자바스크립트
		var map = new naver.maps.Map("map", {
		    center: new naver.maps.LatLng(37.3595316, 127.1052133),
		    zoom: 15,
		    mapTypeControl: true
		    
		});
		

		map.setCursor("pointer");

		naver.maps.onJSContentLoaded = initGeocoder;
		
		var placeString = null;
		
		var placeAddress = null;
		
		naverMap(map, function(coordinate, addressName){
			placeString = addressName;
			placeAddress = coordinate;
		});


		// 네이버 API
		
				
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

	});
</script>
</html>
