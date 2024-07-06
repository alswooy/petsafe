<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="${pageContext.request.contextPath}/resources/css/head.css" rel="stylesheet" type="text/css" />
	
<script>
</script>
<style>

input[type=text] {
	font-family: "Roboto", sans-serif;
    width: 400px; 
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

#phone1 {
	width:335px;
}

 #phoneButton {
 font-family: "Roboto", sans-serif;
  height: 40px;
 }
 
 #sendMessage{
 font-family: "Roboto", sans-serif;
  height: 50px;
  width: 400px;
  background: #A4A4A4;
  color: #FFFFFF;
 
 }

b {
	font-family: "Roboto", sans-serif;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}

​

.findpasswd-page {
  width: 700px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 600px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

#Userfind{ 
	padding-top: 100px;
    width: auto;
    height: 81px;
	display: flex;
	justify-content: center;
}

.finduser{
     margin: 0 10px 0 10px;
    font-size: 22px;
    font-weight: bold;     
    text-decoration: none;
    color: black;


}


</style>

</head>

<body>

<br><br><br><br><br><br><br>
	<div class="findpasswd-page">
<div class="form">
 
 <div id="Userfind">
	<a href="/doc/findid" class="finduser"> <strong>아이디찾기</strong></a> |
 	<a href="/doc/findpasswd"  class="finduser"> <strong>비밀번호찾기</strong></a>
 	
 </div>
 
 
  
 		 <b>아이디</b><br>
        <div class="id"  align="center" >
            <input id="id" type="text" placeholder="아이디를 입력해 주세요.">
            <div id="idError" class="error"></div> <br>
            
          <div class="name"><b>이름</b><br>
            <input id="name"  type="text" placeholder="이름을 입력해 주세요.">
            <div id="nameError" class="error"></div><br>
            
          <div class="phone"><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp휴대폰 번호</b><br>
            <input id="phone1" type="text" maxlength="11" oninput="changePhone1()" 
            placeholder="휴대폰 번호를 입력해 주세요.">
            <button id="phoneButton" disabled onclick="phoneCheck()">재발송</button>
            </div>
            
            <br><br>
            
          <button disabled id="sendMessage" onclick="getToken()">확인</button>
        
 	
     
     
    
    
  
    
</div></div>



</body>
</html>