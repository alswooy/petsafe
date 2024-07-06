<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>exercise update</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	

    $('#submit-btn').on('click', function(){
    	setTimeout(function() {
    		opener.parent.location.reload("http://localhost:8080/07.06/exercise");
         }, 5);
    	
    	setTimeout(function() {
    		window.open("about:blank", "_self").close();
         }, 10);
    	
	
    });
	
});

</script>
</head>
<body>
<div class="text" style="margin-bottom: 10px;">운동 목표량 설정</div>
<form id="updateexercise" name="updateexercise" method="POST"  Action="updateexercise"  >
<input id="walkobj" name="walkobj" type="text" value="${user.walkobj}"/>
	<div class="text-button"style="margin-top: 10px;">
  			<button type="reset" onClick="opener.parent.location.reload(); window.close()" class="reset-btn">취소</button>
			
			<svg width="10" height="30">
				<line x1="0" y1="8" x2="0" y2="30"/>
			</svg>
			
			<button name="clickme" type="submit" id="submit-btn" class="submit-btn">저장</button>
	  	</div>
</form>
	  	
</body>
</html>