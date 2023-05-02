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
	<!-- 네이버 map API -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b5vyxgh7co&submodules=geocoder"></script>
	<script type="text/javascript" src="/static/js/naver.js"></script>
<title>까페 글쓰기(함께하기)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section class="post-container previw-container">
			
			<section class="suda-main-contents">
				<div class="fontBMJUA text-center">${cafe.name} <span class="myText">글쓰기</span></div>
				
				<nav class="pt-2 nav-item d-flex" id="postNavLink">	
					<a href="/suda/cafe/upload/view?cafeId=${cafe.id}" class="nav-link">수다</a>
					<a class="nav-link"><span class="select">함께하기</span></a>
					<button type="button" class="btn btn-sm aTagBtn" id="previewBtn">미리보기</button>
				</nav>
				
				<input type="text" class="form-control fontBMJUA" placeholder="제목을 입력해주세요">
				<div class="d-flex justify-content-between mt-2">
					<div class="choosePlace d-flex align-items-center col-5">
						<i class="bi bi-geo-alt placeIcon" id="placeBtn"></i>
						<div class="fontBMJUA mt-2 ml-2">장소 선택</div>
					</div>
					
					<div class="choosePlace d-flex align-items-center col-5">
						<i class="bi bi-calendar calendarIcon"></i>
						<div class="fontBMJUA mt-2 ml-2">날짜 선택</div>
					</div>
					
				</div>
				
				<div class="textArea-container d-none">
					<textarea cols="25" rows="7" class="form-control mt-3 fontBMJUA" placeholder="내용을 입력해주세요" id="contentArea"></textarea>
					<div class="textRed mt-1 d-none" id="contentText">내용을 입력해주세요</div>
					
					<div class="d-flex justify-content-end">
						<button type="button" class="btn blueBtn mt-3" id="saveBtn" data-userid="${userId}" data-cafeid="${cafeId}">저장</button>
					</div>
				</div>
			   
			</section>
			
			<div style="width:1140px;margin:auto;" class="placeBox mt-2 mb-5">
				<div id="map" style="width:1140px;height:600px;">
			        <div class="input-group search col-4">
						<input id="address" type="text" class="form-control" placeholder="검색할 주소" value="불정로 6">
						<div class="input-group-append">
							<input id="submit" type="button" class="btn" value="검색">
						</div>
					</div>
		    	</div>
		    	
		    	<div class="d-flex justify-content-end mt-2">
		    		<button type="button" class="btn blueBtn">저장</button>
		    		<button type="button" class="btn grayBtn ml-3" id="deleteBtn">취소</button>
		    	</div>
			</div>
			
			
		</section>

		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
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
		

		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true,
		});

		map.setCursor("pointer");

		naver.maps.onJSContentLoaded = initGeocoder;
		

 		function searchCoordinateToAddress(latlng) {

		    infoWindow.close();

		    naver.maps.Service.reverseGeocode({
		        coords: latlng,
		        orders: [
		            naver.maps.Service.OrderType.ADDR,
		            naver.maps.Service.OrderType.ROAD_ADDR
		        ].join(',')
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }

		        var items = response.v2.results,
		            address = '',
		            htmlAddresses = [];

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            address = makeAddress(item) || '';
		            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
		        }

		        infoWindow.setContent([
		            '<div class="infoWindow">',
		            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        infoWindow.open(map, latlng);
		    });
		}
 		
		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        query: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert("검색 에러!");
		        }

		        if (response.v2.meta.totalCount === 0) {
		            return alert("검색결과 : " + response.v2.meta.totalCount + "\n주소로 검색해주세요!");
		        }

		        var htmlAddresses = [],
		            item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);

		        if (item.roadAddress) {
		            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		        }

		        if (item.jibunAddress) {
		            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		        }

		        if (item.englishAddress) {
		            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		        }

		        infoWindow.setContent([
		            '<div class="infoWindow">',
		            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
		            htmlAddresses.join('<br />'),
		            '</div>'
		        ].join('\n'));

		        map.setCenter(point);
		        infoWindow.open(map, point);
		       
		    });
		}
		
		function initGeocoder() {
		    map.addListener('click', function(e) {
		        searchCoordinateToAddress(e.coord);
		    });

		    $('#address').on('keydown', function(e) {
		        var keyCode = e.which;

		        if (keyCode === 13) { // Enter Key
		            searchAddressToCoordinate($('#address').val());
		        
		        }
		    });

		    $('#submit').on('click', function(e) {
		        e.preventDefault();

		        searchAddressToCoordinate($('#address').val());
		    });

		    searchAddressToCoordinate('정자동 178-1');
		}
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

	});
</script>
</html>
