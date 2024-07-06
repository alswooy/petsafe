<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ExercisePage</title>
<link href="${pageContext.request.contextPath}/resources/css/exercise.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div id="content">
		<div class="today-exercise">
			<p>오늘 활동량</p>
			
			<div class="today-detail">
				<div class="detail-text">
					<div class="deco-text">Today</div>
					<div id="today-walk">5,400걸음</div>
				</div>
				
				<div class="progress">
					<progress value="5400" max="8000"></progress>
				</div>
				
				<div class="exercise-gole">
					목표 : 8,000 
				</div>
				
			</div>
			
		</div>
		
		<svg width="10" height="466" id="row-svg">
			<line x1="0" y1="8" x2="0" y2="390"/>
		</svg>
	</div>

</body>
</html>