<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	
	<!-- <link href="${pageContext.request.contextPath}/resources/css/findpasswd.css" rel="stylesheet" type="text/css" /> -->
<script>
function Cancel_btn()
{
	findid.name.value="";
	findid.phone.value="";
	findid.name.focus();
}
function Check_Pre()
{
	if(findid.name.value.length<1){
		alert("이름을 입력하세요.");
		findid.name.value="";
		findid.name.focus();
		return false;
	}
	if(findid.phone.value.length<1){
		alert("핸드폰번호를 입력하세요.");
		findid.phone.value="";
		findid.phone.focus();
		return false;
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

<body>



<div class="form">
 
  <div class="statistics">
			<ul class="select-btn">
			
				<li class="showSelect">
					<input type="radio" id="week" name="select" style="display:none;" onclick="" checked>
					<label for="week"><a href="<%=request.getContextPath()%>/findid">아이디 찾기</a></label>
				</li>
				
				<li>
					<svg width="10" height="40" id="row-svg">
						<line x1="5" y1="7" x2="5" y2="37"/>
					</svg>
				</li>
				
				<li class="showSelect">
					<input type="radio" id="month" name="select" style="display:none;" onclick="">
					<label for="month"><a href="<%=request.getContextPath()%>/findpasswd">비밀번호 찾기</a></label>
				</li>
			</ul>	
		</div>
		
		<span class="fieldError"><form:errors path="name"/></span>
		

		<div style="margin-bottom:20px;">
			${msgCode}
		</div>
		
		<form:form modelAttribute="userVO" Name="findid" Method="POST" Action="findid" onsubmit="return Check_Pre()">
		<span class="fieldError" align="center">${errmsg}</span>
		  <div class="name">이름</div>
            <form:input path="name" id="name1"  type="text" placeholder="이름을 입력해 주세요."/><br>
            <div id="nameError" class="error"><br>
            
          <div class="phone">휴대폰 번호</div>
            <form:input path="phone" name="phone" id="phone1" type="text"  oninput="changePhone1()" 
            placeholder="휴대폰 번호를 입력해 주세요."/>
            <span class="fieldError"><form:errors path="phone"  style="font-weight:bold;color:red;"/></span>
            
           	<div id="bottom">
           		<input type="submit" value="확인" class="writeBt3" style="margin-right:5px;"/>
				<input type="button" value="취소" class="writeBt1" style="margin-right:5px;" onclick="location.href='<%=request.getContextPath()%>/login'"/>
			</div>
			
<!--             <input type="submit" value="확인"> -->
<!--             <input type='button' onclick='Cancel_btn()' value='취소'> -->
<!--            <button disabled id="sendMessage" onclick="getToken()">확인</button> -->
        
		</div>
</form:form>
</div> 	




</body>
</html>