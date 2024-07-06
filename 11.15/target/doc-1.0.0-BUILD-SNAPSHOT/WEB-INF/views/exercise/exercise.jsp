<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>ExercisePage</title>
<link href="${pageContext.request.contextPath}/resources/css/exercise.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.rawgit.com/theus/chart.css/v1.0.0/dist/chart.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	weekLog();
	
    $('#week').on('click', function(){
    	alert("이번주");
    	weekLog();
    });
    
    $('#month').on('click', function(){
    	alert("한달");
    });
    
    
	

});



function weekLog(){
	var currentDay = new Date();  
	var theYear = currentDay.getFullYear();
	var theMonth = currentDay.getMonth();
	var theDate  = currentDay.getDate();
	var theDayOfWeek = currentDay.getDay();
	 
	var thisWeek = [];
	 
	for(var i=0; i<7; i++) {
	  var resultDay = new Date(theYear, theMonth, theDate + (i - theDayOfWeek));
	  var yyyy = resultDay.getFullYear();
	  var mm = Number(resultDay.getMonth()) + 1;
	  var dd = resultDay.getDate();
	 
	  mm = String(mm).length === 1 ? '0' + mm : mm;
	  dd = String(dd).length === 1 ? '0' + dd : dd;
	 
	  thisWeek[i] = mm + '.' + dd;
	}
	
	  var ctx = document.getElementById('myChart').getContext('2d');
      var chart = new Chart(ctx, {
          type: 'bar',
          data: {
              labels: [thisWeek[0], thisWeek[1], thisWeek[2], thisWeek[3], thisWeek[4], thisWeek[5], thisWeek[6]],
              datasets: [{
                  label: '테스트',
                  backgroundColor: [
                      'rgba(255, 99, 132, 0.5)',
                      'rgba(54, 162, 235, 0.5)',
                      'rgba(255, 206, 86, 0.5)',
                      'rgba(75, 192, 192, 0.5)',
                      'rgba(153, 102, 255, 0.5)',
                      'rgba(255, 159, 64, 0.5)',
                      'rgba(207, 47, 116, 1)'],
                  borderColor: ['rgb(255, 99, 132,1.5)',
                      'rgba(54, 162, 235, 1.5)',
                      'rgba(255, 206, 86, 1.5)',
                      'rgba(75, 192, 192, 1.5)',
                      'rgba(153, 102, 255, 1.5)',
                      'rgba(255, 159, 64, 1.5)',
                      'rgba(207, 47, 116, 1)'],
                  data: [1000, 1600, 2700, 3400, 4900, 6000, 8000]
              }]
          },
      });
}

function MonthLog(){
	
}

</script>

</head>
<body>
	<div id="content">
	
		<div class="today-exercise">
			<p>오늘 활동량</p>
			
			<div class="today-detail">
				<div class="detail-text">
					<div class="deco-text">Today</div>
					<div id="today-walk">5,400 걸음</div>
				</div>
				
				<div class="progress">
					<progress value="5400" max="8000"></progress>
				</div>
				
				<div class="exercise-gole">
					목표 : 8,000 
				</div>
			</div>
		</div>
		
		<svg width="10" height="300" id="row-svg">
			<line x1="0" y1="8" x2="0" y2="300"/>
		</svg>
		
		<div class="statistics">
			<ul class="select-btn">
				<li class="showSelect">
					<input type="radio" id="week" name="select" style="display:none;" checked>
					<label for="week">7일</label>
				</li>
				
				<li>
					<svg width="10" height="40" id="row-svg">
						<line x1="5" y1="7" x2="5" y2="37"/>
					</svg>
				</li>
				
				<li class="showSelect">
					<input type="radio" id="month" name="select" style="display:none;">
					<label for="month">30일</label>
				</li>
			</ul>
			
			<div style="width: 100%;">
				<canvas id="myChart" style="display: block;width: 600px;height: 400px;"></canvas>
			</div>
			
		</div>

	</div>

</body>
</html>