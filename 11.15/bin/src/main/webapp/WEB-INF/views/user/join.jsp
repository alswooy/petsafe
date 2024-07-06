<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>회원가입 페이지</title>
    
   
    
<style>

#signUpButton {
 font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #FFFFFF;
  width: 200px;
  border: 0;
  padding: 15px;
  color: black;
  font-size: 20px;
  cursor: pointer;
  border-radius: 5px;
  border-color:  #FFE699;
  border-style:solid;
  border-top-width: medium;
  border-bottom-width: medium;
  border-left-width: medium;
  border-right-width: medium;
}

#idButton {
 font-family: "Roboto", sans-serif;
  height: 40px;
 }
 #phoneButton {
 font-family: "Roboto", sans-serif;
  height: 40px;
 }
 #sendMessage {
 font-family: "Roboto", sans-serif;
  height: 40px;
  width: 70px;
 }

input[type=text] {
	font-family: "Roboto", sans-serif;
    width: 300px; 
    height: 40px;
    background-color: #FFFFFF; 
    border:1.5px solid #d6d9d3; /*테두리 두께, 선스타일, 색상*/
    border-radius:5px;
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; /*테두리를 기준으로 박스크기 설정*/
  
}


input[type=password] {
	font-family: "Roboto", sans-serif;
    width: 300px; 
    height: 40px;
    background-color: #FFFFFF; 
    border:1.5px solid #d6d9d3; /*테두리 두께, 선스타일, 색상*/
    border-radius:5px;
    padding:3px 3px 2px 7px; /*안쪽여백*/
    box-sizing:border-box; 
  
}
b {
	font-family: "Roboto", sans-serif;
	font-size: 15px;
	display: block;
	text-indent: -330px;
	
}

div {

 	text-align:center;
 	}
 	
#password {
	width:380px;
}
#passwordCheck {
	width:380px;
}
#name {
	width:380px;
}
#email {
	width:380px;
}
/* join*/

.wrapper {
  width: 500px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 400px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}






</style>

 

</head>

<body>
    <div class="wrapper">
    <div class="form">
        <div class="title"><h1 style="font-size: 50px;"  align="center">JOIN</h1></div>
        <b>아이디</b><br>
        <div class="id"  align="center" >
            <input id="id" type="text" placeholder="아이디를 입력해 주세요.">
            <button id="idButton" disabled onclick="idCheck()">중복확인</button>
            <div id="idError" class="error"></div>
             
        </div>
        
        <br>
       <b>비밀번호</b><br>
        <div class="password" >
            <input id="password" type="password" placeholder="비밀번호를 입력해 주세요.">
            <div id="passwordError" class="error"></div>
        </div>
        
        <br>
        
        <div class="passwordCheck"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비밀번호확인</b><br>
            <input id="passwordCheck" type="password" placeholder="비밀번호를 다시 입력해 주세요.">
            <div id="passwordCheckError" class="error"></div>
        </div>
        
        <br>
        
         <div class="name"><b>이름</b><br>
            <input id="name"  type="text" placeholder="이름을 입력해 주세요.">
            <div id="nameError" class="error"></div>
        </div>
        <br>
        
        <div class="phone"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp휴대폰 번호</b><br>
            <input id="phone1" type="text" maxlength="11" oninput="changePhone1()" 
            placeholder="휴대폰 번호를 입력해 주세요.">
             <button id="phoneButton" disabled onclick="phoneCheck()">인증번호</button>
              

        </div>
        <br>
        <div class="auth">
            <input id="phone2" type="text" oninput="changePhone2()"
            placeholder="인증번호를 입력해 주세요.">
            <button disabled id="sendMessage" onclick="getToken()">확인</button>
        </div>

        <!--  <div class="timer">
            <div id="timeLimit">03:00</div>
            <button disabled id="completion" onclick="checkCompletion()">인증확인</button>
        </div> -->
        
        <br>
        <div class="email"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp본인 확인 이메일(선택)</b><br>
            <input id="email"  type="text" placeholder="이메일을 입력해 주세요.">
            <div id="eamilError" class="error"></div>
        </div>
       <br><br><br>
        <div class="signUp">
            <button id="signUpButton" disabled onclick="signUpCheck()">가입하기</button>
        </div>
    </div></div>

</body>

</html>