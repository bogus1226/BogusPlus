<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="/static/css/calendar.css" type="text/css">
	<!-- fullcalendar -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>
	<!-- fullcalendar 언어 CDN -->
  	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  	<!-- moment -->
	<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
<title>달력</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />

</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/main-header.jsp"/>
			<div class="calendar-container calendar mb-5">
				<div class="text-center textWhite mt-3">달력</div>
				<div id="calendar-box">
				    <div class="textWhite" id="calendar"></div>
				</div>
			</div>
			
			
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
</body>

<!-- Modal -->
<div class="modal fade" id="movieModal" >
  	<div class="modal-dialog modal-dialog-centered">
    	<div class="modal-content">
      		<div class="modal-body d-flex justify-content-between">
      			<div>
			
				</div>	
      		</div>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
      		</div>
    	</div>
  	</div>
</div> 
<!-- Modal -->

<script>

	$(document).ready(function(){
		
		
		$(".calendarMovieIcon").on("click", function(){
			alert();
		});
	
		// calendar element 취득
	    var calendarEl = document.getElementById('calendar');
		
		$.ajax({
			type:"get"
			, url:"/profile/movieInfoList"
			, success:function(data){
				
				let events = [];
				
				let date = "";
				for (let i = 0; i < data.recordList.length; i++) {
					if(data.recordList[i].createdAt != date) {
						let event = {
					        title: '경기도 성남시 수정구 수정로',
					        start: data.recordList[i].createdAt,
					        dateString:data.recordList[i].createdAt,
					    };
					    events.push(event);
					    
					    date = data.recordList[i].createdAt;
					} else {
						continue;
					}  
				}
				
			    // full-calendar 생성하기
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			    	height: '800px', // calendar 높이 설정
			        expandRows: true, // 화면에 맞게 높이 재설정
			        // 해더에 표시할 툴바
			        headerToolbar: {
			          left: '',
			          center: 'title',
			          right: 'prev,next today',
			         
			        },
			        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			        locale: 'ko', // 한국어 설정
			        events: events,
			        dateClick: handleDateClick,
			        eventContent: function(eventInfo) {
			        	
			        	let title = eventInfo.event.title.substring(0,11);
			        	let place = title;
			        	
			        	let date = moment(eventInfo.event.start).format('YYYY-MM-DD');
			        	
			        	return {
			        		html: '<div class="d-flex ml-1">' 
			        					+ '<i class="bi bi-geo-alt calendarPlaceIcon"></i>' 
			        					+ '<div class="ml-2 calendarMovieListPlace calendarMovieListText">' + place + '</div>' 
			        			+ '</div>'
			        			+ '<div class="d-flex ml-1">'
			        					+ '<i class="bi bi-play-btn-fill calendarMovieIcon" data-toggle="modal" data-target="#movieModal" data-date="'+ date +'"></i>'
			        					+ '<div class="ml-2 calendarMovieVieList calendarMovieListText">영화 시청 목록</div>' 
			        			+ '</div>'

			        	}; 
			       	},
			        
			  	});
			    
			   
			    
			 	// 클릭 이벤트 핸들러 함수
			    function handleDateClick(info) {
			      var date = info.date; // 클릭한 날짜 취득
			      calendar.gotoDate(date); // 해당 날짜로 캘린더 이동
			    }

			    // 캘린더 랜더링
			    calendar.render();
				
			}
			, error:function(){
				console.log("영화리스트 가져오기 에러");
			}
			
		});	
		
	
	});
</script>
</html>
