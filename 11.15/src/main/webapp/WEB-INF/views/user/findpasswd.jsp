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
	findpasswd.userId.value="";
	findpasswd.phone.value="";
	findpasswd.userId.focus();
	
	
}

function Check_Pre()
{
	if(findpasswd.userId.value.length<1){
		alert("아이디를 입력하세요")
		findpasswd.userId.value="";
		findpasswd.userId.focus();
		return false;
		
	}
	if(findpasswd.phone.value.length<1){
		alert("핸드폰 번호를 정확하게 입력하세요");
		findpasswd.phone.value="";
		findpasswd.phone.focus();
		return false;
	}
	return true;
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
					<input type="radio" id="week" name="select" style="display:none;" onclick="" >
					<label for="week"><a href="<%=request.getContextPath()%>/findid">아이디 찾기</a></label>
				</li>
				
				<li>
					<svg width="10" height="40" id="row-svg">
						<line x1="5" y1="7" x2="5" y2="37"/>
					</svg>
				</li>
				
				<li class="showSelect">
					<input type="radio" id="month" name="select" style="display:none;" onclick=""checked>
					<label for="month"><a href="<%=request.getContextPath()%>/findpasswd">비밀번호 찾기</a></label>
				</li>
			</ul>
			
			
		</div>

 		 <form:form modelAttribute="userVO" Name="findpasswd" Method="POST" Action="findpasswd" onsubmit="return Check_Pre()">
 		 <span class="fieldError" align="center" style="font-weight:bold;color:red;">${errMsg}</span>
        <div class="id"  align="center"  style="margin-top:20px;">아이디</div>
            <form:input path="userId" id="id1" type="text" placeholder="아이디를 입력해 주세요."/>
            <span class="fieldError"><form:errors path="userId"/></span>
            <div id="idError" class="error"> <br>

          <div class="phone">휴대폰 번호</div>
            <input path="phone" type="text" name="phone" id="phone1" type="text" maxlength="11" oninput="changePhone1()" 
            placeholder="휴대폰 번호를 입력해 주세요.">
            <span class="fieldError"><form:errors path="phone"/></span>
            <!--  <button id="phoneButton" disabled onclick="phoneCheck()">재발송</button>-->
           
            
           	<div id="bottom">
           		<input type="submit" value="확인" class="writeBt3" style="margin-right:5px;"/>
				<input type="button" value="취소" class="writeBt1" style="margin-right:5px;" onclick="location.href='<%=request.getContextPath()%>/login'"/>
			</div>
			
<%--             <span class="fieldError" align="center">${errMsg}</span><BR> --%>
<!--           	<input type="submit" value="확인"> -->
<!--             <input type='button' onclick='Cancel_btn()' value='취소'> -->

</div>
</form:form>
</div> 	




</body>
</html>