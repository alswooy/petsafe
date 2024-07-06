<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>회원가입 페이지</title>
   
    <link href="${pageContext.request.contextPath}/resources/css/join.css" rel="stylesheet" type="text/css" />

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.9.2/i18n/jquery.ui.datepicker-ko.min.js"></script>

<script type="text/javascript">


function idCheck(){
   
   var userId = $("#userId").val();
   var access = $("#idCheckMsg");
   
   if (join.userId.value.length < 1){
	   access.html("<font color='red' size='2px;'>&nbsp;아이디를 입력해주세요</font>");
	   document.getElementById("userId").style.border = "2px solid red";
       join.userId.focus();
       $("#flag").val("false");
       return false;
 }
   
   $.ajax({
      url:"/PetSafe/idCheck?userId=" + userId,
      type: 'get',
      dataType: 'json',
      
      success:function(result){
         if (result.msg=="true"){
            access.html("<font color='green' size='2px;'>&nbsp;사용 가능한 아이디입니다.</font>");
            document.getElementById("userId").style.border = "2px solid green";
            $("#flag").val("true");
              }
         else{
            access.html("<font color='red' size='2px;'>&nbsp;이미 사용중인 아이디입니다.</font>");
            document.getElementById("userId").style.border = "2px solid red";
            $("#flag").val("false");
         }
      }
   });
}

function nicknameCheck(){
	   var nickname = $("#nickname").val();
	   var access = $("#NicknameCheckMsg");
	   
	   if (join.nickname.value.length < 1){
		   access.html("<font color='red' size='2px;'>&nbsp;닉네임을 입력해주세요</font>");
		   document.getElementById("nickname").style.border = "2px solid red";
	       join.nickname.focus();
	       $("#flag_nickname").val("false");
	       return false;
	 	}
	   
	   $.ajax({
	      url:"/PetSafe/nicknameCheck?nickname=" + nickname,
	      type: 'get',
	      dataType: 'json',
	      
	      success:function(result){
	         if (result.msg1=="true"){
	            access.html("<font color='green' size='2px;'>&nbsp;사용 가능한 닉네임입니다</font>");
	            document.getElementById("nickname").style.border = "2px solid green";
	            $("#flag_nickname").val("true");
	              }
	         else{
	            access.html("<font color='red' size='2px;'>&nbsp;이미 사용중인 닉네임입니다</font>");
	            document.getElementById("nickname").style.border = "2px solid red";
	            $("#flag_nickname").val("false");
	         }
	      }
	   });	
}

function Check_Form() 
{
   if (join.passwd.value != join.passwd_re.value){
      alert("패스워드가 일치하지 않습니다.");
      join.passwd.focus();
      return false;
   }
   
   if($("#flag").val() == "false"){
      alert("ID 중복검사가 실시되지 않았습니다.");
      $("id").focus();
      return false;
   }
   
   if($("#flag_nickname").val() == "false"){
	      alert("닉네임 중복검사가 실시되지 않았습니다.");
	      $("nickname").focus();
	      return false;
   }
   return true;
}

function checkMsg(){
   join.id.focus();
   var errCode = "${msgCode}";
   if(errCode != ""){
      alert(errCode);
   }      
}
</script>



</head>

<body>


<form id="fregisterform" name="join" method=post  Action='join' onsubmit='return Check_Form()' >   
<div class="content">
<div class="form">

 
     <div class="title"><h1 style="font-size: 50px;"  align="center">JOIN</h1></div>
     

        	
       <div class="line-title">아이디</div>
        <input type="text" class=input_box_check id='userId' name="userId"  placeholder="아이디를 입력해 주세요" onblur="idCheck();" required>
         <input type="hidden" id="flag" name="flag" value="false">
         <div class="idCheckMsg" id="idCheckMsg"></div>

        <div class="line-title" >비밀번호 </div>
            <input type="password" class="input_box" id="passwd" name="passwd" placeholder="비밀번호를 입력해 주세요." required>
            <div id="passwordError" class="error"></div>

        
        <div class="line-title">비밀번호확인</div>
            <input type="password" class="input_box" id="passwordCheck1" name="passwd_re" placeholder="비밀번호를 다시 입력해 주세요." required>
            <div id="passwordCheckError" class="error">
        </div>

        
          <div class="line-title">이름</div>
            <input type="text" class="input_box" id="name" name="name" placeholder="이름을 입력해 주세요." required >

            
          <div class="line-title">휴대폰 번호</div>
            <input type="text" class="input_box" id="phone" name='phone' maxlength="13" placeholder="휴대폰 번호를 입력해 주세요." oninput="changePhone1()" >

        <div class="line-title" >닉네임 </div>
            <input type="text" class="input_box_check" id="nickname" name="nickname"  placeholder="닉네임을 입력해 주세요." onblur="nicknameCheck();">
            <input type="hidden" id="flag_nickname" name="flag_nickname" value="false">
            <div class="NicknameCheckMsg" id="NicknameCheckMsg"></div>

            <div id="bottom">
                 <input type="submit" value="확인" class="writeBt3" style="margin-right:5px;"/>
            <input type="button" value="취소" class="writeBt1" style="margin-right:5px;" onclick="location.href='<%=request.getContextPath()%>/login'"/>
         </div>


        
        </div>
</form>
</body>

</html>