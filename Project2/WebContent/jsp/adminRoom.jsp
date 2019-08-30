<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	$(function (){
		$("#roominsert").click(roominsert)
		
		function roominsert(){
			location.href = "adminRoomInsertPage.do"
		}
	});
	
	
	/*------------
	방 눌렀을때
	------------*/
	function formSubmit(n){
		var form = document.frm;
		form.rnum.value = n;
		form.submit();
	}
	
	</script>
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
		<form id="frm" name="frm" action="adminRoomEditPage.do">
			<input type="hidden" name="rnum">
			<table>
				<c:forEach items="${list }" var="dto">
					<tr align="center" onmouseover="this.style.background='#bbbb'"
						onmouseout="this.style.background='white'"
						onclick="formSubmit(${dto.rnum})">
							<td>${dto.rnum}</td>
							<td>${dto.rname }</td>
							<td>${dto.rinfo }</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<button id="roominsert">스터디룸등록하기</button>
	</div>
</body>
</html>