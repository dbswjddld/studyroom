<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<meta charset="UTF-8">
	<title>^-^</title>
	<link href = "css/tableStyle.css" rel = "stylesheet">
	<script>
	// 아이디 또는 비밀번호가 틀렸을때 알람 띄우기
	function fail(result){
		
		if (result!=null)
			alert('아이디 또는 비밀번호가 틀렸습니다.');
	}

	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>로그인</h1>
	</header>
	<div class = "contentbox" align = "center">
	<c:if test = "${login == null }">
	<script>fail(${result})</script>
	<form action = "MemberLoginOk.do" method="post" name = "frm" >
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디</th>
				<td width = "200">
					<input type = "text" name = "id" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type = "password" name = "pw" required></td>
			</tr>
		</table>
		<br>
		<input type = "submit" class="btn btn-outline-primary" value = "로그인"> &nbsp;&nbsp;
		<input type = "button" class="btn btn-outline-primary" value = "취소" onclick = "location.href='index.jsp'">
	</form>
	</c:if>
	</div>
</body>
</html>