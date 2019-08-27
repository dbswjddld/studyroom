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
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1></h1>
	</header>
	<div class = "contentbox" align = "center">
		<script>
			console.log(${mid });
		</script>
		<c:if test = "${mid != null }">
			<div><h3> ${mid } 로그아웃 실패하였습니다.</h3></div>
		</c:if>
		<c:if test = "${mid == null }">
			<div><h3> 정상적으로 로그아웃 되었습니다.</h3></div>
		</c:if>
	</div>
</body>
</html>