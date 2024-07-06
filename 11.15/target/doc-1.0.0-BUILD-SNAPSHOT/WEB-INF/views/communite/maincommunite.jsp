<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>MainCommunitePage</title>
<!-- <link href="${pageContext.request.contextPath}/resources/css/maincommunite.css" rel="stylesheet" type="text/css" /> -->

<script>
function selectedOptionCheck(){
	   $("#type > option[value=${param.type}]").attr("selected", "true");
	}
	
</script>

<style>

/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

html{
	font-family: 'Noto Sans KR', 'Nanum Gothic', sans-serif;
	margin:0 300px 0 300px;
}

.write {
	position: relative;
    background: #ffffff;
    width: 100%;
    height: 430px;
    display: flex;
    margin-bottom: 3% padding-top:3%;
    border-radius: 12px;
    border-color: #babbb8;
    border-style: solid;
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    border-right-width: 1px;
    flex-direction: column;
}



#new{
	float:left;
	display:flex;
	width:40px;
	margin-top:11px;
	margin-right:15px;
	font-size:23px;
	font-weight: bold ;
	color:blue;
	float:left;
	

}


#hot{
	float:left;
	display:flex;
	width:40px;
	margin-top:11px;
	margin-right:15px;
	font-size:23px;
	font-weight: bold ;
	color:#fc9a2a;
	float:left;
	

}


#back{
	float:left;
	width:45px;
	height:45px;
	display:flex;
	margin-top:7px;



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

.hover-underline{
	font-size:18px;
	color : black;
  	text-decoration: none;
  	margin-left:20px;
  	
  	
}


li.subtitle{
	list-style-type: none;
	float:left;
	text-align:left;
	color:grey;
	font-size:15px;
	width:97%;
	margin-bottom:20px;
	


}

.hover-underline1{
	font-size:18px;
	color : black;
  	text-decoration: none;
  	margin-left:-20px;
  	
}

.title-list{
	
	width:97%;
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

.count1{
	float:right;
	display:flex;
	margin-left:180px;
}

.article-list{
	border-top:1px solid #babbb8;
	margin : 10px 10px 10px 10px;
	width:100%
}

.article-list__cell-title{
border-top:1px solid #dddddd;
}


	
#box2{
	font-size:21px;
	font-weight: bold ;
	text-align: left;
	height:20px;
	width:700px;
	margin-top:48px;
	margin-left:8px;
	margin-bottom:10px;
	float:left;
	display:flex;
	}
	
#box{
	
	font-size:25px;
	font-weight: bold ;
	text-align: left;
	height:20px;
	margin-top:10px;
	margin-left:10px;
	display:flex;	

}


#box3{
	font-size:21px;
	font-weight: bold ;
	text-align: left;
	height:20px;
	width:700px;
	margin-top: 13px;
	margin-left:8px;
	margin-bottom:35px;
	float:left;
	display:flex;

	

}
	
.exercise {
    position: relative;
 
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
	
#row-svg{
    padding: 0% 0% 0% 0%;
    margin-top:5px;
    
}

#row-svg line{
   stroke: #babbb8;
}

.exca{
width:100%;
display:flex;
justify-content: space-between;
}


.list-content{
padding: 10px;
}

.title{
	font-size :20px;
	color:black;
	font-weight: bold ;
	margin-top:8px;
	text-decoration : none;
	text-decoration-line: none;
}


</style>

</head>
<body onload="selectedOptionCheck()">



<div id ="hot" >HOT</div> 
	<div id="box3">이번주 인기글 </div>
	
	

<div class="write">
	
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
</div>


	<div id ="new" ><br>NEW</div> 
	<div id="box2">최신글 </div>
	
	<br/>



<div class="write">
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

</div>
</body>
</html>