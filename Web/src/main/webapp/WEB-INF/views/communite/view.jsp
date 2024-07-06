<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>글보기</title>
 <link href="${pageContext.request.contextPath}/resources/css/view.css" rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.js">

</script>
<script type="text/javascript">

   function errCodeCheck() {
      var errCode = <%=request.getParameter("errCode")%>;
   
      if (errCode != null || errCode != "") {
         switch (errCode) {
         case 1:
            alert("댓글 내용이 없습니다!");
            break;
         case 2:
            alert("이미 추천하셨습니다!");
            break;
         case 3:
            alert("자기 글은 추천할 수 없습니다!");
            break;
         case 4:
            alert("로그인하셔야 추천할 수 있습니다!");
            break;
         case 5:
        	 alert("로그인 후 댓글 작성이 가능합니다!");
        	 break;
         case 6:
        	 alert("추천 기록 없음");
        	 break;
         case 7:
        	 alert("추천 기록 있음");
        	 break;
         }
      }
   }
   function replyDelete(rno, bno) {
      if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
         location.href = "deleteReply?rno=" + rno + "&bno=" + bno;
      }
   }
   function recommandReply(rno, bno) {
      if (confirm("선택하신 댓글을 추천하시겠습니까?")) {
         location.href = "recommandReply?rno=" + rno + "&bno=" + bno;
      }
   }

   function moveAction(where) {
      switch (where) {
      case 1:
         if (confirm("글을 삭제하시겠습니까?")) {
        	 location.href ="delete?bno=${board.bno}";
         }
         break;

      case 2:
         if (confirm("글을 수정하시겠습니까?")) {
            location.href = "modify?bno=${board.bno}";
         }
         break;

      case 3:
         location.href = "list";
         break;

      case 4:
         if (confirm("글을 추천하시겠습니까?")) {
            location.href = "recommend?bno=${board.bno}";
         }
         break;
      }
   }
</script>



<style>
/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

/*수정삭제버튼*/
.writeBt{
	margin-left:1%;
    margin-bottom: 2%;
    
    background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:white;
	text-decoration:none;
}

.writeBt:hover{
	background-color: #FFBB00;
	color:white;
}


/*상단버튼*/

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

.nextview{
    
    background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:white;
	text-decoration:none;
	float: right;
	margin-right:8%;
}


.listgo:hover{
	border: 2px solid #FFDF80;
	color:black;
}


.nextview:hover{
	background-color: #FFBB00;
	color:white;
}




.commentBt{
    
/*     background : #FFE699; */
/* 	border : none; */
/* 	width : 100px; */
/* 	height : 35px; */
/* 	font-size:15px; */
/* 	border-radius: 12px; */
/* 	font-weight: bold ; */
/* 	color:white; */
/* 	text-decoration:none; */
/* 	 display: inline-block; */
	
	text-decoration:none;
	color:black;
	border:none;
	background:none;
	font-size:15px;
	font-family:'Noto Sans KR';
	}

.commentBt:hover{
	font-weight: bold ;
	font-family:'Noto Sans KR';
}


#list-go{
	color:#FFE699;
	}



.date{
	margin-left:81%;
	color:#A6A6A6; 
	
}

.commenttext{
	display:flex;
	flex-direction: column;
    border: 1px solid #A6A6A6;
    border-left: 0;
    border-right: 0;
    border-bottom: 0;
}

#repdel{

	margin-left :30%;
}

.writer{
border-top:1px solid #A6A6A6; 
margin-left: 20px;


}

.nickname1{
	margin-left:30%;
}


.view{
	height:90%;
	border:3px solid #A6A6A6;
	border-left: 0;
    border-right: 0;
    border-bottom: 0;
    margin: 2% 0 0 0;
	top:50px;
	padding: 0 0 2% 0;
	padding-bottom:30px;
}




.commentForm{
    min-height: 60px;
    border:0;
    background: none;
	resize:none;
	padding:2%
}
.etc-btn{
    background: white;
    border: 1px solid #ddd;
    width: 100px;
    height: 35px;
    border-radius: 26px;
    font-weight: bold;
    color: #222;
    text-decoration: none;
    margin-bottom: 10px;
    font-size: 16px;
}

.etc-btn:hover{
	border: 4px solid #FFDF80;
	color: #222;
}

.replyreco{
	margin-left:95%;
	text-decoration:none;
	
	

}




#replywriter{
	margin-left:25%;
}

.btn{
	display:flex;
	justify-content: space-between;
	padding-top:10px;
}

#nickname{
	text-size:14
}


#profile{
	display:flex;
	flex-direction: row;
	justify-content: space-between;
	border: 1px solid #A6A6A6;
	border-top:0;
	border-right:0;
	border-left:0;
    padding-bottom: 20px;
}

#profile-left{
	display:flex;
	align-items:center;
}

#profile-contet{
	display:flex;
    flex-direction: column;
}

.count {
	float:right;
	display:flex;
	display:row;
}

#count_left{
	width:50px;
	display: flex;
    justify-content: flex-start;
    align-items: center;
    
}

#count_right{
	width:50px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

#row-svg{
 	margin: 4% 4% 0 4%;
}

svg line{
	stroke: #dddddd;
}

#file_name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  width:200px;
}

.commenttext_in{
	display:flex;
	flex-direction: column;
	width:100%;
}

.commenttext-top{
	display:flex;
	justify-content: space-between;
	width:100%;
	align-items: center;
}

.reply_content{
	display:flex;
	flex-direction: column;
	margin:20px;
	border:1px solid #A6A6A6;
	border-radius:12px;
}

.reply-button{
    background: white;
    border: 1px solid #e6e6e6;
	min-width: 50px;
    min-height: 20px;
	font-size:14px;
	color:black;
	text-decoration:none;
	padding: 4px 0 4px 0;
	text-align: center;
}

}

</style>


</head>
<body onload="errCodeCheck()">
	<div class="btn">
		<div><button class="listgo" onclick="location.href='<%=request.getContextPath()%>/generalForum'">목록</button></div>
		
		<div>
			<c:choose>
				<c:when test="${board.userId == userId}">
					<input type="button" value="수정" class="listgo" onclick="moveAction(2)" style="margin-right:10px;"/>
					<input type="button" value="삭제" class="listgo" onclick="moveAction(1)" />
				</c:when>
			</c:choose>
		</div>

	</div>

<div class="view">

	<h2 id="view-title">${board.title}</h2>

		<div id="profile">
			<div id="profile-left">
				<img id="user-img" src="resources/img/d.PNG" width="52px" height="45px"  style="margin-right:10px">
				<span id="nickname" style="font-weight:bold;margin-right:10px;">${board.writerNickname}</span>
				<span id="nickname" style="color:#7e7e7e;">${board.regDate} </span>
			</div>
			
			<div class="count">
				<div style="display:flex;align-items: center;">
					<a href="#"><img src="resources/img/shareIcon.svg" width="30px" height="30px" style="padding-right:10px;"></a>
				</div>
				
				<div style="display:flex;align-items: center;">
					<a href="#"><img src="resources/img/warningIcon.svg" width="30px" height="30px" style="padding-right:10px;"></a>
				</div>

			</div>
		</div>


	<p id="view-content" style="margin-bottom:100px;">
		${board.content}
	</p>

 <%-- 글추천 --%>

	<div class="etc" style="display:flex;justify-content: center;">
		<c:if test="${board.userId != userId}">
			<a href="#" onclick="moveAction(4)">
				<span>
					<button class="etc-btn"><img src="resources/img/heartIcon.svg" style="margin-right:10px;">${board.recommendcnt}</button>
				</span>
			</a>
		</c:if>
	</div>
	
			
		<div style="display:flex;border: 1px solid #A6A6A6;border-left: 0;border-right: 0;padding: 2% 0 2% 0;margin-top:2%;">
			<div style="display: flex;margin-right:10px;align-items: center;font-weight:bold;">첨부파일</div>
			<c:forEach var="file" items="${fileList}">
				<div id="file_name">
					<a href="filedown?fileName=${file.ofilename}" class="fileview" style="text-decoration:none;font-weight:bold;color:black;">
					<font size="2px">${file.ofilename}</font>
					<font size="2px">(${file.filesize} byte)</font><br> </a> 
				</div>
			</c:forEach>
	
			<c:if test="${empty fileList}">
				<div id="file_name">
			       <font color="#A6A6A6" size="2px"> 첨부된 파일이 없습니다. </font>
		       </div>
			</c:if>
		</div>
	
	<div>
	
	 <%-- 댓글 리스트 --%>
	 
	 <div style="color:black;font-weight:bold;font-size:16px;background:#f5f5f5;height:60px;display: flex;align-items: center;padding-left: 10px;"> 댓글<font style="color:red;padding-left:10px;">${board.replycnt}</font></div>
	
	<div class="commenttext">
			<c:forEach var="comment" items="${replyList}">
				<div style="display:flex;flex-direction: column;min-height: 80px;border: 1px solid #A6A6A6;border-left: 0;border-right: 0;border-top:0;padding: 10px;margin-top:10px;">
					<div style="display:flex;">
						<div><img id="user-img" src="resources/img/d.PNG" width="47px" height="40px" ></div>
						
						<div class="commenttext_in">
							<div class="commenttext-top">
								<div style="display:flex;">
									${comment.writerNickname}
									<div style="color:#7e7e7e;margin-left:10px;">${comment.regDate}</div>
								</div>
							</div>
							
							<div class="content" style="color:#555555;font-size:17px;margin-top:10px;margin-bottom:10px;">
								${comment.content}
							</div>
	
						</div>
					</div>
					
					
					<div style="display:flex;flex-direction: row-reverse;margin-bottom:10px;">
						<c:if test="${comment.userId != userId}">
							<a href="#" onclick="recommandReply(${comment.rno}, ${comment.bno})" class="reply-button" style="margin-right:6px;">		  
								<img src="resources/img/heartIcon.svg" style="margin-right:5px;">${comment.recommendcnt}
							</a>
						</c:if>
						
						<div style="display:flex;">
							<c:if test="${comment.userId == userId}">
								<a href="#" onclick="" class="reply-button" style="margin-right:6px;">수정</a>
								<a href="#" onclick="replyDelete(${comment.rno}, ${comment.bno})" class="reply-button">삭제</a>
							</c:if>
						</div>

					</div>
					
				</div>
										


			</c:forEach>
	 </div>
		
	 <%-- 댓글 작성 --%>
	
	<form  modelAttribute="replyVO" action="writeReply" method="post">
		<input type="hidden" id="userId" name="userId" value= "${userId}"  /> 
		<input type="hidden" id="writerNickname" name="writerNickname" value= "${nickname}"  />
		<input type="hidden" id="bno" name="bno" value="${board.bno}" />
		
		<div class="reply_content">
			<textarea id="content" name="content" class="commentForm" placeholder="댓글을 남겨보세요"></textarea>

			<div style="display:flex;justify-content: flex-end;margin:1%;box-sizing: border-box;">
				<input type="submit" value="등록" class="commentBt" />
			</div>
		</div>
	</form>




</div>
	</div>


</body>
</html>