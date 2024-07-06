<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>schedule Add Form</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
    $('.btn-close').on('click', function(){
    	window.close();
    });
    
    $('.reset-btn').on('click', function(){
    	
    });
	
});

</script>

</head>
<body>

<div id="schedule-addForm">

	<div class="exit-button">
		<button id="exit" class="btn-close" type="button"/>
			<img src="resources/img/delIcon.svg" >
		</button>
	</div>


	<form:form modelAttribute="scheduleVO" name="schedule-addForm" method="post" action="scheduleAdd">

		<p align="left"><span class="error"><form:errors path="alarmTitle" /></span></p>
		<div class="titleForm">
			<div class="titleForm-left"><input name='alarmTitle' type="text" placeholder="알람 제목" required="true"/> </div>
			<div class="titleForm-right"><input type="color" id="colorPick"/></div>
		</div>

		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
		<div class="dateForm">
			<img src="resources/img/calendarIcon.svg" style="margin:0 2% 0 0;"/>
			<input id='date' name='date' type='datetime-local' value="2022-07-20" size='100%' required="ture" style="border:0 solid black;" />
		</div>
		
		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="dayRepeat-Form">
			<div class="dayselect">
				<input type="checkbox" id="mon" style="display:none;">
				<label for="mon">월</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="tue" style="display:none;">
				<label for="tue">화</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="wed" style="display:none;">
				<label for="wed">수</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="thu" style="display:none;">
				<label for="thu">목</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="fri" style="display:none;">
				<label for="fri">금</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="sat" style="display:none;">
				<label for="sat">토</label>
			</div>
			
			<div class="dayselect">
				<input type="checkbox" id="sun" style="display:none;">
				<label for="sun">일</label>
			</div>

		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin:2% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="memoForm">
			<div class="memoForm-left"><img src="resources/img/memoIcon.svg"/></div>
			<div class="memoForm-right"><textarea id="memo" name="memo"placeholder="메모"></textarea></div>
		</div>

		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
	  	<div class="text-button">
  			<button type="reset" class="reset-btn">취소</button>
			
			<svg width="10" height="30">
				<line x1="0" y1="8" x2="0" y2="30"/>
			</svg>
			
			<button type="submit" class=submit-btn">저장</button>
	  	</div>


	</form:form>
</div>
</body>
</html>