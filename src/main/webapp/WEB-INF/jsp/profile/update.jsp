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
<title>프로필 수정</title>
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
			<section class="main-contents">
				<h5 class="pt-5"><b>프로필 수정</b></h5>
				<input type="text" class="form-control mt-3" placeholder="닉네임" id="nickNameInput" value="${user.nickName}">
				<div class="textRed mt-1 d-none" id="nickNameNoneText">닉네임을 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="nickNameCountText">3글자 이상 입력해주세요</div>
				<div class="textRed mt-1 d-none" id="nickNameSpaceText">공백없이 입력해주세요</div>
				<div class="mt-3 pl-2 blackLineText blackLine pt-1 pb-1">시청제한</div>
				
				<div class="d-flex justify-content-between contents-iconsize mt-2 ml-2">
					<div class="mt-2">
						<div class="textLight">콘텐츠 등급</div>
						<div class="textGray mt-1">19+ 등급 콘텐츠까지 시청할 수 있습니다.</div>
					</div>
					<!-- Button trigger modal -->
					<i class="bi bi-chevron-right iconGray mt-2" data-toggle="modal" data-target="#contentsBtn"></i>
					<!-- Button trigger modal -->
				</div>
				
				<div class="d-flex justify-content-between contents-iconsize mt-2 ml-2">
					<div class="mt-2">
						<div class="textLight">프로필 PIN</div>
						<div class="textGray mt-1">내 프로필을 아무나 이용하지 못하도록 4자리</div>
						<div class="textGray">PIN을 설정하세요.</div>
					</div>
					<div class="contents-iconsize mt-2">
						<c:choose>
							<c:when test="${not empty user.pin}">
								<button type="button" class="btn btn-sm mr-4 redBtn deleteBtn"><i class="bi bi-trash3-fill"></i></button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-sm mr-4 redBtn deleteBtn d-none"><i class="bi bi-trash3-fill"></i></button>
							</c:otherwise>
						</c:choose>
						<!-- Button trigger modal -->
						<i class="bi bi-chevron-right iconGray" data-toggle="modal" data-target="#pinBtn"></i>				
						<!-- Button trigger modal -->

					</div>
					
				</div>
				<div class="d-flex justify-content-end mt-4">
					<button type="button" class="btn btn-primary saveBtn">저장</button>
				</div>

				
			</section>
		
		</div>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
</body>

<!-- Modal -->
<div class="modal fade" id="pinBtn" >
  <div class="modal-dialog modal-dialog-centered pin-content-modal">
    <div class="modal-content ">
      <div class="modal-body">
      	<div class="pin-contents">
			<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin1">
			<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin2">
			<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin3">
			<input type="password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="pin pinBox text-center mr-2" maxlength="1" id="pin4">
		</div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<!-- Modal -->
<div class="modal fade" id="contentsBtn" >
  <div class="modal-dialog modal-dialog-centered contents-modal">
    <div class="modal-content ">
      <div class="modal-body">
      	<div class="modal-body">
		  <div class="textWhiteBig text-center">콘텐츠 등급</div>
		 
		 	<div class="d-flex mt-3">
		 		<input type="radio" name="degreeRadio" value="0">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">ALL</div>
		 			<div class="testGraySmall">등급이 ALL 인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		 	
	 		<div class="d-flex mt-3">
		 		<input type="radio" name="degreeRadio" value="7">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">7+</div>
		 			<div class="testGraySmall">등급이 7+ 이하인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		  	
		  	<div class="d-flex mt-3">
		 		<input type="radio" name="degreeRadio" value="12">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">12+</div>
		 			<div class="testGraySmall">등급이 12+ 이하인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		 	
		 	<div class="d-flex mt-3">
		 		<input type="radio" name="degreeRadio" value="15">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">15+</div>
		 			<div class="testGraySmall">등급이 15+ 이하인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		 	
		 	<div class="d-flex mt-3">
		 		<input type="radio" name="degreeRadio" value="18">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">18+</div>
		 			<div class="testGraySmall">등급이 18+ 이하인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		   
		   <div class="d-flex mt-3"> 
		 		<input type="radio" name="degreeRadio" value="19">
		 		<div class="ml-4 contentBox-modal">
		 			<div class="textWhiteSmall">19+</div>
		 			<div class="testGraySmall">등급이 19+ 이하인 콘텐츠가 표시됩니다</div>
		 			<hr class="m-0">
		 		</div>
		 	</div>
		 	
		 	<div class="d-flex justify-content-end mt-4">
		 		<button type="button" class="btn btn-primary" id="catalogueModalBtn" data-dismiss="modal">저장</button>
		 	</div>
		</div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->

<script>

	$(document).ready(function(){
			
		let pin = 0;
		
		$(".deleteBtn").on("click", function(){
			$.ajax({
				type:"get"
				, url:"/user/pin/delete"
				, success:function(data){

					if(data.result == "success") {
						$(".deleteBtn").addClass("d-none");
						
						pin = 0;
					} else {
						console.log("핀 삭제 실패");
					}	
				}
				, error:function(){
					console.log("핀 삭제 에러");
				}
				
			});
		});
		
		let catalogue = ${user.catalogue};
			
		$(".pin").on("keydown", function(event) {
			
			$("#pinText").addClass("d-none");
			
			var keyCode = event.keyCode;
				
		    if(this.value.length == 1 && keyCode != 8) {
		    	$(this).next().focus();   
		    } else if(this.value.length != 1 && keyCode == 8) {
		    	$(this).prev().focus();
		    }
   
		});
		
		$("#pin4").on("input", function(){
			
			let pin1 = $("#pin1").val();
			let pin2 = $("#pin2").val();
			let pin3 = $("#pin3").val();
			let pin4 = $("#pin4").val();
			
			pin = pin1 + pin2 + pin3 + pin4;
			$(".deleteBtn").removeClass("d-none");
			$("#pinBtn").modal('hide');
			
		});
		
		$(".saveBtn").on("click",function(){
			
			let nickName = $("#nickNameInput").val();
			
			if(nickName == "") {
				$("#nickNameNoneText").removeClass("d-none");
				return;
			} else if(nickName.length < 3) {
				$("#nickNameCountText").removeClass("d-none");
				return;
			} else if(nickName.search(/\s/) != -1) {
				$("#nickNameSpaceText").removeClass("d-none");
				return;
			} 
			
			if(pin != 0) {
				$.ajax({
					type:"post"
					, url:"/profile/update"
					, data:{"nickName":nickName
						, "catalogue":catalogue
						, "pin":pin}
					, success:function(data){
						if(data.result == "success") {
							location.href = "/movie/mainpage/view";
						} else {
							console.log("프로필 수정(전체) 실패");
						}	
					}
					, error:function(){
						console.log("프로필 수정(전체) 에러");
					}
					
				});
			} else {
				$.ajax({
					type:"get"
					, url:"/profile/update/notpin"
					, data:{"nickName":nickName
						, "catalogue":catalogue}
					, success:function(data){
						if(data.result == "success") {
							location.href = "/movie/mainpage/view";
						} else {
							console.log("프로필 수정(핀 제외) 실패");
						}	
					}
					, error:function(){
						console.log("프로필 수정(핀 제외) 에러");
					}
					
				});
			}
		});
		
		$("#nickNameInput").on("input", function(){
			$("#nickNameNoneText").addClass("d-none");
			$("#nickNameCountText").addClass("d-none");
			$("#nickNameSpaceText").addClass("d-none");
		});
		
		
		$("#catalogueModalBtn").on("click", function(){
			
			if($('input[name=degreeRadio]').is(":checked")) {
				catalogue = $('input[type="radio"][name="degreeRadio"]:checked').val();
			}
			
		});
		
	});	
	

</script>
</html>
