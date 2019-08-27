<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>^-^</title><style>
	.contentboxLeft {
		float :left;
		width : 200px; /* 왼쪽 사이드바 너비 */
		padding :10px;
	}
	.contentboxRight {
		float :left;
		width : 1000px; /* 본문 너비 */
		padding :15px;
	}
	/* 왼쪽 사이드바와 본문 너비의 합은 1200이 되어야 한다 */
	.contentboxLeft > .sidemenu>ul>li {
		width :100%;
	}
	</style>
	<script>
	// 아이디 또는 비밀번호가 틀렸을때 알람 띄우기
	function fail(result){
		if (result!=null)
			alert('아이디 또는 비밀번호가 틀렸습니다');
	}
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>마이 페이지</h1>
		<h3>예약 내역</h3>
	</header>
	<div class = "contentboxLeft">
		<nav class = "sidemenu">
			<ul>
				<li><a href="MyReservation.do">예약 내역</a></li>
				<li><a href="MyQna.do">내 문의 내역</a></li>
				<li><a href="MemberEditLogin.do">회원 정보 수정</a></li>
			</ul>
		</nav>
	</div>
	<div class = "contentboxRight" align = "center">
		<form action = "MemberEditFrm.do" method="post" name = "frm">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디</th>
				<td width = "200">
					<input type = "text" name = "id" value = "${mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type = "password" name = "pw" required></td>
			</tr>
		</table>
		<br>
		
		<input type = "submit" value = "수정"> &nbsp;&nbsp;
	</form>
	</div>
</body>
</html>