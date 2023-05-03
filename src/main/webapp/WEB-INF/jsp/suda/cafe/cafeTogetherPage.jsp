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
<title>함께하기</title>
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
				<a class="nav-link"><span class="select">함께하기</span></a>
				<a href="#" class="nav-link">대기중</a>
				<a href="#" class="nav-link">참석완료</a>
				<a href="#" class="nav-link">MyPage</a>
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
									<i class="bi bi-geo-alt placeIcon" id="placeBtn"></i>
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
									<div class="togetherTextGray mt-3 ml-3" style="word-break:break-all;">ENFJ</div>
								</div>
							</div>
							
							<!-- 내용 -->
							<div class="post-text-container d-flex mt-3">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-center post-text-background">
									<div class="textWhite mt-2 pl-4 pr-4" style="word-break:break-all;">${togetherList.title}</div>
								</div>
							</div>
							
							<!-- 참석하기 버튼 -->
							<div class="post-text-container d-flex mt-3 pb-3">
								<div class="post-text-icon"></div>
								<div class="post-text d-flex justify-content-end">
									<button type="button" class="btn btn-sm btn-primary">참석하기</button>
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
<div class="modal fade" id="selectBtns" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-body d-flex justify-content-between">
      	<div>
			<a class="btn btn-sm mr-2 btn-primary" href="#" id="updateBtn">수정하기</a>
			<button type="button" class="btn btn-sm btn-danger" id="postDeleteBtn" >삭제하기</button>
		</div>
		<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<script>

	$(document).ready(function(){
		
		$(".iconSelectBtns").on("click", function(){
			let postId = $(this).data("postid");
			
			$("#postDeleteBtn").data("postid", postId);
			
			//$("#updateBtn").attr("href", "url" + postId);	
		});
		
		$("#postDeleteBtn").on("click", function(){
			let postId = $(this).data("postid");
			
			$.ajax({
				type:"get"
				, url:"/suda/cafe/post/delete"
				, data:{"postId":postId}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("게시물 삭제 실패");
					}	
				}
				, error:function(){
					console.log("게시물 삭제 에러");
				}
				
			});	
		});
		
		$(".deleteBtn").on("click", function(){
			let commentId = $(this).data("id");
			
			$.ajax({
				type:"get"
				, url:"/suda/cafe/post/comment/delete"
				, data:{"commentId":commentId}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("댓글 실패");
					}	
				}
				, error:function(){
					console.log("댓글 에러");
				}
				
			});	
		});
		
		$(".commentBtn").on("click", function(){
			
			let postId = $(this).data("postid");
			
			let comment = $("#commentInput" + postId).val();
			
			if(comment.trim() == "") {
				return;
			}
			
			$.ajax({
				type:"post"
				, url:"/suda/cafe/post/comment/add"
				, data:{"postId":postId, "comment":comment}
				, success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						console.log("댓글 실패");
					}	
				}
				, error:function(){
					console.log("댓글 에러");
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
