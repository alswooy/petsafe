<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 쓰기</title>

<link href="${pageContext.request.contextPath}/resources/css/write.css" rel="stylesheet" type="text/css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function formCheck() {
	if (writeForm.title.value.length < 1){
		alert("제목을 입력하세요.");
		writeForm.title.focus();
		return false;
	}
		if (writeForm.content.value.length < 1){
		alert("내용을 입력하세요.");
		writeForm.content.focus();
		return false;
	}
	return true;
}

$(document).ready(function(){
	  var fileTarget = $('.filebox .upload-hidden');

	  fileTarget.on('change', function(){  // 값이 변경되면
	    if(window.FileReader){  // modern browser
	      var filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
	  });
	}); 
</script>

<style>

/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap');


#title{
	width:800px;	
	height:40px;
	margin-bottom: 10px;
	font-size:15px;
	margin-top:-20px;
	border: 2px solid #EEEEEE;
	border-radius:5px;
  	padding: 0 0 0 10px;
}

#content{
	width:800px;
	height:400px;
	font-size:15px;
	border: 2px solid #EEEEEE;
	border-radius:5px;
  	padding: 10px 0 0 10px;
}

.all{
	position: absolute;
  left: 50%;
  transform: translateX(-50%);
}


.writeBt1 {
	background : #d1cec3;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:#7e7e7e;
	text-decoration:none;

}


.writeBt3{
	background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:#7e7e7e;
	}
	
	
	


#file {

	background : #FFE699;
	border : none;
	width : 100px;
	height : 35px;
	font-size:15px;
	border-radius: 12px;
	font-weight: bold ;
	color:white;
	text-decoration:none;
	float:right;
	margin-right:10px;

}

#bottom{
	display:flex;
    justify-content: center;
    margin-top:20px;
}

#top{
	margin-bottom:20px;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  width:80px;
  text-align: center;
}

.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;  /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
  width:680px;
}



</style>

</head>
<body>
<div class="wrapper">

<div class = "all">

<div id = "top" style="font-size :24px; font-weight:bold;">글 쓰기</div>


<form name="writeForm" action="write" method="post" onsubmit="return formCheck()" enctype="multipart/form-data">
	<table class="boardWrite">
	<tr>
		
		<td>
			<input type="text" id="title" name="title" class="boardSubject" placeholder="제목을 입력해 주세요."/>
			<input type="hidden" id="userId" name="userId" value="${userId}" />
			<input type="hidden" id="writerNickname" name="writerNickname" value="${nickname}" />
		</td>
	</tr>
	<tr>
		
		<td><textarea id="content" name="content" class="boardContent" placeholder="내용을 입력해 주세요."></textarea></td>
	</tr>
	<tr>
		
		<td>
			<div class="filebox">
			  <input class="upload-name" value="파일선택" disabled="disabled">
			
			  <label for="file2">업로드</label> 
			  <input type="file" id="file2" name="file" class="upload-hidden"> 
			</div>

<!-- 			<input type="file" id="file2" name="file" multiple/> -->
		</td>
	</tr>

	<tr>
	
	<td>
	
	<div id="bottom">
		<input type="reset" value="취소" class="writeBt1" style="margin-right:5px;"/>
		<input type="submit" value="확인" class="writeBt3" style="margin-right:5px;"/>
	</div>

	
	</td>
	
	</tr>
	
	
	</table>
</form>
</div>
</div>
</body>
</html>
