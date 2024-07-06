<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
	<!-- <link href="${pageContext.request.contextPath}/resources/css/findpasswd.css" rel="stylesheet" type="text/css" /> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function Check_Pre()
{
	if(deluser.userId.value.length<1){
		alert("아이디를 입력하세요.");
		deluser.userId.value="";
		deluser.userId.focus();
		return false;
	}
	if(deluser.passwd.value.length<1){
		alert("핸드폰번호를 입력하세요.");
		deluser.passwd.value="";
		deluser.passwd.focus();
		return false;
	}
	if(deluser.phone.value.length<1){
		alert("핸드폰번호를 입력하세요.");
		deluser.phone.value="";
		deluser.phone.focus();
		return false;
	}

}
</script>

<script>
function checkMsg(){
	var msgCode = "${msgCode}";
	if(msgCode != ""){
		alert(msgCode);
	}		
}
</script>

<style>
/폰트/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

html{
	font-family: 'Noto Sans KR', 'Nanum Gothic', sans-serif;
	margin:0 300px 0 300px;
}



#name1 {
    width: 300px; 
    height: 40px;
    background-color: #FFFFFF; 
    border:1.5px solid #d6d9d3; 
    border-radius:5px;
    padding:3px 3px 2px 7px; 
    box-sizing:border-box; 
}




#phone1 {
    width: 300px;
    height: 40px;
    background-color: #FFFFFF;
    border: 1.5px solid #d6d9d3;
    border-radius: 5px;
    padding: 3px 3px 2px 7px;
    box-sizing: border-box;
}


#passwd1{
    width: 300px;
    height: 40px;
    background-color: #FFFFFF;
    border: 1.5px solid #d6d9d3;
    border-radius: 5px;
    padding: 3px 3px 2px 7px;
    box-sizing: border-box;
}



 #phoneButton {
  height: 40px;
 }
 
#sendMessage{
  	height: 50px;
  	width: 300px;
  	margin-bottom:40px;
 	margin-top:15px;
	border-radius: 10px;
	border: none;
	background:#dedede;
	color: #767676;
	font-weight : bold;
 }






.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 600px;
  margin: 10% auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}

.phone{
	margin-left:155px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}
.name{
	margin-left:125px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
}
.pass{
	margin-left:134px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
}





/* 상단 아이디찾기 비번찾기 */

.select-btn{
	list-style: none;
    display: flex;
    flex-direction: row;
    align-items: center;
    width: 200px;
    justify-content: space-between;
    flex-wrap: nowrap;
    margin: 40px 0 40px 17%;
}

.select-btn li{
	position:relative;
	margin:0;
	padding:0;
	text-align:center;
	font-size:18px;
}

.select-btn li a{
	display:block;
	height:28px;
	padding:8px 8px;
	margin:0;
	color:#7e7e7e;
	font-weight:bold;
	text-decoration:none;
}

.showSelect{
    display: flex;
    flex-direction: column;
    align-content: flex-start;
    margin:4% 0 0 0;
}

input[type='radio'] + label{
	width: 150px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    color:#7e7e7e;
}

input[type='radio']:checked + label{
	background: #ffe699;
	margin:10% 0 10% 0;
	color:black;
	font-weight: bold;
}

#bottom{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.writeBt1 {
  background : #d1cec3;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  width: 300px;
  border: 0;
  padding: 15px;
  color: black;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  border:none;
  font-weight: bold;
  margin-top: 10px;
  border-radius: 5px;

}


.writeBt3{
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  width: 300px;
  border: 0;
  padding: 15px;
  color: black;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
  background:  #FFECB3;
  border:none;
  font-weight: bold;
  margin-top: 20px;
  border-radius: 5px;
	}







</style>
</head>

<body onload="checkMsg()">

	<div class="form">
		<h2>회원 탈퇴</h2>
		<form:form modelAttribute="userVO" Name="deluser" Method="POST" Action="deluser" onsubmit="return Check_Pre()">
			<div style="margin-bottom:20px;">
				${errMsg}
			</div>
			
		  	<div class="name">아이디</div>
		  	
            <input path="userId" name="userId" id="name1" type="text" value="${userId}" readonly="readonly"><br>
			<div id="userIdError" class="error"><br></div>
			
            <div class="pass">비밀번호</div>
            <input path="passwd" name="passwd" id="passwd1"  type="password" placeholder="비밀번호를 입력해 주세요."><br>
            <div id="passwdError" class="error"><br></div>
           	
	            
			<div class="phone">휴대폰 번호</div>
            <input path="phone" name="phone" id="phone1" type="text" placeholder="휴대폰 번호를 입력해 주세요."><br>
			<div id="phoneError" class="error"><br></div>

            <div id="bottom">
            	<input type="submit" value="탈퇴" class="writeBt3"/>
				<input type="button" value="취소" class="writeBt1" onclick="location.href='<%=request.getContextPath()%>/mainpage'"/>
			</div>
	        
			
		</form:form>
	</div> 	




</body>
</html>