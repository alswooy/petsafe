<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Update Pet Form</title>
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
    $('.btn-close').on('click', function(){
    	window.close();
    });
    
    $('.reset-btn').on('click', function(){
    	window.close();
    });
    
    $('#submit-btn').on('click', function(){
    	setTimeout(function() {
    		opener.parent.location.reload("http://localhost:8080/07.06/mypage");
         }, 6);
    	
    	setTimeout(function() {
    		window.open("about:blank", "_self").close();
         }, 10);
    });
	
});

</script>
<script>
	opener.parent.location="<%=request.getContextPath()%>/mypage";
</script>

<style>
.toggle3{
	width: 180px;
    display: flex;
    justify-content: flex-start;
}

.toggle3 input[type=radio]{
    display: none;
    max-width:20px;
}
.toggle3 input[type=radio] + label {
    color: #e0e0e0;
    font-size: 2em;
    
    
}
.toggle3 input[type=radio]:checked + label {
    color: #fc9a2a;
     
}

.line-title, .line-title_s{
	width:60px;
	font-weight : bold;
	text-align:center;
	margin-right:8px;
}
</style>

</head>
<body>

<div id="schedule-addForm">

<!-- 	<div class="exit-button"> -->
<!-- 		<button id="exit" class="btn-close" type="button"/> -->
<!-- 			<img src="resources/img/delIcon.svg" > -->
<!-- 		</button> -->
<!-- 	</div> -->


	<form modelAttribute="PetVO" name="updatepetForm" id="updatepetForm" action="updatepetForm" method="post" onsubmit="return formCheck()" enctype ="multipart/form-data">
		
		<input type="hidden" name="pno" value="${pet.pno}"/>
		

		<p align="left"><span class="error"><form:errors path="alarmTitle" /></span></p>
		<div class="titleForm1" style="display: flex;align-items: center;">
			<div class="line-title" style="">이름</div>
			<div class="titleForm-left"><input id = 'ctitle' name='petName' type="text" value="${pet.petName}"/>
			<input type="hidden" id="writer" name="userId" value="${userId}" /></div>
		</div>

		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
	  
		
		<div class="titleForm1" style="display: flex;align-items: center;">
			<div class="line-title">종류</div>
			<div class="titleForm-left"><input id = 'ctitle' name='petType' type="text" value="${pet.petType}"/></div>
		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="detail-line">
			<div class="toggle3" style="display:flex;align-items: center;">
				<div class="line-title_s">성별</div>
			    <input type="radio" id="toggle3-1" name="petSex" value="M"
			    	<c:if test="${fn:contains(pet.petSex, 'M')}">checked="true"</c:if>
		    	>
			    <label for="toggle3-1">♂</label>
			    
			    <svg width="10" height="46" id="row-svg">
			         <line x1="0" y1="5" x2="0" y2="41"/>
			      </svg>
			    
			    <input type="radio" id="toggle3-2" name="petSex" value="F"
			    	<c:if test="${fn:contains(pet.petSex, 'F')}">checked="true"</c:if>
			    >
			    <label for="toggle3-2">♀</label>
			</div>
		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="dateForm" style="display: flex;align-items: center;">
			<div class="line-title">생년월일</div>
			<input id='ctitle' name='petBirthday' type='date' value='${pet.petBirthday}' size='100%'  style="border:0 solid black;" />
		</div>
		
		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
		<div class="memoForm">
			<div class="line-title">메모</div>
			<div class="memoForm-right"><textarea id = 'ctitle' name='petMemo' type="text" value="${pet.petMemo}" placeholder="내용을 입력해주세요."></textarea></div>
		</div>
		

		<svg width="400" height="10" id="column-svg" style="margin: 3% 0 0 0;">
			<line x1="0" y1="0" x2="380" y2="0"/>
		</svg>
		
	  
	  	<div class="text-button">
  			<button type="reset" class="reset-btn">취소</button>
			
			<svg width="10" height="30">
				<line x1="0" y1="8" x2="0" y2="30"/>
			</svg>
			
			<button type="submit" id="submit-btn" > 저장 </button>
	  	</div>


	</form>
</div>
</body>
</html>