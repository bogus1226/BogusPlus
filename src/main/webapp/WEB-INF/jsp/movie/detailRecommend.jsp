<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<body>
	<div id="wrap">
		<div class="info-text-review pb-3">
			<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		</div>
		
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
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-light mr-4" id="playBtn" data-toggle="modal" data-target="#videoModal">
									<i class="bi bi-play-fill playIcon"></i>	
									<span class="textBlack ml-1">재생</span>
								</button>
								<!-- Button trigger modal -->
							</c:when> 
							<c:otherwise>
								<button type="button" class="btn btn-danger mr-4" id="playBtn">
									<i class="bi bi-play-fill playIcon"></i>
									<span class="textWhite ml-1">재생불가</span>
								</button>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${interestIsDuplicate}">
								<button type="button" class="btn btn-sm redBtn deleteBtn ml-2" id="deleteInterestBtn" data-movieid="${movieId}">
								    <i class="bi bi-trash3-fill"></i>
								</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn" id="interestBtn" data-movieid="${movieId}" data-poster-path="${tmdb.poster_path}">
								    <i class="bi bi-plus-lg plusIcon"></i>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="textWhite mt-5 overview ml-2">${tmdb.overview}</div>
				</div>
				
				<div class="info-text-review d-flex justify-content-between mt-5">
					<div class="d-flex mt-2">
						<button type="button" class="btn notBackground detailTextWhite" id="recommendBtn">추천작</button>
						<button type="button" class="btn notBackground detailText" id="movieInfoBtn">상세정보</button>
						<button type="button" class="btn notBackground detailText" id="reviewBtn">후기</button>
					</div>
					
					<div class="d-flex review mt-3">
						<div class="textWhite mr-3">영화</div>
						<div class="textYellow mr-4">평점 ${fn:substring(tmdb.vote_average, 0,3)}</div>
						<div class="textWhite mr-3">Bogus+</div>
						<c:choose>
							<c:when test="${reviewAverage eq 0}">
								<div class="textYellow mr-1">등록된 리뷰가 없습니다</div>
							</c:when>
							<c:otherwise>
								<div class="textYellow mr-1">평점 ${reviewAverage}</div>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
				
				<hr class="mt-1">
				
				<c:choose>
					<c:when test="${not empty recommendList}">
						<div class="recommend mb-3 recommend-select-box">
							<c:forEach var="recommendList" items="${recommendList}">
								<a href="/movie/detail/recommend/view?movieId=${recommendList.id}"><img src="${recommendList.poster_path}"></a>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="textWhite ml-2 recommend-select-box">추천작이 없습니다</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div class="credits-select-box d-none">
			<div class="movie-detail-container mb-3 d-flex flex-wrap">
				<c:forEach var="creditsList" items="${creditsList}">
					<div class="movieCredits text-center info-text-review mb-3 mt-3">
						<img src="${creditsList.profile_path}">
						<div class="textWhite">${creditsList.character}</div>
						<div class="textWhite">${creditsList.name}</div>
					</div>	
				</c:forEach>
			</div>
		</div>
		
		<div class="movie-detail-container mb-3 review-back review-select-box d-none movie-main-movieInfo">
			
			<c:choose>
				<c:when test="${!empty reviewList}">
					<c:forEach var="reviewList" items="${reviewList}">
						<div class="d-flex pt-2 pb-2">
							<div class="textWhite pl-2 pt-1 col-1 p-0">${reviewList.nickName}</div>
							<div class="textWhite col-9 p-0 pt-1">${reviewList.content}</div>
							<div class="d-flex col-2 p-0">
								<div></div>
								<fmt:formatDate var="reviewDate" value="${reviewList.date}" pattern="yyyy년 MM월 dd일"/>
								<div class="textWhite pt-1 pl-5">${reviewDate}</div>
								<c:if test="${reviewList.userId eq userId}">
									<button type="button" class="btn btn-sm ml-3 redBtn deleteBtn" data-reviewid="${reviewList.id}"><i class="bi bi-trash3-fill"></i></button>
								</c:if>
							</div>
						</div>
						
						<hr class="m-0">
					</c:forEach> 
				</c:when>
				<c:otherwise>
					<div class="textWhite text-center pt-2 review-select-box d-none">작성된 후기가 없습니다</div>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${!isDuplicate}">
				<div class="mt-3 col-4 reviewUpdateBox p-0 pb-4 cafe-create">
					<input type="text" class="form-control" placeholder="후기를 입력해주세요" id="reviewInput">
					<div class="textGreen mt-1 ml-1" id="reviewText">한번 작성한 리뷰는 수정할수없습니다</div>
					<div class="textRed d-none mt-1 ml-1" id="reviewNonText">후기를 입력해주세요</div>
					<div class="d-flex justify-content-between mt-2 cafe-create">
						<select class="form-control col-3" id="pointSelect">
			                <option value="" disabled selected>평점</option>
			                <option>1</option>
			                <option>2</option>
			                <option>3</option>
			                <option>4</option>
			                <option>5</option>
			                <option>6</option>
			                <option>7</option>
			                <option>8</option>
			                <option>9</option>
			                <option>10</option>
	            		</select>
						<button type="button" class="btn blueBtn" id="saveBtn" data-movieid="${movieId}">저장</button>
					</div>
					<div class="textRed ml-1 d-none" id="gradeSapce">평점을 선택해주세요</div>
				</div>
			</c:if>
			

		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<!-- Modal -->
<div class="modal fade" id="videoModal">	
	<div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      	<div class="modal-body">
		        <!--  YouTube 동영상을 보여줄 iframe 태그 -->
		        <iframe id="ytplayer" src="https://www.youtube.com/embed/${tmdbMovieId.key}?autoplay=0"  width="100%" height="360"></iframe>
	      	</div>
	    </div>
	</div>
</div> 
<!-- Modal -->



<script>

	$(document).ready(function(){
		
		$("#deleteInterestBtn").on("click", function(){
			
			let movieId = $(this).data("movieid");
			
			$.ajax({
				type:"get"
				, url:"/movie/interest/delete"
				, data:{"movieId":movieId}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("관심목록 취소 실패");
					}	
				}
				, error:function(){
					console.log("관심목록 취소 에러");
				}
				
			});
		});
		
		$("#interestBtn").on("click", function(){
			
			let movieId = $(this).data("movieid");
			let posterPath = $(this).data("poster-path");
			
			$.ajax({
				type:"get"
				, url:"/movie/interest/add"
				, data:{"movieId":movieId, "posterPath":posterPath}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("관심목록 추가 실패");
					}	
				}
				, error:function(){
					console.log("관심목록 추가 에러");
				}
				
			});
			
		});
		
		$(".deleteBtn").on("click", function(){
			let reviewId = $(this).data("reviewid");
			
			$.ajax({
				type:"get"
				, url:"/movie/review/delete"
				, data:{"reviewId":reviewId}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("리뷰 삭제 실패");
					}	
				}
				, error:function(){
					console.log("리뷰 삭제 에러");
				}
				
			});
			
		});
		
		$("#pointSelect").on("change", function(){
			$("#gradeSapce").addClass("d-none");
		});
		
		$("#reviewInput").on("input", function(){
			$("#reviewNonText").addClass("d-none");
			$("#reviewText").removeClass("d-none");
		});
		
 		$("#saveBtn").on("click", function(){
			let content = $("#reviewInput").val();
			let grade = $("#pointSelect").val();
			let movieId = $(this).data("movieid");
			
			if(content.trim() == "") {
				$("#reviewText").addClass("d-none");
				$("#reviewNonText").removeClass("d-none");
				return;
			}
			
			if(grade == null) {
				$("#gradeSapce").removeClass("d-none");
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/movie/review/add"
				, data:{"movieId":movieId, "content":content, "grade":grade}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("리뷰 실패");
					}	
				}
				, error:function(){
					console.log("리뷰 에러");
				}
				
			});
			
		});	
		
		$("#recommendBtn").on("click", function(){
			
			$(".review-select-box").addClass("d-none");
			$(".credits-select-box").addClass("d-none");
			$(".recommend-select-box").removeClass("d-none");
			
			$(this).removeClass("detailText");
			$(this).addClass("detailTextWhite");
			
			$("#movieInfoBtn").removeClass("detailTextWhite");
			$("#movieInfoBtn").addClass("detailText");
			
			$("#reviewBtn").removeClass("detailTextWhite");
			$("#reviewBtn").addClass("detailText");
			
		});
		
		$("#movieInfoBtn").on("click", function(){
			
			$(".review-select-box").addClass("d-none");
			$(".recommend-select-box").addClass("d-none");
			$(".credits-select-box").removeClass("d-none");
			
			$(this).removeClass("detailText");
			$(this).addClass("detailTextWhite");
			
			$("#recommendBtn").removeClass("detailTextWhite");
			$("#recommendBtn").addClass("detailText");
			
			$("#reviewBtn").removeClass("detailTextWhite");
			$("#reviewBtn").addClass("detailText");
		});
		
		$("#reviewBtn").on("click", function(){
			
			$(".review-select-box").removeClass("d-none");
			$(".recommend-select-box").addClass("d-none");
			$(".credits-select-box").addClass("d-none");
			
			$(this).removeClass("detailText");
			$(this).addClass("detailTextWhite");
			
			$("#recommendBtn").removeClass("detailTextWhite");
			$("#recommendBtn").addClass("detailText");
			
			$("#movieInfoBtn").removeClass("detailTextWhite");
			$("#movieInfoBtn").addClass("detailText");
		});
		

		$("#wrap").css({
			  "background-image": "url(${tmdb.backdrop_path})",
			  "background-size": "100%"
			});
		

		
		
		
		
	});
</script>
</html>
