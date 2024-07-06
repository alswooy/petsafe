<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<link href="${pageContext.request.contextPath}/resources/css/head.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<script>
</script>
</head>

<body>

	
	
	
	
	<div class="login-page">
<div class="form">
  <form:form class="login-form" modelAttribute="user" method="post" action="login">
  
  <font size='6'><b> LOGIN </b></font><br><br><br><br>
 	
     <div class="id"  align="center" >
            <input id="id" type="text" placeholder="아이디를 입력하세요.">
            <div id="idError" class="error"></div>
     
   <div class="password" >
            <input id="password" type="password" placeholder="비밀번호를 입력하세요.">
            <div id="passwordError" class="error"></div>
        </div>
        
        <br>
     
     <button type="submit">로그인</button> <br><br>
     
     <p class="message"><ul id="ullog">
	  <li id="lilogb"><a href="<%=request.getContextPath()%>/join">회원가입</a></li>|
	  <li id="lilog"><a href="<%=request.getContextPath()%>/findid">아이디 찾기|</a> 
                     <a href="<%=request.getContextPath()%>/findpasswd" class="pwd">비밀번호 찾기</a></li>
     </ul></p>
     <br>
      <font size='2'><b> sns로 간편하게 로그인 하세요 </b></font></br></br>
      <img src="resources/img/naverIcon.svg" width='35'>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <img src="resources/img/kakaotalk.svg" width='35'>
   
     
  </form:form>
  
    
</div></div>



</body>
</html>