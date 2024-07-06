<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<!DOCTYPE html >
<html class="calendar-html">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>CalendarPage</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
    calendarInit();
    
    $('.add-schedule').on('click', function(){
    	popup();
    });

});

function calendarInit() {

    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
   
    // 달력에서 표기하는 날짜 객체
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();

        // 다음달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));

        // 렌더링 html 요소 생성
        calendar = document.querySelector('.dates')
        calendar.innerHTML = '';
        
        // 지난달
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>'
        }
        // 이번달
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day current">' + i + '</div>'
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
            calendar.innerHTML = calendar.innerHTML + '<div class="day next disable">' + i + '</div>'
        }

        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) {
            todayDate = today.getDate();
            var currentMonthDate = document.querySelectorAll('.dates .current');
            currentMonthDate[todayDate -1].classList.add('today');
        }
    }

    // 이전달로 이동
    $('.prev-month').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.next-month').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth); 
    });
}
 
function popup(){
	
	var pop_width = "400";
	var pop_height = "530";
	
	var left_size = Math.ceil((window.screen.width - pop_width) / 2);
	var top_size = Math.ceil((window.screen.height - pop_height) / 2);
	
	
	var url = "<%=request.getContextPath()%>/scheduleAdd";
	var name = "scheduleForm";
	var option= "width=" + pop_width + ", height=" + pop_height + ", left=" + left_size + ", top=" + top_size;
	window.open(url, name, option);
}


</script>

</head>
<body>
	<div id="content">
	
		<div class="calendar">
			<div class="cal_nav">
				<a href="javascript:;" class="prev-month">prev</a>
				<div class="year-month"></div>
				<a href="javascript:;" class="next-month">next</a>
			</div>
			
			<div class="cal_wrap">
				<div class="days">
					<div class="day">MON</div>
					<div class="day">TUE</div>
					<div class="day">WED</div>
					<div class="day">THU</div>
					<div class="day">FRI</div>
					<div class="day">SAT</div>
					<div class="day">SUN</div>
				</div>
				<div class="dates"></div>
			</div>
		</div>
		
		<svg width="10" height="466" id="row-svg">
			<line x1="0" y1="8" x2="0" y2="390"/>
		</svg>
		
		<div class="date_schedule">
			<c:forEach var="calendar" items="${calendarList}">
		
				<div class="schedule_list">
					<div class="scheduleDate" style="margin:0 0 1% 0;">${calendar.regDate}</div>
						
					<div class="scheduleDetail">
						<div class="circle" style="background:'${calendar.rgb}'"></div>
						<div class="schedule_content" style="font-weight:bold;">${calendar.time}</div>
						<div class="schedule_content">${calendar.ctitle}</div>
					</div>
					
					<div class="memo">${calendar.cmemo}</div>
				</div>
			</c:forEach>
			
			<svg width="300" height="10" id="column-svg" style="margin:2% 0 2% 0;">
				<line x1="0" y1="0" x2="300" y2="0"/>
			</svg>
	
			<button class="add-schedule">
				<img src="resources/img/plusIcon.svg"> 일정 추가하기
			</button>
		</div>

	</div>
		


		

</body>
</html>
