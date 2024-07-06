<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header2.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>MainPage</title>
<!-- <link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" type="text/css" />  -->


<style>


/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

html{
	font-family: 'Noto Sans KR', 'Nanum Gothic', sans-serif;
	margin:0 300px 0 300px;
}

.slider{
	margin-top:-300px;
    width: 100%;
    height: 350px;
    position: relative;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}
.slider input[type=radio]{
    display: none;
  
 
}



ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;
   
    
    
}
ul.imgs li{
    position: absolute;
    left: 640px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */

    padding: 0;
    margin: 0;
     
}

.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 10px;
    z-index: 2;
  
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 10px;
    height: 10px;
    cursor: pointer;
}



/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color:  #FFE699;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color:  #FFE699;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color:  #FFE699;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color:  #FFE699;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;
}



.exercise {
    position: relative;
    padding-left: 20px;
    background: #ffffff;
    margin-top: 30px;
    width: 590px;
    height: 400px;
    display: flex;
    flex-direction: row;
    cursor: pointer;
    border-radius: 12px;
    border-color: #babbb8;
    border-style: solid;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    border-right-width: 1px;
    float: left;
    flex-wrap: wrap;
    align-content: flex-start;
}

.calendar {
	 position: relative;
    padding-left: 26px;
    background: #ffffff;
    margin-top: 30px;
   
    margin-bottom:50px;
    width: 590px;
    height: 400px;
    display: flex;
    flex-direction: row;
    cursor: pointer;
    border-radius: 12px;
    border-color: #babbb8;
    border-style: solid;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    border-right-width: 1px;
    float: left;
    flex-wrap: wrap;
    align-content: flex-start;
}

.write {
	 position: relative;
   
    background: #ffffff;
    width:100%;
	height:400px;
    display: flex;
    flex-direction: row;
    cursor: pointer;
    border-radius: 12px;
    border-color: #babbb8;
    border-style: solid;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    border-right-width: 1px;
    float: left;
    flex-wrap: wrap;
    align-content: flex-start;
    margin-bottom: 5%;
}




#box{
	font-size:25px;
	font-weight: bold ;
	text-align: left;
	height:20px;
	margin-top:10px;
	
	display:flex;

	

}


#box3{
	font-size:21px;
	font-weight: bold ;
	text-align: left;
	height:20px;
	margin-top:1%;
	
	display:flex;

	

}
#hot{
	margin-left:30px;
	
	display:flex;
	width:40px;
	margin-top:11px;
	margin-right:15px;
	font-size:23px;
	font-weight: bold ;
	color:#fc9a2a;
	

}

#back{
	
	width:45px;
	height:45px;
	display:flex;
	margin-top:7px;



}




#row-svg{
    padding: 0% 0% 0% 0%;
    margin-top:10px;
   
    
}

#row-svg line{
   stroke: #babbb8;
}


.subtitle{
	list-style-type: none;
	float:left;
	text-align:left;
	color:grey;
	font-size:15px;
	width:1180px;
	margin-bottom:20px;
	


}
.hover-underline{
	font-size:18px;
	color : black;
  	text-decoration: none;
  	margin-left:20px;
  	
  	
}
.count{
	float:right;
	display:flex;
}

.article-list{
border-top:1px solid #babbb8;
margin-right:10px;
margin-top:10px;
margin-bottom:10px;
width:100%
}

.title-list{
padding-left:20px;
width:97%;
}

.subtitle{
width:97%;
}

.exca{
width:100%;
display:flex;
justify-content: space-between;
}



.today-exercise
{
	margin: auto;
	margin-top:13%;
}


.detail-text{
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
	font-size:20px;
}

.deco-text{
	font-size:18px;
	color:#7E7E7E;
	margin:0 30% 0 0;
}

.today-walk{
	font-weight:bold;
}

.exercise-gole{
	display: flex;
	flex-direction: row-reverse;
	font-size:18px;
	color:#7E7E7E;
}

progress{
	width:360px;
	height:55px;
	appearance: none;
}

progress::-webkit-progress-bar{
    background:#F2F2F2;
    border-radius:50px;
}
progress::-webkit-progress-value {
    border-radius:50px;
    background: #ffd984;

}

.schedule_list{
	display:flex;
	flex-direction:column;
}

.scheduleDate{
	color:#ddd;
	font-size:14px;
}

.scheduleDetail{
	display:flex;
	justify-content:flex-start;
	font-size:18px;
}

#colorPick{
	border: 0 solid;
	background:none;
	width:30px;
}


</style>

</head>
<body>

<div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <ul id="imgholder" class="imgs">
         
        
 
        <li><img src="resources/img/header-first.png" width= '1300px' height=' 350px' ></li>
        <li><img src="resources/img/slide2.jpg" width= '1300px' height=' 350px'></li>
        <li><img src="resources/img/slide2.jpg" width= '1300px' height=' 350px'></li>
        <li><img src="resources/img/slide1.png" width= '1300px' height=' 350px'></li>
 
		

    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
    </div>
 
  	
</div>
<div class="exca">

	<div class="exercise">
	
		<div id="box" >오늘의 활동량 </div>
		<div id="back"><img src="resources/img/backIcon.svg"  width= '40px' style="transform:rotate(180deg)" ></div>
	
		<svg width="580" height="33" id="row-svg">
		      <line x1="1" y1="1" x2="580" y2="1"/>
		</svg>
	
	<div class="today-exercise">
			
			
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
	
	
	</div>
	
	<div class="calendar">
	
		<div id="box">오늘의 일정</div>
		<div id="back"><img src="resources/img/backIcon.svg"  width= '40px' style="transform:rotate(180deg)" ></div>
		
		<svg width="580" height="33" id="row-svg">
			     <line x1="1" y1="1" x2="580" y2="1"/>
		</svg>
	
	
	<div class="select_date">
				
			</div>
			<div class="schedule_list">
					<div class="scheduleDate" style="margin:0 0 1% 0;">7월 20일</div>
					
					<div class="scheduleDetail">
						<input type="color" id="colorPick">
						<div class="scheduleTime" style="margin:0 2% 0 2%;">12:00</div>
						<div class="scheduleTitle">초코 동물 병원 예약</div>
					</div>
					
					<svg width="580" height="33" id="row-svg">
			     <line x1="1" y1="1" x2="580" y2="1"/>
		</svg>
	

			</div>
	
	
	</div>
</div>

<div class="write">

<div id ="hot" >HOT</div> 
	<div id="box3">이번주 인기글 </div>
	<div id="back"><img src="resources/img/backIcon.svg"  width= '40px' style="transform:rotate(180deg)"   ></div>
	
	<svg width="1260" height="33" id="row-svg">
	      <line x1="20" y1="1" x2="1260" y2="1"/>
	</svg>
	
	<div class="title-list" >
			<div class="article-list2" style="margin-right:10px"></div>
				<a href="#" class="hover-underline">오늘 날씨가 좋아서 산책하기 좋더라구요 1</a>
				
				<ul>
				
				<li class="subtitle">홍길동 | 12:12
				
				<div class="count"><img src="resources/img/heartIcon.svg">:${board.recommendcnt}
				💬:${board.replycnt}</div></li></ul>
				
			
				
			</div>
			<br>
			
			<div class="title-list" >
			<div class="article-list" style="margin-right:10px"></div>
				<a href="#" class="hover-underline">오늘 날씨가 좋아서 산책하기 좋더라구요 1</a>
				
				<ul>
				
				<li class="subtitle">홍길동 | 12:12
				
				<div class="count"><img src="resources/img/heartIcon.svg">:${board.recommendcnt}
				💬:${board.replycnt}</div></li></ul>
				
			
				
			</div>
			<br>
			
			
			<div class="title-list" >
			<div class="article-list" style="margin-right:10px"></div>
				<a href="#" class="hover-underline">오늘 날씨가 좋아서 산책하기 좋더라구요 1</a>
				
				<ul>
				
				<li class="subtitle">홍길동 | 12:12
				
				<div class="count"><img src="resources/img/heartIcon.svg">:${board.recommendcnt}
				💬:${board.replycnt}</div></li></ul>
				
			
				
			</div>
			<br>
			
			
			
			

	


</div>

</body>
</html>