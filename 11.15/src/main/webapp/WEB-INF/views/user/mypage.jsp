<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css" />

<title>MyPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
    $('.addbtn').on('click', function(){
    	popup();
    });
    
   
	
});

function popup(){
	
	var pop_width = "400";
	var pop_height = "530";
	
	var left_size = Math.ceil((window.screen.width - pop_width) / 2);
	var top_size = Math.ceil((window.screen.height - pop_height) / 2);
	
	
	var url = "<%=request.getContextPath()%>/addpetForm";
	var name = "addpetForm";
	var option= "width=" + pop_width + ", height=" + pop_height + ", left=" + left_size + ", top=" + top_size;
	window.open(url, name, option);
}




function deleteArticle(pno) {
    if (confirm("정보를 삭제하시겠습니까??")) {
       location.href = "deleteArticle?pno=" + pno ;
    }
 }
 
 



function editProfile(i){
	switch(i){
	case 1:
		document.getElementById("mypage-from").style.display = 'none';
		document.getElementById("edit-from").style.display = 'block';
		break;
	case 2:
		document.getElementById("mypage-from").style.display = 'block';
		document.getElementById("edit-from").style.display = 'none';
		break;
	}

}



function nicknameCheck(){
	   var nickname = $("#nickname").val();
	   var access = $("#NicknameCheckMsg");
	   
	   if (mypage.nickname.value.length < 1){
		   access.html("<font color='red' size='2px;'>&nbsp;닉네임을 입력해주세요</font>");
		   mypage.nickname.focus();
		   document.getElementById("nickname").style.border = "2px solid red";
	       $("#flag_nickname").val("false");
	       return false;
	 	}
	   
	   $.ajax({
	      url:"/PetSafe/nicknameCheck?nickname=" + nickname,
	      type: 'get',
	      dataType: 'json',
	      
	      success:function(result){
	         if (result.msg1=="true"){
	            access.html("<font color='green' size='2px;'>&nbsp;사용 가능한 닉네임입니다.</font>");
	            document.getElementById("nickname").style.border = "2px solid green";
	            $("#flag_nickname").val("true");
	              }
	         else{
	            access.html("<font color='red' size='2px;'>&nbsp;이미 사용중인 닉네임입니다.</font>");
	            document.getElementById("nickname").style.border = "2px solid red";
	            $("#flag_nickname").val("false");
	            
	         }
	      }
	   });	
}

function Check_Form() 
{
if($("#flag_nickname").val() == "false"){
	      alert("닉네임 중복검사가 실시되지 않았습니다.");
	      $("nickname").focus();
	      return false;
}
return true;
}


	 

</script>

<script>
function checkMsg(){
	var msgCode = "${msgCode}";
	if(msgCode != ""){
		alert(msgCode);
	}
	
	var errMsg = "${errMsg}";
	if(errMsg != ""){
		document.getElementById("mypage-from").style.display = 'none';
		document.getElementById("edit-from").style.display = 'block';
	}

	var errMsg = "${errMsg}";
	if(errMsg != ""){
		document.getElementById("petpage-from").style.display = 'none';
		document.getElementById("petedit-from").style.display = 'block';
	}
}
</script>





<style>



</style>

</head>

<body onload="errCodeCheck()">



<div class="mypage">
	<div id= "a">내정보</div>
	<div class = "form">
	   <div class ="profile">
			<img src="resources/img/profile.svg" width='150' style = "margin-bottom:20px;">
			<div class="profile-button">
				<button id="chpic" type="submit" style = "margin-right:20px;">사진 변경</button>
				<button id="del" type="reset">삭제</button>
			</div>
	   </div>
   
		<div id="mypage-from" style="width: 100%;padding-left: 20px;">
		
		     <div class ="detail" >
			  	<div class="detail-line">
			  		<div class="line-title">아이디</div>
			  		<div class="line-text">${userVO.userId}</div>
			  	</div>	
			  	<div class="detail-line">
			  		<div class="line-title">닉네임</div>
			  		<div class="line-text">${userVO.nickname}</div>
			  	</div>
			  		
			  	<div class="detail-line">
			  		<div class="line-title">전화번호</div>
			  		<div class="line-text">${userVO.phone}</div>
			   	</div>
			</div>
		   	<div class="save">
		   		<button id="edtBtn" onclick="editProfile(1)" style="margin-top:20px;">수정</button>
		   		<button id="del" onclick="location.href='<%=request.getContextPath()%>/deluser'" style="margin-left:10px;">회원 탈퇴</button>
			</div>
		</div>
		

	   
<!-- 내정보 수정 화면  -->
	  <div style="display:none;width: 100%;padding-left: 20px;" id="edit-from">
		  <div class ="detail">
		  
		  	<form id="fregisterform" name="mypage" method=post  Action='mypage' onsubmit='return Check_Form()' >
		  	${errMsg}
		  	<div class="detail-line">
		  		<div class="line-title"> 아이디</div>
		  		<input id="userId" name="userId" type="text" value="${userVO.userId}" readonly="readonly" class="input_box">
		  	</div>
		  	
		  	<div class="detail-line">
		  		<div class="line-title">닉네임</div>
		  		<input id="nickname" name="nickname" type="text" value="${userVO.nickname}" class="input_box" onblur="nicknameCheck();"/>
		        <input type="hidden" id="flag_nickname" name="flag_nickname" value="false">
	  		</div>
	  		
	  		<div class="NicknameCheckMsg" id="NicknameCheckMsg"></div>
	  		
		  	<div class="detail-line">
		  		<div class="line-title">전화번호</div>
		  		<input id="phone" name="phone" type="text" value="${userVO.phone}" class="input_box"/>
		   	</div>
		   	
	   	    <div class="detail-line">
		  		<div class="line-title">비밀번호</div>
		  		<input id="passwd" name="passwd"  type="password" placeholder="비밀번호를 입력해주세요." class="input_box" required="true"/>
		  	</div>
		    
		   	<div class="save">
				<button id="change" onclick="editProfile(2)" style="margin-right:10px;">취소</button>
				<button id="edtBtn" type="submit">저장</button>
			</div>
	    	
	    	</form>
		  </div>
		</div>
		
		
</div> 





<!--  반려동물 정보 화면 -->
<div id= "a">반려동물 정보</div>


    
<c:forEach var="pet" items="${petList}">

<div class = "form">



   <div class ="profile">
		<img src="resources/img/profile.svg" width='150' style = "margin-bottom:20px;">
		<div class="profile-button">
			<button id="chpic" type="submit" style = "margin-right:20px;">사진 변경</button>
			<button id="del" type="reset">삭제</button>
			</div>
   </div>

  		
	   <div id="petpage-from" style="width: 100%;padding-left: 20px;">
	   
			     <div class ="detail" >
			     
			     		<input type="hidden" name="pno" value="${pet.pno}"/>
			     		<input type="hidden" name="pno" value="${pet.userId}"/>
			     
					  	
					  	<div class="detail-line">
					  		<div class="line-title">이름</div>
					  		<div class="line-text">${pet.petName}</div>
					  	</div>	
					  		
					  	<div class="detail-line">
					  		<div class="line-title">종류</div>
					  		<div class="line-text">${pet.petType}</div>
					   	</div>

					   	
						<div class="detail-line">
							<div class="line-title_s">성별</div>
							
							<div class="toggle3">
							    <input type="radio" id="toggle3-1" onclick="return(false);"
							    	<c:if test="${fn:contains(pet.petSex, 'M')}">checked="true"</c:if>
						    	>
							    <label for="toggle3-1">♂</label>
							    
							    <svg width="10" height="46" id="row-svg">
							         <line x1="0" y1="5" x2="0" y2="41"/>
							      </svg>
							    
							    <input type="radio" id="toggle3-2" onclick="return(false);"
							    	<c:if test="${fn:contains(pet.petSex, 'F')}">checked="true"</c:if>
							    >
							    <label for="toggle3-2">♀</label>
							</div>
						</div>
						
											  	
					  	<div class="detail-line">
					  		<div class="line-title">생년월일</div>
					  		<div class="line-text" type="date" >${pet.petBirthday}</div>
					  	</div>
					   	
 						<div class="detail-line">
					  		<div class="line-title">메모</div>
					  		<div class="line-text">${pet.petMemo}</div>
					   	</div>
					   	
				   		<!-- <div class="detail-line">
				  		<div class="line-title">펫이미지</div>
					  		<div class="line-text">${pet.petImg}</div>
					   	</div> -->
					   	
					   	<div class="save">
			   				<button id="edtBtn" style="margin-top:20px;"
			   				 onClick="window.open('updatepetForm?pno=${pet.pno}','updatepetForm','width=400, height=530, left=900 top=300');">수정</button>
			   				&nbsp;&nbsp;
			   				<button type="button" onclick="deleteArticle(${pet.pno})" id = del> 삭제</button>
			   				
						</div>
			   
				</div>
		</div>
	    
	 </div>
	 </c:forEach>
</div>
		

		
	 
    





<div class ="add">
	<button class="addbtn">반려동물 추가</button>
</div>


<br>
<br>
<br>



</body>
</html>