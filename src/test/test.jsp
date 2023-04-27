<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div class="sudaPost mt-2 mb-4">
	<div class="post-header d-flex align-items-center justify-content-between">
		<div class="userName ml-3">${postDetail.nickName}</div>
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
	
	<hr class="mt-1 mb-3">
	
</div>


</body>
</html>