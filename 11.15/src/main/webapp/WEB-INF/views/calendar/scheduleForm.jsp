<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>schedule Add Form</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function formCheck() {
	if (schedule-addForm.alarmTitle.value.length < 1){
		alert("제목을 입력하세요.");
		schedule-addForm.alarmTitle.focus();
		return false;
	}
		if (schedule-addForm.date.value.length < 1){
		alert("날짜를입력하세요.");
		schedule-addForm.date.focus();
		return false;
	}
	return true;
}




$(document).ready(function() {
	
    $('.btn-close').on('click', function(){
    	window.close();
    });
    
    $('.reset-btn').on('click', function(){
    	window.close();
    	
    });
    
    $('#submit-btn').on('click', function(){
    	setTimeout(function() {
    		opener.parent.location.reload("http://localhost:8080/07.06/calendar");
         }, 5);
    	
    	setTimeout(function() {
    		window.open("about:blank", "_self").close();
         }, 10);
    });
	
});


</script>
<script>
    opener.parent.location=<%=request.getContextPath()%>/calendar";
</script>

</head>
<body>

<div id="schedule-addForm">

<!-- 	<div class="exit-button"> -->
<!-- 		<button id="exit" class="btn-close" type="button"/> -->
<!-- 			<img src="resources/img/delIcon.svg" > -->
<!-- 		</button> -->
<!-- 	</div> -->


	<form name="schedule-addForm"  action="scheduleAdd" method="post" onsubmit="return formCheck()">

		<p align="left"><span class="error"><form:errors path="alarmTitle" /></span></p>
		<div class="titleForm">
			<div class="titleForm-left"><input id = 'ctitle' name='ctitle' type="text" placeholder="일정 제목" required="true"/>
			
			<input type="hidden" id="writer" name="userId" value="${userId}" /></div>
			<div class="titleForm-right"><input type="color" id="colorPick"/></div>
		</div>

		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
		<div class="dateForm">
			<img src="resources/img/calendarIcon.svg" style="margin:0 2% 0 0;"/>
			<input id='regDate' name='regDate' type='date' value='today' size='100%' required="ture" style="border:0 solid black;" />
		</div>
		
		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="dateForm">
		<img src="resources/img/calendarIcon.svg" style="margin:0 2% 0 0;"/>
		<input id='regDate' name='regDate' type='time' value='today' size='100%' required="ture" style="border:0 solid black;" />
		</div>
		
		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="memoForm">
			<div class="memoForm-left"><img src="resources/img/memoIcon.svg"/></div>
			<div class="memoForm-right"><textarea id="cmemo" name="cmemo"placeholder="메모"></textarea></div>
		</div>

		<svg width="400" height="10" id="column-svg">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
	  	<div class="text-button">
	  	
  			
  		
  			<button type="reset" class="reset-btn">취소</button>
			
			<svg width="10" height="30">
				<line x1="0" y1="8" x2="0" y2="30"/>
			</svg>
			
			<button type="submit" id="submit-btn"> 저장 </button>
			
			<!-- <button class="submit-btn" onClick="popupsave();window.close();">저장</button> -->
		
	  	</div>


	</form>
</div>
</body>
</html>