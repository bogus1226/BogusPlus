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
<title>게시물 수정하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
		
		<section class="post-container previw-container d-flex">
		
			<div class="preview ml-5">
				<div class="textWhite text-center mt-5">미리보기</div>
				
				<div class="previewBox sudaPost previewPost mt-2 mb-4">
					<div class="post-header d-flex align-items-center justify-content-between">
						<div class="userName ml-3">${userName}</div>
					</div>
					
					<c:choose>
						<c:when test="${not empty post.imagePath}">
							<div class="preview-image">
								<img id="viewImage" src="${post.imagePath}">
							</div>
						</c:when>
						
						<c:otherwise>
							<div class="preview-image d-none">
								<img id="viewImage" src="">
							</div>
							<hr id="preview-hr" class="mt-1 mb-0">
						</c:otherwise>
					</c:choose>
					<div class="post-text-container d-flex">
						<div class="post-text-icon"></div>
						<div class="post-text d-flex justify-content-center">
							<div class="previewText textWhite mt-1" style="word-break:break-all;">${post.content}</div>
						</div>
					</div>
				</div>
			</div>
			
			<section class="suda-main-contents">
				<div class="fontBMJUA text-center">${cafe.name} <span class="myText">수정하기</span></div>
				
				<nav class="pt-2 nav-item d-flex" id="postNavLink">
					<a class="nav-link"><span class="select">수다</span></a>
				</nav>
				
				<textarea cols="25" rows="7" class="form-control mt-3 fontBMJUA" placeholder="게시물 내용" id="contentArea">${post.content}</textarea>
				<div class="textRed mt-1 d-none" id="contentText">내용을 입력해주세요</div>
				<div class="d-flex justify-content-between upload-last">
					<div class="image-file-input d-flex">
						<i id="imageIcon" class="bi bi-image iconGray mt-1"></i>
						<c:choose>
							<c:when test="${empty post.imagePath}">
								<div class="imageText"></div>
							</c:when>
							<c:otherwise>
								<div class="imageText" id="existingImage"></div>
							</c:otherwise>
						</c:choose>
						<input id="fileInput" type="file" class="d-none">
						<c:choose>
							<c:when test="${not empty post.imagePath}">
								<button type="button" class="btn btn-sm redBtn ml-2 deleteBtn"><i class="bi bi-trash3-fill"></i></button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-sm redBtn ml-2 deleteBtn d-none"><i class="bi bi-trash3-fill"></i></button>
							</c:otherwise>
						</c:choose>
					</div>
					
					<button type="button" class="btn blueBtn mt-3" id="saveBtn" data-cafeid="${cafeId}" data-postid="${post.id}">저장</button>
				</div>
			</section>
		</section>
		

		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

	</div>
</body>

<script>

	$(document).ready(function(){
		
		let imagePath = "${post.imagePath}";
		
		if(imagePath != null) {
			
			imagePath = imagePath.split("/");
			
			$("#existingImage").text(imagePath[3]);
		}
		
		var fileCheck = 0;
		
		
		$(".deleteBtn").on("click", function(){
			$(".deleteBtn").addClass("d-none");
			$("#preview-hr").removeClass("d-none");
			$(".preview-image").addClass("d-none");
			$("#fileInput").val("");
			$(".imageText").empty();
			
			fileCheck = 1;
		});
		
		$("#contentArea").on("input", function(){
			$("#contentText").addClass("d-none");
			
			$(".previewText").empty();
			
			let content = $(this).val();
			
			content = content.replaceAll("\n", "<br>");
			content = content.replaceAll("\u0020", "&nbsp;");
			
			$(".previewText").append(content);
			
			if(content.trim() == "") {
				$(".previewText").empty();
				$(".previewText").append("<span class=\"textPlaceHolder\">내용을 입력해주세요</span>");
			} 
		});
		
		$("#saveBtn").on("click", function(){
			let content = $("#contentArea").val();
			let file = $("#fileInput")[0];
			let cafeId = $(this).data("cafeid");
			let postId = $(this).data("postid");
			
			if(content.trim() == "") {
				$("#contentText").removeClass("d-none");
				return;
			}
			
			content = content.replaceAll("\n", "<br>");
			content = content.replaceAll("\u0020", "&nbsp;");
			
			var formData = new FormData();
			formData.append("postId", postId);
			formData.append("content", content);
			formData.append("file", file.files[0]);
			
			console.log(file.files[0]);

			if(fileCheck == 1) {
				$.ajax({
					type:"post"
					, url:"/suda/cafe/post/update"
					, data:formData
					, enctype:"multipart/form-data" 
					, processData:false 
					, contentType:false 
					, success:function(data){
						if(data.result == "success") {
							location.href = "/suda/cafe/mainpage/view?cafeId=" + cafeId;
						} else {
							console.log("수정하기(전체) 실패");
						}	
					}
					, error:function(){
						console.log("수정하기(전체) 에러");
					}
					
				});	
			} else if(fileCheck == 0) {
				$.ajax({
					type:"post"
					, url:"/suda/cafe/post/update/imageNotChange"
					, data:{"postId":postId, "content":content}
					, success:function(data){
						if(data.result == "success") {
							location.href = "/suda/cafe/mainpage/view?cafeId=" + cafeId;
						} else {
							console.log("수정하기(이미지 제외) 실패");
						}	
					}
					, error:function(){
						console.log("수정하기(이미지 제외) 에러");
					}
					
				});	
			}
			
		});
		
		$("#fileInput").on("change", function(){	
			
			fileCheck = 1;
			
			$(".deleteBtn").removeClass("d-none");
			
			$("#preview-hr").addClass("d-none");
			$(".preview-image").removeClass("d-none");
			
			
			$(".imageText").empty();
			
			var file = document.getElementById("fileInput");
			
			var filePath = file.files[0];
			
			var fileName = filePath.name;
			
			$(".imageText").append(fileName);
			
			var reader = new FileReader();
			
			reader.onload = function(e) {
				 $("#viewImage").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(filePath);
			
			
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
