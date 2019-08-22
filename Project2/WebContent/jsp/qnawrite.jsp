<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page = "topmenu.jsp"></jsp:include>
	
	<header>
		이곳은 문의 게시글 작성 페이지	
		<h2>${sid } 반갑다</h2>
	</header>
	<article>
		<textarea name="title" id="title" placeholder="제목을 입력해주세요"></textarea>
		<textarea name="content" id="content" placeholder="내용을 입력해주세요"></textarea>
	</article>
</body>
</html>