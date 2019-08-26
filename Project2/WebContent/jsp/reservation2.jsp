<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
<jsp:include page = "topmenu.jsp"></jsp:include>
<section id="main" class="wrapper style1">
	<header class="major">
		<h2>예약하기</h2>
	</header>
	<div class="container" align = "center">
		<h1>${dto.rname}</h1>
		<h1>${dto.usedate}</h1>
		<form>
			시작 시간 : 
			<input type = "button" value = "이전 페이지로 " onclick = "history.back()">
			<input type = "submit" value = "예약하기">
		</form>
	</div>
</section>

</body>
</html>