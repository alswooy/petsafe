<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>MainPage</title>
<link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" type="text/css" />  

</head>
<body>

<div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <ul id="imgholder" class="imgs">
        <li><img src="resources/img/header-first.png" width= '1300px' height=' 350px' ></li>
        <li><img src="resources/img/slide2.png" width= '1300px' height=' 350px'></li>
        <li><img src="resources/img/slide3.png" width= '1300px' height=' 350px'></li>
        <li><img src="resources/img/slide4.png" width= '1300px' height=' 350px'></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
    </div>
 
  	
</div>

<div class="exca">
<c:set var="loginResult" value="${loginResult}"/>

	<div class="exercise">
		<div class="loginMask" style="
			<c:if test='${loginResult == 0 }'>display:flex;</c:if>
			<c:if test='${loginResult == 1 }'>display:none;</c:if>			
		">
		
			<div>로그인 후 이용할 수 있습니다.</div>
			
			<a href="<%=request.getContextPath()%>/login">로그인 하기</a>
		</div>
		<div id="box" ><a href="<%=request.getContextPath()%>/exercise" style="text-decoration:none;color:black;">오늘의 활동량   </a></div>
		<div id="back"><img src="resources/img/backIcon.svg"  width= '40px' style="transform:rotate(180deg)" ></div>
	
		<svg width="580" height="33" id="row-svg">
		      <line x1="1" y1="1" x2="580" y2="1"/>
		</svg>
		
			<form id="exercise" name="exercise" method="GET"  Action="exercise" >
			
			<div class="today-exercise" name="exercise">
				<div class="today-detail">
					<div class="detail-text">
						<div class="deco-text">Today</div>
						<div id="today-walk">${exercise.walkcnt}걸음</div>
					</div>
					
					<div class="progress">
						<progress value="${exercise.walkcnt}" max="${user.walkobj}"></progress>
					</div>
					
					<div class="exercise-gole">
						목표 : ${user.walkobj}
					</div>
					
					
	
				</div>
			</div>
		</form>

		
	</div>
	
	<div class="calendar">
	
		<div class="loginMask" style="
			<c:if test='${loginResult == 0 }'>display:flex;</c:if>
			<c:if test='${loginResult == 1 }'>display:none;</c:if>			
		">
			<div>로그인 후 이용할 수 있습니다.</div>
			<a href="<%=request.getContextPath()%>/login">로그인 하기</a>
		</div>
	
		<div id="box"><a href="<%=request.getContextPath()%>/calendar" style="text-decoration:none;color:black;">이번주 일정</a></div>
		<div id="back"><img src="resources/img/backIcon.svg"  width= '40px' style="transform:rotate(180deg)" ></div>
		
		<svg width="580" height="1" id="row-svg">
			     <line x1="1" y1="1" x2="580" y2="1"/>
		</svg>
		<div class="calendar_list">
	
			<c:forEach var="calendar" items="${calendarList}"  begin="0" end="4" step="1">
			<div class="schedule_list">
					<div class="scheduleDate">${calendar.regDate}</div>
					
					<div class="scheduleDetail">
						<div class="circle" style="background:'${calendar.rgb}'"></div>
						<div class="schedule_content" style="font-weight:bold;">${calendar.ctime}</div>
						<div class="schedule_content">${calendar.ctitle}</div>
					</div>
					
			
					
			</div>
			</c:forEach>
		</div>
	</div>

</div>

<!-- 메인 게시판 -->
	<div id ="top-title" >
		<div id="box1" style='color:#ff8484'>HOT</div>
		<div id="box2">이번주 인기글🔥</div>
	</div> 
	
	<div class="write">
			<c:forEach var="bestboard" items="${bestboardList}" begin="0" end="4" step="1">
					
			<div class="article-list__cell-title" >
			
				<div class="list-content">
				 	<a href="view?bno=${bestboard.bno}" class="title" >${bestboard.title}</a>
			
					<div class="subtitle" >
						<div class="sub-left">
							<div>${bestboard.writerNickname}</div>
							
							<svg width="10" height="24" id="row-svg">
								<line x1="4" y1="4" x2="4" y2="20"/>
							</svg>
							
							<div>${bestboard.regDate}</div>
						</div>
			
						<div class="count">
							<div id="count_left">
								<img src="resources/img/heartIcon.svg" width="15px" style="padding-right:6px;"> : ${bestboard.recommendcnt}
							</div>
							
							<div id="count_right">
								<img src="resources/img/talkIcon.svg" width="13px" style="padding-right:6px;"> : ${bestboard.replycnt}
							</div>
						</div>
						
					</div>
				</div>
			
			</div>
		 </c:forEach>
	</div>


</body>
</html>