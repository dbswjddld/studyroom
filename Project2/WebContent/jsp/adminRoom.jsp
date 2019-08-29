<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
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
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>관리자 페이지</h1>
		<h3>스터디룸관리</h3>
	</header>
	<div class = "contentboxLeft">
		<nav class = "sidemenu">
			<ul>
				<li><a href="MemberList.do">회원목록</a></li>
				<li><a href="ReservationAdmin.do">예약관리</a></li>
				<li><a href="Studyroom.do">스터디룸 관리</a></li>
			</ul>
		</nav>
	</div>
	<div class = "contentboxRight" align = "center">
		<h3>스터디룸목록</h3>
		
		<button>스터디룸등록하기</button>
	</div>
</body>
</html>