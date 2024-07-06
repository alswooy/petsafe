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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
$(document).ready(function() {
    
    $('.exercise-gole').on('click', function(){
    	popup();
    });
    
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawWeek);
    
    $('#week').on('click', function(){
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawWeek);
    });
    
    $('#month').on('click', function(){
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawMonth);
    });
    



});

function popup(){
	
	var pop_width = "300";
	var pop_height = "300";
	
	var left_size = Math.ceil((window.screen.width - pop_width) / 2);
	var top_size = Math.ceil((window.screen.height - pop_height) / 2);
	
	
	var url = "<%=request.getContextPath()%>/updateexercise";
	var name = "updateexercise";
	var option= "width=" + pop_width + ", height=" + pop_height + ", left=" + left_size + ", top=" + top_size+"location=no, menubar=no, resizable=no, status=no, toolbar=no";
	window.open(url, name, option);
}


function drawWeek() {
	
	var data = new google.visualization.DataTable();
	data.addColumn('string', '요일');
	data.addColumn('number', '걸음수');
	

	var walkcnt1=${exerciselist.get(0).getWalkcnt()};
	var walkcnt2=${exerciselist.get(1).getWalkcnt()};
	var walkcnt3=${exerciselist.get(2).getWalkcnt()};
	var walkcnt4=${exerciselist.get(3).getWalkcnt()};
	var walkcnt5=${exerciselist.get(4).getWalkcnt()};
	var walkcnt6=${exerciselist.get(5).getWalkcnt()};
	var walkcnt7=${exerciselist.get(6).getWalkcnt()};
	 
	var date1="${exerciselist.get(0).getExdate()}";
	var date2="${exerciselist.get(1).getExdate()}";
	var date3="${exerciselist.get(2).getExdate()}";
	var date4="${exerciselist.get(3).getExdate()}";
	var date5="${exerciselist.get(4).getExdate()}";
	var date6="${exerciselist.get(5).getExdate()}";
	var date7="${exerciselist.get(6).getExdate()}";

	
	data.addRows([
		
		[date1, walkcnt1],
		[date2, walkcnt2],
		[date3, walkcnt3],
		[date4, walkcnt4],
		[date5, walkcnt5],
		[date6, walkcnt6],
		[date7, walkcnt7]
	]);
	
	var options = {
		//가로축
		hAxis: {
			textStyle: {
            },
			viewWindow: {
				min: [30, 100, 0],
				max: [30, 100, 0]
			}
		},
		//세로축
		vAxis: {
			gridlines: { 
				color: '#EEEEEE'
			}
		},//
		series: { 
			0:{
				color: '#FFC98C'
			}
		}
	};
	
	var chart = new google.visualization.ColumnChart(
	document.getElementById('bar-chart'));
	chart.draw(data, options);
	
}

function drawMonth() {

	var data = new google.visualization.DataTable();
	data.addColumn('string', '요일');
	data.addColumn('number', '걸음수');

	var walkcnt1=${monthlist.get(0).getWalkcnt()};
	var walkcnt2=${monthlist.get(1).getWalkcnt()};
	var walkcnt3=${monthlist.get(2).getWalkcnt()};
	var walkcnt4=${monthlist.get(3).getWalkcnt()};
	var walkcnt5=${monthlist.get(4).getWalkcnt()};
	var walkcnt6=${monthlist.get(5).getWalkcnt()};
	var walkcnt7=${monthlist.get(6).getWalkcnt()};
	var walkcnt8=${monthlist.get(7).getWalkcnt()};
	var walkcnt9=${monthlist.get(8).getWalkcnt()};
	var walkcnt10=${monthlist.get(9).getWalkcnt()};
	var walkcnt11=${monthlist.get(10).getWalkcnt()};
	var walkcnt12=${monthlist.get(11).getWalkcnt()};
	var walkcnt13=${monthlist.get(12).getWalkcnt()};
	var walkcnt14=${monthlist.get(13).getWalkcnt()};
	var walkcnt15=${monthlist.get(14).getWalkcnt()};
	var walkcnt16=${monthlist.get(15).getWalkcnt()};
	var walkcnt17=${monthlist.get(16).getWalkcnt()};
	var walkcnt18=${monthlist.get(17).getWalkcnt()};
	var walkcnt19=${monthlist.get(18).getWalkcnt()};
	var walkcnt20=${monthlist.get(19).getWalkcnt()};
	var walkcnt21=${monthlist.get(20).getWalkcnt()};
	var walkcnt22=${monthlist.get(21).getWalkcnt()};
	var walkcnt23=${monthlist.get(22).getWalkcnt()};
	var walkcnt24=${monthlist.get(23).getWalkcnt()};
	var walkcnt25=${monthlist.get(24).getWalkcnt()};
	var walkcnt26=${monthlist.get(25).getWalkcnt()};
	var walkcnt27=${monthlist.get(26).getWalkcnt()};
	var walkcnt28=${monthlist.get(27).getWalkcnt()};
	var walkcnt29=${monthlist.get(28).getWalkcnt()};
	var walkcnt30=${monthlist.get(29).getWalkcnt()};
	
	var date1="${monthlist.get(0).getExdate()}";
	var date2="${monthlist.get(1).getExdate()}";
	var date3="${monthlist.get(2).getExdate()}";
	var date4="${monthlist.get(3).getExdate()}";
	var date5="${monthlist.get(4).getExdate()}";
	var date6="${monthlist.get(5).getExdate()}";
	var date7="${monthlist.get(6).getExdate()}";
	var date8="${monthlist.get(7).getExdate()}";
	var date9="${monthlist.get(8).getExdate()}";
	var date10="${monthlist.get(9).getExdate()}";
	var date11="${monthlist.get(10).getExdate()}";
	var date12="${monthlist.get(11).getExdate()}";
	var date13="${monthlist.get(12).getExdate()}";
	var date14="${monthlist.get(13).getExdate()}";
	var date15="${monthlist.get(14).getExdate()}";
	var date16="${monthlist.get(15).getExdate()}";
	var date17="${monthlist.get(16).getExdate()}";
	var date18="${monthlist.get(17).getExdate()}";
	var date19="${monthlist.get(18).getExdate()}";
	var date20="${monthlist.get(19).getExdate()}";
	var date21="${monthlist.get(20).getExdate()}";
	var date22="${monthlist.get(21).getExdate()}";
	var date23="${monthlist.get(22).getExdate()}";
	var date24="${monthlist.get(23).getExdate()}";
	var date25="${monthlist.get(24).getExdate()}";
	var date26="${monthlist.get(25).getExdate()}";
	var date27="${monthlist.get(26).getExdate()}";
	var date28="${monthlist.get(27).getExdate()}";
	var date29="${monthlist.get(28).getExdate()}";
	var date30="${monthlist.get(29).getExdate()}";
	

	
	data.addRows([
		[date1, walkcnt1],
		[date2, walkcnt2],
		[date3, walkcnt3],
		[date4, walkcnt4],
		[date5, walkcnt5],
		[date6, walkcnt6],
		[date7, walkcnt7],
		[date8, walkcnt8],
		[date9, walkcnt9],
		[date10, walkcnt10],
		[date11, walkcnt11],
		[date12, walkcnt12],
		[date13, walkcnt13],
		[date14, walkcnt14],
		[date15, walkcnt15],
		[date16, walkcnt16],
		[date17, walkcnt17],
		[date18, walkcnt18],
		[date19, walkcnt19],
		[date20, walkcnt20],
		[date21, walkcnt21],
		[date22, walkcnt22],
		[date23, walkcnt23],
		[date24, walkcnt24],
		[date25, walkcnt25],
		[date26, walkcnt26],
		[date27, walkcnt27],
		[date28, walkcnt28],
		[date29, walkcnt29],
		[date30, walkcnt30]
	]);
	
	var options = {
			//가로축
			hAxis: {
				textStyle: {
	            },
				viewWindow: {
					min: [30, 100, 0],
					max: [30, 100, 0]
				}
			},
			//세로축
			vAxis: {
				gridlines: { 
					color: '#EEEEEE'
				}
			},//
			series: { 
				0:{
					color: '#FFC98C'
				}
			}
		};
		
	var chart = new google.visualization.ColumnChart(
	document.getElementById('bar-chart'));
	chart.draw(data, options);
	
}




</script>




</head>
<body>
	<div id="content">
	<form id="exercise" name="exercise" method="GET"  Action="exercise" style="display: flex;">
		<div class="today-exercise" name="exercise">
			<p>오늘 활동량</p>
			
			<div class="today-detail">
				<div class="detail-text">
					<div class="deco-text">Today</div>
					<div id="today-walk">${exercise.walkcnt}걸음</div>
				</div>
				
				<div class="progress">
					<progress value="${exercise.walkcnt}" max="${user.walkobj}"></progress>
				</div>
				
				<div class="exercise-gole" onclick="popup()" >
					목표 : ${user.walkobj}
				</div>
			</div>
		</div>
		</form>
		
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

			<!--chart start-->
			<div id="bar-chart"></div>
		</div>

	</div>

</body>
</html>