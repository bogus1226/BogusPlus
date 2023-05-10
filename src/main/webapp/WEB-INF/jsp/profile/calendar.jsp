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
	<link rel="stylesheet" href="/static/css/calendar.css" type="text/css">
	<!-- fullcalendar -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>
	<!-- fullcalendar 언어 CDN -->
  	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
	
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


<script>

	$(document).ready(function(){
		// calendar element 취득
	      var calendarEl = $('#calendar')[0];
	      // full-calendar 생성하기
	      var calendar = new FullCalendar.Calendar(calendarEl, {
	        height: '700px', // calendar 높이 설정
	        expandRows: true, // 화면에 맞게 높이 재설정
	        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
	        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
	        // 해더에 표시할 툴바
	        headerToolbar: {
	          left: 'prev,next today',
	          center: 'title',
	          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
	         
	        },
	        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	        editable: true, // 수정 가능?
	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
	        locale: 'ko', // 한국어 설정
	        
	        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
	          var title = prompt('Event Title:');
	          if (title) {
	            calendar.addEvent({
	              title: title,
	              start: arg.start,
	              end: arg.end,
	              allDay: arg.allDay
	            })
	          }
	          calendar.unselect()
	        }
	       
	        
	      });
	      // 캘린더 랜더링
	      calendar.render();
		
		
		

	});
</script>
</html>
