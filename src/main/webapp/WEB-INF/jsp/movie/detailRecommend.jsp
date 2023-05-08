<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<!-- 유튜브 -->
	<script src="https://www.youtube.com/iframe_api"></script>
<title>영화 상세화면(추천작)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>

<script>
	window.onload = function() {
	    var videoModal = document.getElementById("videoModal");
	    var videoIframe = videoModal.querySelector("#ytplayer");
	    var videoId = "${tmdbMovieId.key}"; // 로드할 동영상 ID
	
	    videoIframe.src = "https://www.youtube.com/embed/" + videoId + "?autoplay=0";
	}
	

</script>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-main-movieInfo">
			<div class="movie-detail-container mt-5">
			
				<div class="info-text-review">
					<div class="movieName ml-2">${tmdb.title}</div>
					
					<div class="d-flex mt-3 ml-2">
						<div class="textWhite mr-3">${fn:substring(tmdb.release_date, 0, 4)}</div>
						<c:choose>
							<c:when test="${Integer(tmdb.runtime / 60) > 0}">
								<div class="textWhite">${Integer(tmdb.runtime / 60)}시간 ${tmdb.runtime % 60}분</div>
							</c:when>
							<c:otherwise>
								<div class="textWhite">${tmdb.runtime % 60}분</div>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="d-flex smallGray ml-2">
						<c:forEach var="genres" items="${tmdb.genres}">
							<div class="mr-2">${genres.name}</div>
						</c:forEach>
					</div>
					
					<div class="d-flex mt-4 movie-select-btns ml-2">
						<c:choose>
							<c:when test="${not empty tmdbMovieId.key}">
								<button type="button" class="btn btn-light mr-4" id="playBtn">
									<i class="bi bi-play-fill playIcon" data-toggle="modal" data-target="#videoModal"></i>
									<span class="textBlack ml-1">재생</span>
								</button>
							</c:when> 
							<c:otherwise>
								<button type="button" class="btn btn-danger mr-4" id="playBtn">
									<i class="bi bi-play-fill playIcon"></i>
									<span class="textWhite ml-1">재생불가</span>
								</button>
							</c:otherwise>
						</c:choose>
						<button type="button" class="btn" id="interestBtn">
						    <i class="bi bi-plus-lg plusIcon"></i>
						</button>
					</div>
					
					<div class="textWhite mt-5 overview ml-2">${tmdb.overview}</div>
				</div>
				
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
				
					<c:choose>
						<c:when test="${not empty recommendList}">
							<div class="recommend mb-3">
								<c:forEach var="recommendList" items="${recommendList}">
									<a href="/movie/detail/recommend/view?movieId=${recommendList.id}"><img src="${recommendList.poster_path}"></a>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="textWhite ml-2">추천작이 없습니다</div>
						</c:otherwise>
					</c:choose>
				
			</div>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<!-- Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body">
        <!-- YouTube 동영상을 보여줄 iframe 태그 -->
        <iframe id="ytplayer" type="text/html" width="100%" height="360" src="" frameborder="0" allowfullscreen></iframe>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->



<script>

	$(document).ready(function(){
		
		$("#wrap").css({
			  "background-image": "url(${tmdb.backdrop_path})",
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
