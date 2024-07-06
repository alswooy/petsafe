<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PETSAFE</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<header>
		<div id="header-top">
			<div class="header-logo">
				<a href="<%=request.getContextPath()%>/header">
					<img src="resources/img/Logo.png" width="200px">
				</a>
			</div>
			
			<form id="searchForm" method="POST" action="#">
				<button class="searchForm-btn">
					<img src="${pageContext.request.contextPath}/resources/img/SearchIcon.svg" width="20px">
				</button>
				<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요."/>
				<button class="searchForm-delbtn">
					<img src="${pageContext.request.contextPath}/resources/img/inputDel.svg" width="20px">
				</button>
			</form>
			
		</div>
		
		<ul id="nav">
			<div class="main-menu">
				<li><a href="<%=request.getContextPath()%>/calendar" class="menu-title">캘린더</a></li>
				<li><a href="<%=request.getContextPath()%>/exercise" class="menu-title">운동량</a></li>
				<li><a href="#" class="menu-title">커뮤니티</a>
					<ul>
						<li><a href="#">자유게시판</a></li>
						<li><a href="#">갤러리</a></li>
					</ul>
				</li>
			</div>
			
			<div class="UserMenu">
				<li><a href="<%=request.getContextPath()%>/mypage" class="UserMenu-sub">마이페이지</a></li>
				<li><a href="<%=request.getContextPath()%>/login" class="UserMenu-sub">로그인</a></li>
			</div>
		</ul>
		
	</header>
</body>
</html>