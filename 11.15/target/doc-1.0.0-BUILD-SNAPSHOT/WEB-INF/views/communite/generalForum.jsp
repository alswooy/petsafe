<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>자유게시판</title>

<!--  <link href="${pageContext.request.contextPath}/resources/css/list.css" rel="stylesheet" type="text/css" />
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function selectedOptionCheck(){
	   $("#type > option[value=${param.type}]").attr("selected", "true");
	}



function moveAction(where){
	
	switch(where){
		case 1:
			location.href = "write";
			break;
	}
		
	
}

$(document).ready(function() {
	
	
	
    $('#new').on('click', function(){
			document.getElementById("new_icon_black").style.display = 'block';
			document.getElementById("new_icon_gray").style.display = 'none';
			document.getElementById("best_icon_black").style.display = 'none';
			document.getElementById("best_icon_gray").style.display = 'block';
    });
    
    $('#best').on('click', function(){
		document.getElementById("new_icon_black").style.display = 'none';
		document.getElementById("new_icon_gray").style.display = 'block';
		document.getElementById("best_icon_black").style.display = 'block';
		document.getElementById("best_icon_gray").style.display = 'none';
    });
    

});


</script>

<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

.page{
	text-decoration: none;
}

.writeBt {

	background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:white;
	text-decoration:none;
	float:right;


}

.writeBt:hover{
	background-color: #FFBB00;
	color:white;
}
.writeBt2 {
	background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:white;
	text-decoration:none;
	float:right;
	margin-right:10px;

}

.writeBt2:hover{
	background-color: #FFBB00;
	color:white;
}

.left-top{
	float:left;
	display:flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

.list {
	background :#EDEDED;
	border : none;
	width : 120px;
	height : 35px;
	font-size:15px;
	border-radius: 30px;
	font-weight: bold ;
	color:black;
	text-decoration:none;

	
	


}

.list_general {

	background : #A6A6A6;
	border : none;
	width : 120px;
	height : 35px;
	font-size:15px;
	border-radius: 30px;
	font-weight: bold ;
	color:black;
	text-decoration:none;



}

.list_gallery {

	background :#EDEDED;
	border : none;
	width : 120px;
	height : 35px;
	font-size:15px;
	border-radius: 30px;
	font-weight: bold ;
	color:black;
	text-decoration:none;
	


}

.title{
	font-size :20px;
	color:black;
	font-weight: bold ;
	margin-top:8px;
	text-decoration : none;
	text-decoration-line: none;
}

.subtitle{
	font-size:15px;
	color: #A6A6A6;
	list-style: none;
	display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.sub-left{
	display: flex;
    flex-direction: row;
}

.count {
	float:right;
	display:flex;
	display:row;
}

#count_left{
	padding: 0 8px 0 0;
	width:50px;
	display: flex;
    justify-content: flex-start;
}

#count_right{
	width:50px;
    display: flex;
    justify-content: flex-start;
}

.article-list__cell-title{
border-top:1px solid #dddddd;
margin:10px 0 0 0;
}

.pagenumber{
	float: right;
    position: relative;
    left: -50%;
	margin-bottom:100px;

}

#row-svg{
	margin:0 4px 0 4px;
}

svg line{
	stroke: #dddddd;
}

.list-content{
padding: 10px;
}

#array{
	list-decoration:none;
}

.select-btn{
	list-style: none;
    display: flex;
    flex-direction: row;
    justify-content: center;
    flex-wrap: nowrap;
    align-items: center;
}


.select-btn li{
	position:relative;
	margin:0;
	padding:0;
	text-align:center;
	font-size:15px;
}

.select-btn li a{
	display:block;
	height:28px;
	margin:0;
	color:#7e7e7e;
	font-weight:bold;
	text-decoration:none;
}

.showSelect{
    display: flex;
    flex-direction: column;
    align-content: flex-start;
}

input[type='radio'] + label{
	width: 64px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    color:#7e7e7e;
}

input[type='radio']:checked + label{
	color:black;
	font-weight: bold;
}

.wrapper{
	display:flex;
    flex-direction: column;
}

ul{
padding-inline-start: 0;
}

.listgo{
    margin-bottom: -3%;
    background: white;
    border: 2px solid #e6e6e6;
	width: 94px;
    height: 42px;
	font-size:15px;
	font-weight: bold ;
	color:black;
	text-decoration:none;
}

.listgo:hover{
	border: 2px solid #FFDF80;
	color:black;
}

.array_border{
	width: 160px;
    border: 2px solid #e6e6e6;
    height: 42px;
    display: flex;
    padding: 0 8px 0 8px;
    justify-content: space-around;
}

</style>

</head>

<body onload="selectedOptionCheck()">
	<div class="wrapper" >
	
	<div class="left-top">
					<ul class="select-btn">
					<li class="showSelect" style="margin-right:10px;">
						<input type="radio" id="new" name="select" style="display:none;" checked>
						<label for="new"><img src="resources/img/checkIcon.svg" width="14px" style="padding-right:6px;" id="new_icon_black"><img src="resources/img/check_gray.svg" width="14px" style="padding-right:6px;display:none;" id="new_icon_gray">최신순</label>
					</li>
					
					<li class="showSelect">
						<input type="radio" id="best" name="select" style="display:none;">
						<label for="best"><img src="resources/img/checkIcon.svg" width="14px" style="padding-right:6px;display:none;" id="best_icon_black"><img src="resources/img/check_gray.svg" width="14px" style="padding-right:6px;" id="best_icon_gray">인기순</label>
					</li>
				</ul>

			
			<div>
			<%if(session.getAttribute("userId") != null){  %>
				<input type="button" value="글쓰기" class="listgo" onclick="moveAction(1)"/>
			<%} %>
			</div>

	</div>
	
	<div>
		<c:forEach var="board" items="${boardList}">
					
			<div class="article-list__cell-title" >
			
				<div class="list-content">
				 	<a href="view?bno=${board.bno}" class="title" >${board.title}</a>
			
					<div class="subtitle" >
						<div class="sub-left">
							<div>${board.writerNickname}</div>
							
							<svg width="10" height="24" id="row-svg">
								<line x1="4" y1="4" x2="4" y2="20"/>
							</svg>
							
							<div>${board.regDate}</div>
						</div>
			
						<div class="count">
						
							<div id="count_left">
								<img src="resources/img/heartIcon.svg" width="15px" style="padding-right:6px;"> : ${board.recommendcnt}
							</div>
							
							<div id="count_right">
								<img src="resources/img/talkIcon.svg" width="13px" style="padding-right:6px;"> : ${board.replycnt}
							</div>
							
						</div>
					</div>
				</div>
			
			</div>
					
		
		
		
		 </c:forEach>
		 
		<div class = "pagenumber">
			${pageHttp}
		</div>
		 
	</div>



</div>
</body>

</html>



        
      