<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css" />

<title>MyPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


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

.mypage {
  width: 900px;
  padding: 8% 0 0;
  margin: auto;
}

.form {
	position: relative;
	z-index: 1;
	background: #f8f8f6;
	width: 900px;
	height: auto;
	margin: 0 auto 80px;
	padding: 45px;
	box-shadow: 5px 5px 5px gray;
	display:flex;
	flex-direction: row;
}



#a{
	font-weight : bold;
	font-size : 20px;
	margin-bottom : 20px;
}

.input_box {
    width: 300px;
    height: 40px;
    background-color: #FFFFFF;
    border: 1.5px solid #d6d9d3;
    border-radius: 5px;
    padding: 3px 3px 2px 7px;
    box-sizing: border-box;
	
}

#petname {
	width:120px;
	margin-right:20px;
}
#petbirth {
	width:120px;
}

#petkind {
	width:120px;
	margin-right:20px;
}
#petmemo {
	width:120px;
}


#chpic, #del, #change{
	width: 80px;
	height: 30px;
	border-radius: 10px;
	border: none;
	background:#dedede;
	color: #767676;
	font-weight : bold;
}

#male{
    display: none;
   
}

#female{
    display: none;
    margin-left: 100px;
}

.profile{
	display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
    width:200px;
}

.profile-button{
    display: flex;
    justify-content: space-between;
    flex-direction: row;
}



.detail{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 10px;
}


#row-svg{
    padding: 0% 5% 0% 5%;
    
}

#row-svg line{
   stroke:  #e0e0e0;
}

.save{
    display: flex;
    align-items: flex-end;
    margin-left: auto;
	justify-content: flex-end;
}

#addbtn {
  

  background:#FFE699;
  width: 140px;
  border: 0;
  border-radius: 10px;
  padding: 15px;
  color: #767676;
  font-weight:bold;
  font-size: 17px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  

}

.add{
 display:flex;
 justify-content: center;

}

.toggle3{
	width: 180px;
    display: flex;
    justify-content: center;
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

#phoneButton {
	margin-left:10px;

}

/*테스트*/
.detail-line{
	display:flex;
    padding: 20px 0 0 0;
}

.line-title, .line-title_s{
	width:60px;
	font-weight : bold;
	text-align:center;
	margin-right:8px;
}

.line-title_s{
    display: flex;
    justify-content: center;
    flex-direction: column-reverse;
}

.line-text{
border-bottom: 1px solid #dddddd;
    padding: 0 10px 4px 4px;
    width: 140px;
}

#edtBtn{
	width: 80px;
    height: 30px;
    border-radius: 10px;
    border: none;
    background: #FFE699;
    color: #767676;
    font-weight: bold;
    
}

#delBtn{
	border:none;
	background: #f8f8f6;
	font-weight:bold;
	
}

.NicknameCheckMsg{
	margin-left:68px;
	font-weight: bold;
}


</style>

</head>

<body onload="checkMsg()">



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






<!-- <div id= "a">반려동물 정보</div> -->
<!-- <div class = "form"> -->

 
<!--    <div class ="profile"> -->
<!-- 		<img src="resources/img/profile.svg" width='150' style = "margin-bottom:20px;"> -->
<!-- 		<div class="profile-button"> -->
<!-- 			<button id="chpic" type="submit" style = "margin-right:20px;">사진 변경</button> -->
<!-- 			<button id="del" type="reset">삭제</button> -->
<!-- 			</div> -->
<!--    </div> -->
   
<!-- 	<div class="detail"> -->
<!-- 			<div class="detail-line"> -->
<!-- 				<div class="line-title">이름</div> -->
<!-- 				<input id="petname" type="text" placeholder="반려동물 이름"> -->
				
<!-- 				<div class="line-title">생년월일</div> -->
<!-- 				<input id="petbirth" type="text" placeholder="2020-06-11"> -->
<!-- 			</div> -->
			
<!-- 			<div class="detail-line"> -->
<!-- 				<div class="line-title">종류</div> -->
<!-- 				<input id="petkind" type="text" placeholder="시베리아 허스키"> -->
				
<!-- 				<div class="line-title">메모</div> -->
<!-- 				<input id="petmemo" type="text" placeholder="특이사항12345""> -->
<!-- 			</div> -->
			
<!-- 			<div class="detail-line"> -->
<!-- 				<div class="line-title_s">성별</div> -->
				
<!-- 				<div class="toggle3"> -->
<!-- 				    <input type="radio" id="toggle3-1" name="weather"> -->
<!-- 				    <label for="toggle3-1">♂</label> -->
				    
<!-- 				    <svg width="10" height="46" id="row-svg"> -->
<!-- 				         <line x1="0" y1="5" x2="0" y2="41"/> -->
<!-- 				      </svg> -->
				    
<!-- 				    <input type="radio" id="toggle3-2" name="weather"> -->
<!-- 				    <label for="toggle3-2">♀</label> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!-- 	</div> -->
			
<!--     <div class="save"> -->
<!-- 		<button id="change" type="submit">저장</button> -->
<!-- 	</div> -->

<!-- </div> -->
	

	
    
<!-- </div> -->


<!-- <div class ="add"> -->
<!-- <button id="addbtn" type="submit" >반려동물 추가</button> -->
<!-- </div> -->
<!-- <br> -->
<!-- <br> -->
<!-- <br> -->










</body>
</html>