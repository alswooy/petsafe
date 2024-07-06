<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
	<!-- <link href="${pageContext.request.contextPath}/resources/css/findpasswd.css" rel="stylesheet" type="text/css" /> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function Check_Pass()
{
	if(updatePass.passwd.value.length<1){
		alert("패스워드를 입력하세요")
		updatePass.passwd.focus();
		return false;
		
	}
	if(updatePass.passwd2.value.length<1){
		alert("패스워드 확인를 입력하세요")
		updatePass.passwd.focus();
		return false;
		
	}
	if(updatePass.passwd.value!=updatePass.passwd2.value){
		alert("비밀번호가 일치하지 않습니다.");
		updatePass.passwd.value="";
		updatePass.passwd2.value="";
		updatePass.passwd.focus();
		return false;
		
	}
	return true;
}

function Cancel_btn()
{
	updatePass.passwd.value="";
	updatePass.passwd2.value="";
	updatePass.passwd.focus();
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

#id1 {
	
    width: 300px; 
    height: 40px;
    background-color: #FFFFFF; 
    border:1.5px solid #d6d9d3; 
    border-radius:5px;
    padding:3px 3px 2px 7px; 
    box-sizing:border-box; 
  
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
	width: 245px; 
    height: 40px;
    background-color: #FFFFFF; 
    border:1.5px solid #d6d9d3; 
    border-radius:5px;
    padding:3px 3px 2px 7px; 
    box-sizing:border-box; 
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
	margin-left:110px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}
.id{
	margin-left:120px;
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

.pass1{
	margin-left:120px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}
.pass2{
	margin-left:148px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}
.pass3{
	margin-left:180px;
	margin-bottom:10px;
	font-weight:bold;
	font-size: 15px;
	display: block;
	text-indent: -380px;
	
}


#bottom{
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top:20px;
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
  border-radius: 5px;
	}

</style>
</head>

<body onload="checkMsg()">


<form:form modelAttribute="userVO" Name="updatePass" Method="post" Action="updatePass" onsubmit="return Check_Pass()">
<div class="form">

        <div class="pass1" style="margin-top:14px;">아이디</div>
            <form:input path="userId" id="id1" value="${userVO.userId}"  readonly="true" style="margin-bottom:20px"/>
             <span class="fieldError"><form:errors path="userId"/></span>
            
          <div class="pass2" >새 비밀번호</div>
            <form:password path="passwd" id="name1" placeholder="새비밀번호를 입력해 주세요." style="margin-bottom:20px"/>
            <span class="fieldError"><form:errors path="passwd"/></span>
            
            
          <div class="pass3">비밀번호 확인</div>
            <input type="password" name="passwd2" id="name1"  value="" showPassword="true"  placeholder="비밀번호를 재입력해 주세요."/><br>
			<span class="fieldError" >${errMsg}</span>

             <div id="bottom">
           		<input type="submit" value="확인" class="writeBt3" style="margin-right:5px;"/>
				<input type="button" value="취소" class="writeBt1" style="margin-right:5px;" onclick="location.href='<%=request.getContextPath()%>/login'"/>
			</div>
           </td>

  
    
</div></div> 	


</div>
</form:form>

</body>
</html>