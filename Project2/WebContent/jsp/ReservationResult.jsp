<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "js/jquery-3.4.1.js"></script>
	<script>
	$(function(){
		var result = ${result};
		console.log(result);
		if(result == 1)
			$(".show").text("예약 성공");
		else
			$(".show").text("예약 실패");
	})
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>예약 결과</h1>
	</header>
	<div class = "contentbox" align = "center">
		<h3 class = "show"></h3>
	</div>
</body>
</html>