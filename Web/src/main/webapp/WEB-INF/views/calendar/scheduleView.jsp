<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>schedule View</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.js">

</script>
<script type="text/javascript">

$(document).ready(function() {

    $('#submit-btn').on('click', function(){
    	setTimeout(function() {
    		opener.parent.location.reload("http://localhost:8080/07.06/calendar");
         }, 5);
    	
    	setTimeout(function() {
    		window.open("about:blank", "_self").close();
         }, 10);
    });
	
});

function calendarDelete(cno) {
    if (confirm("이 일정을 삭제하시겠습니까?")) {
       location.href = "deleteCalendar?cno=" + cno ;
	   	setTimeout(function() {
			opener.parent.location.reload("http://localhost:8080/07.06/calendar");
	     }, 5);
		
		setTimeout(function() {
			window.open("about:blank", "_self").close();
	     }, 10);
       
    }
 }

</script>
<script>
    opener.parent.location="<%=request.getContextPath()%>/calendar";
</script>

</head>
<body>

<div id="schedule-addForm">

<!-- 	<div class="exit-button"> -->
<!-- 		<button id="exit" class="btn-close" type="button"/> -->
<!-- 			<img src="resources/img/delIcon.svg" > -->
<!-- 		</button> -->
<!-- 	</div> -->
	
	<form modelAttribute="CalendarVO" action="updateSchedule"  name="scheduleView" method="post" onsubmit="return writeFormCheck()" enctype ="multipart/form-data">

		<input type="hidden" name="cno" value="${calendar.cno}"/>
	

		<p align="left"><span class="error"><form:errors path="alarmTitle" /></span></p>
		<div class="titleForm" style="align-items: center;">
			<div class="titleForm-left"><input id='ctitle' name='ctitle' type="text" value="${calendar.ctitle}" /> </div>
			<div class="titleForm-right"><input type="color" id="colorPick"/></div>
		</div>

		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
		<div class="dateForm" style="display: flex;align-items: center;">
			<img src="resources/img/calendarIcon.svg" style="margin:0 2% 0 0;"/>
			<input id='regDate' name='regDate' type='date' value='${calendar.regDate}' size='100%' style="border:0 solid black;" />
		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="dateForm" style="display: flex;align-items: center;">
		<img src="resources/img/calendarIcon.svg" style="margin:0 2% 0 0;"/>
		<input id='regDate' name='regDate' type='time' value='${calendar.ctime}'  size='100%' style="border:0 solid black;" />
	
		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		
		<div class="memoForm" >
			<div class="memoForm-left"><img src="resources/img/memoIcon.svg"/></div>
			<div class="memoForm-right"><textarea id="cmemo" name="cmemo" type="text" value="${calendar.cmemo}" placeholder="메모"></textarea></div>
		</div>
		

		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
	  	<div class="text-button">
	  		
	  		<button type="button" onclick="calendarDelete(${calendar.cno})" class="reset-btn"> 삭제</button>
			
			<svg width="10" height="30">
				<line x1="0" y1="8" x2="0" y2="30"/>
			</svg>
			
			<button type="submit" id="submit-btn">수정</button>
			
	  	</div>

</form>

</div>
</body>
</html>