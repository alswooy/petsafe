<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> login page </title>

	<link href="${pageContext.request.contextPath}/resources/css/head.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="resources/css/login.css">


<script type="text/javascript">

</script>
</head>

<body onload="checkErrCode()">

<div class="login-page">
<div class="form">
  <form:form class="login-form" modelAttribute="userVO" method="post" action="login">
  
  <font size='6'><b> LOGIN </b></font><br><br><br><br>
        
        <div class="msgCode">${errMsg}</div>
         <p align="left"><span class="error"><form:errors path="userId" /></span><br /></p>
     <form:input path='userId' name='userId' type="text" placeholder="아이디를 입력하세요" required="true" /> 
     
        
        <p align="left"><span class="error"><form:errors path="passwd" /></span></p>
     <form:input path='passwd' name='passwd' type="password" placeholder="비밀번호를 입력하세요" required="true" />
        
        <br>   
     
     <button type="submit" class="loginBtn">로그인</button>
     
     <ul id="ullog">
	     <li id="lilog">
	     	<a href="<%=request.getContextPath()%>/join" style="text-decoration:none;color: #888888;font-size: 14px;">회원가입 | </a> 
	     </li>
		  <li id="lilog">
				<a href="<%=request.getContextPath()%>/findid" style="text-decoration:none;color: #888888;font-size: 14px;">아이디 찾기 | </a> 
				<a href="<%=request.getContextPath()%>/findpasswd" class="pwd" style="text-decoration:none;color: #888888;font-size: 14px;">비밀번호 찾기</a>
	      </li>
     </ul></p>
     <br>
<!--       <font style="margin-bottom:10px;"><b size="12px"> sns로 간편하게 로그인 하세요 </b></font><br> -->
<!--       <img src="resources/img/naverIcon.svg" width='35' style="margin-top:20px;">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--       <img src="resources/img/kakaotalk.svg" width='35'> -->
   
     
  </form:form>
  
    
</div></div>



</body>
</html>