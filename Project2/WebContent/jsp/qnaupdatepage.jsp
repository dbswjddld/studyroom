<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 20190823 곽동우 문의글 수정폼 -->

<title>문의글수정</title>
<script>
	function bWrite(){
		var form = document.frm;
		var subject = form.subject.value;
		var content = form.content.value;
		
		if(subject == ""){
			alert("제목을 입력하세요")
			return false;
		}else if(content == ""){
			alert("내용을 입력하세요")
			return false;
		}
		
		form.submit();
	}
	
	
	function captureReturnKey(e) {	//text창 엔터키 자동submit 막아줌
	    if(e.keyCode==13 && e.srcElement.type != 'textarea')
	    return false;
	}


</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		이곳은 문의 게시글 <b>수정</b> 페이지
		<h3>작성자:${dto.id } 작성번호:${dto.bno }</h3>
	</header>
	<div class = "contentbox">
		<article>
		<form id="frm" name="frm" action="QnaUpdate.do" method="post">
			<input type="hidden" id="id" name="id" value="${dto.id }">
			<input type="hidden" name="bno" id="bno" value="${dto.bno }">
			<input type="text" name="subject" id="subject" onkeydown="return captureReturnKey(event)" value="${dto.subject }" placeholder="제목을 입력해주세요">
			<textarea name="content" id="content" rows="10" placeholder="내용을 입력해주세요">${dto.content }</textarea>
			<button type="button" onclick="bWrite()">등록</button>
			<button type="button" onclick="location.href='Qna.do'">취소</button>
		</form>
	</article>
	</div>
</body>
</html>