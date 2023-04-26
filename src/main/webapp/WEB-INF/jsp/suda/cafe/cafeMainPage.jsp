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
<title>까페 메인페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>

		<div id="movie-wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section class="post-container d-flex">
		
			<div class="writingBtn-container"></div>
			
			<section class="suda-main-contents">
				<div class="fontBMJUA text-center">${cafe.name}</div>
				
				<nav class="pt-2 nav-item d-flex" id="postNavLink">
					<a class="nav-link"><span class="select">수다</span></a>
					<a href="#" class="nav-link">함께하기</a>
					<a href="#" class="nav-link">대기중</a>
					<a href="#" class="nav-link">참석완료</a>
					<a href="#" class="nav-link">MyPage</a>
					<a href="/suda/cafe/upload/view?cafeId=${cafeId}" class="nav-link">글쓰기</a>
				</nav>
				
				<c:choose>
					<c:when test="${!empty postDetail}">
						<c:forEach var="postDetail" items="${postDetail}">
							<div class="sudaPost mt-2 mb-4">
								<div class="post-header d-flex align-items-center justify-content-between">
									<div class="userName ml-3">${postDetail.nickName}</div>
									<c:if test="${postDetail.userId eq userId}">
										<i class="bi bi-three-dots btn iconBtn"></i>
									</c:if>
								</div>
								
								<c:choose>
									<c:when test="${!empty postDetail.imagePath}">
										<div class="post-image">
											<img src="${postDetail.imagePath}">
										</div>
									</c:when>
									
									<c:otherwise>
										<hr class="mt-1 mb-0">
									</c:otherwise>
								</c:choose>
								
								<div class="post-text-container d-flex">
									<div class="post-text-icon"></div>
									<div class="post-text d-flex justify-content-center">
										<div class="textWhite mt-2">${postDetail.content}</div>
									</div>
									
									<div class="post-text-icon mt-2 d-flex justify-content-end align-items-end">
										<i class="bi bi-caret-down-fill iconBtn mr-2"></i>
									</div>
									
								</div>
								
								<hr class="mt-1 mb-2">
								
								<c:forEach var="comment" items="${postDetail.commentList}">
									<div class="post-comment-container d-flex justify-content-between">
										<div class="d-flex">
											<div class="post-userName">
												<div class="textWhite ml-3">${comment.nickName}</div>
											</div>
											
											<div class="post-comment ml-2">
												<div class="commentText">${comment.comment}</div>
											</div>
										</div>
										
										<c:if test="${comment.userId eq userId}">
											<button type="button" class="btn btn-sm mr-2 redBtn">삭제</button>
										</c:if>
									</div>
									
									<hr class="mt-2">
								</c:forEach>
								
								<div class="post-comment-button d-flex justify-content-center">
									<div class="input-group col-8 comment-button-box">
										<input type="text" class="form-control" placeholder="내용을 입력해주세요" id="commentInput">
										<div class="input-group-append">
											<button class="btn grayBtn" type="button" id="commentBtn" data-postid="${PostDetail.id}">댓글</button>
										</div>
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

<script>

	$(document).ready(function(){
		
		$("#commentBtn").on("click", function(){
			let comment = $("#commentInput").val();
			let postId = $(this).data("postid");
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
