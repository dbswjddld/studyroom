<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>^-^</title>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1></h1>
	</header>
	<div class = "contentbox">
<%
	out.print("<script>");
	if((int)request.getAttribute("result") == 1)
		out.print("alert('회원가입 성공');");
	else 
		out.print("alert('회원가입 실패');");
	out.print("window.open('index.jsp','_self');");
	out.print("</script>");
%>
	</div>
</body>
</html>