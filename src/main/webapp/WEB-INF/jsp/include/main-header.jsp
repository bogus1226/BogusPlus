<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<header>
			<div class="d-flex justify-content-between">
				<div class="d-flex">
					<div class="headerLogo ml-5 pt-2 mr-4">Bogus+</div>
					<nav class="ml-5 pt-2 nav-item d-flex" id="movieHeaderLink">
						<a href="#" class="nav-link"><i class="bi bi-house-fill mr-1"></i>홈</a>
						<a href="#" class="nav-link"><i class="bi bi-search mr-1"></i>검색</a>
						<a href="#" class="nav-link"><i class="bi bi-plus-lg mr-1"></i>관심콘텐츠</a>
						<a href="#" class="nav-link"><i class="bi bi-caret-right-square-fill mr-1"></i>영화</a>
						<a href="#" class="nav-link"><i class="bi bi-chat-fill mr-1"></i>수다 <span class="textYellow">(스포주의)</span></a>
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