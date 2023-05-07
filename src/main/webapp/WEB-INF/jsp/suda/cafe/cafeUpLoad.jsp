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
		
		<div class="mt-3 d-none" id="movieSearchLine">
			<input type="text" class="searchBox movieSearchInput" id="movieSearchInput" placeholder="영화 검색"></input>
		</div>
		
		<div class="searchMovieInfo"></div>
		
		<div class="movie-main-movieInfo">
			<section class="post-container previw-container d-flex">
			
				<div class="preview d-none ml-5">
					<div class="textWhite text-center mt-5">미리보기</div>
					
					<div class="previewBox sudaPost previewPost mt-2 mb-4">
						<div class="post-header d-flex align-items-center justify-content-between">
							<div class="userName ml-3">${userName}</div>
						</div>
						
						<div class="preview-image d-none">
							<img id="viewImage" src="">
						</div>
	
						<hr id="preview-hr" class="mt-1 mb-0">
	
						<div class="post-text-container d-flex">
							<div class="post-text-icon"></div>
							<div class="post-text d-flex justify-content-center">
								<div class="previewText textWhite mt-1" style="word-break:break-all;"><span class="textPlaceHolder">내용을 입력해주세요</span></div>
							</div>
						</div>
					</div>
				</div>
				
				<section class="suda-main-contents">
					<div class="fontBMJUA text-center">${cafe.name} <span class="myText">글쓰기</span></div>
					
					<nav class="pt-2 nav-item d-flex" id="postNavLink">
						<a class="nav-link"><span class="select">수다</span></a>
						<a href="/suda/cafe/upload/together/view?cafeId=${cafe.id}" class="nav-link">함께하기</a>
						<button type="button" class="btn btn-sm aTagBtn" id="previewBtn">미리보기</button>
					</nav>
					
					<textarea cols="25" rows="7" class="form-control mt-3 fontBMJUA" placeholder="게시물 내용" id="contentArea"></textarea>
					<div class="textRed mt-1 d-none" id="contentText">내용을 입력해주세요</div>
					<div class="d-flex justify-content-between upload-last">
						<div class="image-file-input d-flex">
							<i id="imageIcon" class="bi bi-image iconGray mt-1"></i>
							<div class="imageText"></div>
							<input id="fileInput" type="file" class="d-none">
							<button type="button" class="btn btn-sm redBtn ml-2 deleteBtn d-none"><i class="bi bi-trash3-fill"></i></button>
						</div>
						
						<div>
							<button type="button" class="btn btn-secondary mt-3 mr-2" id="backButton">취소</button>
							<button type="button" class="btn btn-primary mt-3" id="saveBtn" data-cafeid="${cafeId}">저장</button>
						</div>
					</div>
				</section>
			</section>
		</div>

		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>

	</div>
</body>

<script>

	$(document).ready(function(){
		
		let previewNumber = 0;
		
		$("#backButton").click(function() {
		    window.history.back();
		});
		
		$("#previewBtn").on("click", function(){
			if(previewNumber == 0) {
				$(".preview").removeClass("d-none");
				previewNumber = 1;
			} else {
				$(".preview").addClass("d-none");
				previewNumber = 0;
			}
		});
		
		$(".deleteBtn").on("click", function(){
			$(".deleteBtn").addClass("d-none");
			$("#preview-hr").removeClass("d-none");
			$(".preview-image").addClass("d-none");
			$("#fileInput").val("");
			$(".imageText").empty();
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

			if(content.trim() == "") {
				$("#contentText").removeClass("d-none");
				return;
			}
			
			content = content.replaceAll("\n", "<br>");
			content = content.replaceAll("\u0020", "&nbsp;");
			
			var formData = new FormData();
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
		
		


	});
</script>
</html>
