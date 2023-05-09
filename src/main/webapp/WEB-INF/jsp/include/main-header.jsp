<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div class="headerLogo ml-5 pt-2 mr-4">Bogus+</div>
					<nav class="ml-5 pt-2 nav-item d-flex" id="movieHeaderLink">
						<a href="/movie/mainpage/view" class="nav-link"><i class="bi bi-house-fill mr-1"></i>홈</a>
						<button type="button" class="btn movieSearchBtn movieSearchBtnText nav-link"><i class="bi bi-search mr-1"></i>검색</button>
						<a href="#" class="nav-link"><i class="bi bi-caret-right-square-fill mr-1"></i>영화</a>
						<a href="/suda/info/isDuplicate" class="nav-link"><i class="bi bi-chat-fill mr-1"></i>수다 <span class="textYellow">(스포주의)</span></a>
					</nav>
				</div>
				
				<div class="profile mt-2 mr-4" id="profile">
					<hr class="m-0">
					<div class="d-flex align-items-center">
						<div class="nickName mt-2 mr-1 ml-1">${userName}</div>
						<div class="profileCircle mt-1 ml-3"><img src="${userIcon}"></div>
					</div>
					<hr class="m-0 mt-1">
				</div> 
	
				<div class="profile-container d-none" id="profile-container">	 
					<div class="d-flex justify-content-end">
						<div>
							<div class="profile mt-2 mr-4" id="profile">
								<hr class="m-0">
								<div class="d-flex align-items-center">
									<div class="nickName mt-2 mr-1 ml-1">${userName}</div>
									<div class="profileCircle mt-1 ml-3"><img src="${userIcon}"></div>
								</div>
								<hr class="m-0 mt-1">
							</div> 
						</div>
					</div>
					
					<div class="profileText ml-3 mt-5">
						<div>프로필 수정</div>
						<div class="mt-2">달력</div>
						<a class="mt-2" href="/user/signout">로그아웃</a>
					</div>
				</div>
			</div>
		</header>
		
		<script>

	$(document).ready(function(){
		
		let timeoutId;
		
		$(".movieSearchInput").on("input", function(){
			
			let search = $(this).val().replace(/\s+/g, "+");
			
			if(search == "") {
				$(".movie-main-movieInfo").removeClass("d-none");
			} else {
				$(".movie-main-movieInfo").addClass("d-none");
			}
			
			let loadedCount = 0;
			
			clearTimeout(timeoutId);
			
			timeoutId = setTimeout(function() {
			
				$.ajax({
					type:"get"
					, url:"/movie/searchMovie"
					, data:{"search":search}
					, success:function(data){
						if(data.result == "success") {
						
							let list = data.searchMovieList;
							let html = "";
							
							for (var i = 0; i < list.length; i++) {
								
								if(list[i].poster_path != null && !list[i].poster_path.endsWith("null")) {
									
									html += "<a href=\"/movie/detail/recommend/view?movieId=" + list[i].id + "\"><img src=" + list[i].poster_path + "></a>";
									
								}	
							};
							
							$(".searchMovieInfo").html(html);
							
							$(".searchMovieInfo img").on("load", function() {
							    loadedCount++;
							    if (loadedCount == $(".searchMovieInfo img").length) {
							        // 모든이미지 로드후
							        $(".searchMovieInfo").show();
							    }
							});
						
							$(".searchMovieInfo").hide();

						} else {
							console.log("영화검색 실패");
						}	
					}
					, error:function(){
						console.log("영화검색 에러");
					}
					
				});	
			
			}, 300);
		});
		
		var movieSearchCount = 0;
		
		$(".movieSearchBtn").on("click", function(){
			if(movieSearchCount == 0) {
				$("#movieSearchLine").removeClass("d-none");
				movieSearchCount = 1;
			} else {
				$("#movieSearchLine").addClass("d-none");
				movieSearchCount = 0;
			}
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