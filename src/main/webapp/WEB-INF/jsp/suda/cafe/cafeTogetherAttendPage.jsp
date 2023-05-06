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
<title>함께하기(참석완료)</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>

	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
	<section class="post-container d-flex">
			
		<section class="suda-main-contents">
			<div class="fontBMJUA text-center">${cafe.name}</div>
				
			<nav class="pt-2 nav-item d-flex" id="postNavLink">
				<a href="/suda/cafe/mainpage/view?cafeId=${cafeId}" class="nav-link">수다</a>
				<a href="/suda/cafe/together/view?cafeId=${cafeId}" class="nav-link">함께하기</a>
				<a href="/suda/cafe/waiting/view?cafeId=${cafeId}" class="nav-link">대기중</a>
				<a class="nav-link"><span class="select">참석완료</span></a>
				<a href="/suda/cafe/mypage/view?cafeId=${cafeId}" class="nav-link">MyPage</a>
				<a href="/suda/cafe/upload/view?cafeId=${cafeId}" class="nav-link">글쓰기</a>
			</nav>
				
			<c:choose>
				<c:when test="${!empty togetherList}">
					<c:forEach var="togetherList" items="${togetherList}">
						<div class="sudaPost mt-2 mb-4">
							<div class="post-header d-flex align-items-center">
								<div class="userName pl-3 nickNameSpace">${togetherList.nickName}</div>
								<div class="textYellow attendSpace text-center">참석인원 (${togetherList.statusCount})</div>
							</div>
				
							<hr class="mt-1 mb-0">
							
							<!-- 제목 -->
							<div class="post-text-container d-flex">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-center">
									<div class="textWhite mt-2" style="word-break:break-all;">${togetherList.title}</div>
								</div>
							</div>
							
							<!-- 장소 -->
							<div class="post-text-container d-flex">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex align-items-center">
									<!-- Button trigger modal -->
									<i class="bi bi-geo-alt placeIcon" data-toggle="modal" data-target="#selectBtns" 
									data-place-x="${togetherList.placeAddressX}" data-place-y="${togetherList.placeAddressY}"></i>
									<!-- Button trigger modal -->
									<div class="textWhite ml-1">장소</div>
									<div class="togetherTextGray ml-3" style="word-break:break-all;">${togetherList.placeName}</div>
								</div>
							</div>
							
							<!-- 날짜 -->
							<div class="post-text-container d-flex">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex post-text-padding">
									<div class="textWhite mt-3">날짜</div>
									<div class="togetherTextGray mt-3 ml-3" style="word-break:break-all;">${togetherList.date}</div>
								</div>
							</div>
							
							<!-- MBTI -->
							<div class="post-text-container d-flex">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex post-text-padding">
									<div class="textWhite mt-3">MBTI</div>
									<div class="togetherTextGray mt-3 ml-3" style="word-break:break-all;">${togetherList.mbti}</div>
								</div>
							</div>
							
							<!-- 내용 -->
							<div class="post-text-container d-flex mt-3">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-center post-text-background">
									<div class="textWhite mt-2 pl-4 pr-4" style="word-break:break-all;">${togetherList.title}</div>
								</div>
							</div>
							
							<!-- 톡보기 버튼 -->
							<div class="post-text-container d-flex">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-end">
									<i class="bi bi-caret-down-fill iconBtn mr-2 downBtn" data-togetherid="${togetherList.id}"></i>
									<i class="bi bi-caret-up-fill d-none iconBtn mr-2 upBtn" data-togetherid="${togetherList.id}"></i>
								</div>
							</div>
							
							
							
							<!-- 보거스 톡 -->
							<div class="d-none" id="bogus-talk-wrap${togetherList.id}">
								<div class="post-text-container d-flex pb-3">
									
									<div class="post-text-icon"></div>
									
									<div class="talk-box post-text-background">
										<c:forEach var="bogusTalk" items="${togetherList.bogusTalkList}">
											<c:choose>
												<c:when test="${bogusTalk.userId eq userId}">
													<!-- 나의 톡  -->
													<div class="d-flex justify-content-end pt-2">
														<div class="post-text d-flex justify-content-end mr-3">
															<div class="my-talk-background">
																<div class="textWhite" style="word-break:break-all;">${bogusTalk.talk}</div>
															</div>
														</div>
													</div>
													<!-- 나의 톡 -->
												</c:when>
												
												<c:otherwise>
													<!-- 상대방톡 -->
													<div class="pt-2">
														<div class="post-text">
															<div class="post-text-background d-flex">
																<div class="post-talk-space"></div>
																<div class="d-flex">
																	<div class="textWhite">${bogusTalk.nickName}</div>
																</div>
																<div class="post-talk-space"></div>
															</div>
														</div>
													</div>
													
													<div class="">
														<div class="post-text">
															<div class="post-text-background d-flex">
																<div class="post-talk-space"></div>
																<div class="post-talk-background">
																	<div class="textWhite" style="word-break:break-all;">${bogusTalk.talk}</div>
																</div>
																<div class="post-talk-space"></div>
															</div>
														</div>
													</div>
													<!-- 상대방톡 -->
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<form>
											<div class="post-text-container d-flex pt-3">
												<div class="post-text-icon"></div>
												<div class="post-text d-flex post-text-background">
													<div class="post-text-icon"></div>
													<div class="input-group talk-group bg-secondary">
														<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="talkInput${togetherList.id}">
														<div class="input-group-append">
															<button class="btn btn-secondary talkBtn" type="submit" data-togetherid="${togetherList.id}">Talk</button>
														</div>
													</div>
													<div class="post-text-icon"></div>
												</div>
											</div>
										</form>
									</div>
									<div class="post-text-icon"></div>
								</div>
							</div>
							
							
							<!-- 취소 버튼 -->
							<div class="post-text-container d-flex mt-3 pb-3">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-start">
									<button type="button" class="btn deleteBtn btn-secondary" data-togetherid="${togetherList.id}">취소</button>
								</div>
							</div>
							
						</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div class="empty-text-container">
						<div class="empty-box">
							<div class="d-flex justify-content-center">
								<i class="bi bi-emoji-dizzy emptyIcon"></i>
							</div>
							<div class="d-flex justify-content-center emptyText">
								<div class="fontBMJUA">글쓰기로 게시물을 저장해주세요!</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</section>
		
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
</div>
</body>

<!-- Modal -->
<div class="modal placeBox fade" id="selectBtns" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body d-flex justify-content-between">
      	<div style="width:1140px;margin:auto;" class="placeBox mt-2 mb-5">
			<div id="map" style="width:1140px;height:600px;"></div>
	    	<div class="d-flex justify-content-end mt-2">
	    		<button type="button" class="btn grayBtn mt-2" id="deleteBtn" data-dismiss="modal">닫기</button>
	    	</div>
		</div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->


<script>

	$(document).ready(function(){
		
		$(".downBtn").on("click", function(){
			
			let togetherId = $(this).data("togetherid");
			
			$(this).addClass("d-none");
			$(this).next().removeClass("d-none");  
			
			$("#bogus-talk-wrap" + togetherId).removeClass("d-none"); 
		}); 
		
		$(".upBtn").on("click", function(){
			
			let togetherId = $(this).data("togetherid");
			
			$(this).addClass("d-none");
			$(this).prev().removeClass("d-none");  	
			
			$("#bogus-talk-wrap" + togetherId).addClass("d-none"); 
		}); 
		
		$(".talkBtn").on("click", function(){
			let togetherId = $(this).data("togetherid");
			let talk = $("#talkInput" + togetherId).val();
			
			if(talk.trim() == "") {
				return;
			}
			
			$.ajax({
				type:"get"
				, url:"/suda/cafe/together/talk"
				, data:{"togetherId":togetherId, "talk":talk}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("톡 달기 실패");
					}	
				}
				, error:function(){
					console.log("톡 달기 에러");
				}
				
			});	
			
		});
		
		
		$(".placeIcon").on("click", function(){
			let placeX = $(this).data("place-x");
			let placeY = $(this).data("place-y");
				
			var map = new naver.maps.Map('map', {
			    center: new naver.maps.LatLng(placeY, placeX),
			    zoom: 15
			});

			var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(placeY, placeX),
			    map: map
			});
			
		});
		
		$(".deleteBtn").on("click", function(){
			
			let togetherId = $(this).data("togetherid");
			
			$.ajax({
				type:"get"
				, url:"/suda/cafe/together/notAttend"
				, data:{"togetherId":togetherId}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("참석하기 실패");
					}	
				}
				, error:function(){
					console.log("참석하기 에러");
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
