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
    display: flex;
    margin:10px 0 40px 0; 
    border-radius: 12px;
    border: 1px solid #babbb8;
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


#top-title{
	display:flex;
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


#box1{
	font-size:21px;
	font-weight: bold ;
	margin-right:10px;

}
	

	
#row-svg{
margin: 0 4px 0 4px;
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
<body>



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


	<div id ="top-title" >
		<div id="box1" style='color:#4876ef'>NEW</div>
		<div id="box2">최신글</div>
	</div>

	<div class="write">
			<c:forEach var="newboard" items="${newboardList}" begin="0" end="4" step="1">
					
			<div class="article-list__cell-title" >
			
				<div class="list-content">
				 	<a href="view?bno=${newboard.bno}" class="title" >${newboard.title}</a>
			
					<div class="subtitle" >
						<div class="sub-left">
							<div>${newboard.writerNickname}</div>
							
							<svg width="10" height="24" id="row-svg">
								<line x1="4" y1="4" x2="4" y2="20"/>
							</svg>
							
							<div>${newboard.regDate}</div>
						</div>
			
						<div class="count">
						
							<div id="count_left">
								<img src="resources/img/heartIcon.svg" width="15px" style="padding-right:6px;"> : ${newboard.recommendcnt}
							</div>
							
							<div id="count_right">
								<img src="resources/img/talkIcon.svg" width="13px" style="padding-right:6px;"> : ${newboard.replycnt}
							</div>
							
						</div>
					</div>
				</div>
			
			</div>
		 </c:forEach>
	</div>
	
</body>
</html>