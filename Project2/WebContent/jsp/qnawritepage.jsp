<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 20190823 곽동우 문의글 쓰기폼 -->

<title>문의글작성</title>
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
	
</script>
</head>
<body>
	<jsp:include page = "topmenu.jsp"></jsp:include>
	
	<header>
		이곳은 문의 게시글 작성 페이지	
		<h2>${sid } 반갑다</h2>
	</header>
	<article>
		<form id="frm" name="frm" action="QnaWrite.do" method="post">
			<input type="hidden" id="id" name="id" value="${sid }">
			<textarea name="subject" id="subject" placeholder="제목을 입력해주세요"></textarea>
			<textarea name="content" id="content" placeholder="내용을 입력해주세요"></textarea>
			<button type="button" onclick="bWrite()">등록</button>
			<button type="button" onclick="location.href='Qna.do'">취소</button>
		</form>
	</article>
</body>
</html>