<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script>
</script>

<style>

/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');

html{
   font-family: 'Noto Sans KR', 'Nanum Gothic', sans-serif;
   margin:0 300px 0 300px;
}

.mypage {
  width: 700px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #f8f8f6;
  max-width: 600px;
  margin: 0 auto 100px;
  padding: 45px;
 
  box-shadow: 5px 5px 5px gray;
}



#a{

	font-weight : bold;
	font-size : 20px;
	margin-bottom : 20px;
}

input[type=text] {

  outline: 0;
  background:  #f8f8f6;
  width: 200px;
  border: 0;
  margin-left:30px;
  padding: 5px;
  box-sizing: border-box;
  font-size: 14px;
  border-bottom-width: thin;
  border-style:solid;
  border-color:  rgb(118, 118, 118);
}
img {
	margin-right: 20px;
	width:150px;
	
}

#petname {
	width:120px;
	margin-right:20px;
}
#petbirth {
	width:120px;
}

#petkind {
	width:120px;
	margin-right:20px;
}
#petmemo {
	width:120px;
}


</style>
</head>

<body>



<div class="mypage">
<div id= "a">내정보</div>
<div class = "form">
 
	<img src="resources/img/profile.svg" align='left'>

   <p><b>아이디</b><input id="nickname" type="text" placeholder="id123"></p>
   <p><b>이메일</b><input id="eamil" type="text" placeholder="abcd1234@naver.com"></p>
   <p><b>전화번호</b><input id="phone" type="text" placeholder="010-1111-2222"></p>
          
   
</div>





<div id= "a">반려동물 정보</div>
<div class = "form">
	<img src="resources/img/profile.svg" width='150'  align='left' >
	
	<p><b>이름</b><input id="petname" type="text" placeholder="반려동물의 이름">
	<b>생년월일</b><input id="petbirth" type="text" placeholder="2020-06-11"></p>
   <p><b>종류</b><input id="petkind" type="text" placeholder="시베리아 허스키">
	<b>메모</b><input id="petmemo" type="text" placeholder="특이사항12345"></p>
</div>

</div>



</body>
</html>