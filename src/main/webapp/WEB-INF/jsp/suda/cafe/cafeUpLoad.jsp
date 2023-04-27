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
<title>까페 글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section class="post-container d-flex">
		
			<div class="preview bg-info">
				<div class="previewBox sudaPost mt-2 mb-4">
					<div class="post-header d-flex align-items-center justify-content-between">
						<div class="userName ml-3">보거스</div>
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
							<div class="textWhite mt-2">안녕하세요</div>
						</div>
						
						<div class="post-text-icon mt-2 d-flex justify-content-end align-items-end">
							<i class="bi bi-caret-down-fill iconBtn mr-2"></i>
						</div>
		
					</div>
					
					<hr class="mt-1 mb-3">
					
				</div>
			</div>
			
			<section class="suda-main-contents">
				<div class="fontBMJUA text-center">${cafe.name} <span class="myText">글쓰기</span></div>
				
				<nav class="pt-2 nav-item d-flex" id="postNavLink">
					<a class="nav-link"><span class="select">수다</span></a>
					<a href="#" class="nav-link">함께하기</a>
				</nav>
				
				<textarea rows="7" class="form-control mt-3 fontBMJUA" placeholder="게시물 내용" id="contentArea"></textarea>
				<div class="textRed mt-1 d-none" id="contentText">내용을 입력해주세요</div>
				<div class="d-flex justify-content-between upload-last">
				
					<div class="image-file-input d-flex">
						<i id="imageIcon" class="bi bi-image iconGray mt-1"></i>
						<div class="imageText"></div>
						<input id="fileInput" type="file" class="d-none">
					</div>
					
					<button type="button" class="btn blueBtn mt-3" id="saveBtn" data-userid="${userId}" data-cafeid="${cafeId}">저장</button>
				</div>
			</section>
		</section>
		

		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

	</div>
</body>

<script>

	$(document).ready(function(){
		
		$("#contentArea").on("input", function(){
			$("#contentText").addClass("d-none");
		});
		
		$("#saveBtn").on("click", function(){
			let userId = $(this).data("userid");
			let content = $("#contentArea").val();
			let file = $("#fileInput")[0];
			let cafeId = $(this).data("cafeid");

			if(content.trim() == "") {
				$("#contentText").removeClass("d-none");
				return;
			}
			
			content = content.replace("\n", "<br>");
			
			var formData = new FormData();
			formData.append("userId", userId);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			formData.append("cafeId", cafeId);

			$.ajax({
				type:"post"
				, url:"/suda/cafe/post/create"
				, data:formData
				, enctype:"multipart/form-data" 
				, processData:false 
				, contentType:false 
				, success:function(data){
					if(data.result == "success") {
						location.href = "/suda/cafe/mainpage/view?cafeId=" + cafeId;
					} else {
						alert("글쓰기 실패");
					}	
				}
				, error:function(){
					alert("글쓰기 에러");
				}
				
			});
			
		});
		
		$("#fileInput").on("change", function(){			
			
			$(".imageText").empty();
			
			let name = $(this).val();
			name = name.substring(12);
			
			$(".imageText").append(name);

		});
		
		$("#imageIcon").on("click", function(){	
			$("#fileInput").click();
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
