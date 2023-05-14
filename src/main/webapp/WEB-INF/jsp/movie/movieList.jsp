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
<title>영화</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-main-movieInfo movie-detail-container">
			<div class="d-flex align-items-center mt-2 cafe-create movieSelectBox-movieList">
				<div class="textWhite mr-3">영화</div>
				<select class="form-control textWhite pl-1" id="movieSelect">
	                <option value="0" selected>한국</option>
	                <option value="1">오늘의 TOP</option>
	                <option value="2">애니메이션</option>
	                <option value="3">액션 & 스릴러</option>
	                <option value="4">코미디</option>
	                <option value="5">로맨스</option>
	                <option value="6">SF</option>
	                <option value="7">호러</option>
	                <option value="8">가족</option>
	                <option value="9">모험</option>
	                <option value="10">판타지</option>
	                <option value="11">전쟁</option>
	                <option value="12">음악</option>
	                <option value="13">범죄</option>
	                <option value="14">다큐멘터리</option>
	                <option value="15">역사</option>
           		</select>	
			</div>
			
			<div class="movieList mb-3 recommend-select-box">
				<c:forEach var="koreaMovieList" items="${mainpageKoreaMovieList}">
					<a href="/movie/detail/recommend/view?movieId=${koreaMovieList.id}"><img src="${koreaMovieList.poster_path}"></a>
				</c:forEach>
			</div>
							
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<script>

	$(document).ready(function(){
		
		let click = 1;
		
		$(window).scroll(function() {
			  // 현재 스크롤 위치 계산
			  var currentPosition = $(window).scrollTop();
			  
			  let movieSelectNumber = $("#movieSelect").val();
			  
			  var movieNumberList = ["1", "2", "16", "28,53", "35", "10749", "878", "27", "10751" 
					,"12", "14", "10752" , "10402", "80", "99", "36"];
			  
			  movieNumber = movieNumberList[movieSelectNumber];

			  // 스크롤이 페이지 하단에 도달하면 추가 데이터 로드
			  if (currentPosition == $(document).height() - $(window).height()) {
			    // 추가 데이터 로드하는 코드 
				  $.ajax({
						type:"get"
						, url:"/movie/nextList"
						, data:{"click":click, "movieInfo":movieNumber}
						, success:function(data){
							if(data.result == "success") {
								
								let list = data.nextList;
								
								console.log(list);
								
								for (var i = 0; i < list.length; i++) {
									
									
									if(list[i].poster_path != null && !list[i].poster_path.endsWith("null")) {
										
										var aTagInfo = "<a href=\"/movie/detail/recommend/view?movieId=" + list[i].id + "\"><img src=" + list[i].poster_path + "></a>";
										
										$(".movieList").append(aTagInfo);
									}
									
								};
								
								click++;
									
							} else {
								alert("리스트추가 실패");
							}
						}
						, error:function(){
							alert("리스트추가 에러");
						}
							
					});
			  }
			});
		
		$("#movieSelect").on("change", function(){
			let movieSelectNumber = $(this).val();
			
			click = 1;
			$.ajax({
				type:"get"
				, url:"/movie/list"
				, data:{"movieSelectNumber":movieSelectNumber}
				, success:function(data){
					
					let list = data.movieList;
					
					let aTagList = "";
					
					for (var i = 0; i < list.length; i++) {
						
						if(list[i].poster_path != null && !list[i].poster_path.endsWith("null")) {
							
							var aTagInfo = "<a href=\"/movie/detail/recommend/view?movieId=" + list[i].id + "\"><img src=" + list[i].poster_path + "></a>";
							
							aTagList += aTagInfo;
							
						}
					}
					
					$(".movieList").html(aTagList);
					
				}
				, error:function(){
					console.log("영화 목록 가져오기 에러");
				}
				
			});
		});
		
		
	


	});
</script>
</html>
