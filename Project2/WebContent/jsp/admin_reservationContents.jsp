<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>study room reservation</title>
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
	.resContents{
		padding :10px;
	}
	</style>
	<style>
	.resContents{
		border : 1px solid gray;
	}
	</style>
	<script>
	function cancel(rno){
		var answer = confirm("예약을 취소하시겠습니까?");
		if(answer){ // 예약취소 확인버튼을 눌렀을 때
			var form = document.frm;
			form.action = "ReservationCancelAdmin.do";
			form.submit();
		}
	}
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>관리자 페이지</h1>
		<h3>예약 관리</h3>
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
	<div class = "contentboxRight">
		<div class = "resContents">
			<font size = "6">${dto.rname}</font><br>
			<b>이용 날짜: ${dto.usedate}</b><br>
			<b>이용 시간 : ${dto.starttime} ~ ${dto.endtime}</b><br>
			예약한 날짜 : ${dto.reqdate}<br>
			상태 : ${dto.status}
					
			<form name = "frm" method = "post">
				<c:if test = "${dto.status == '예약완료'}">	<!-- 예약완료 상태면 예약취소 버튼 보이게 -->
					<input type = "hidden" name = "rno" value = "${dto.rno}">
					<input type = "button" value = "예약취소" onclick = "cancel()">
				</c:if>
				<input type = "button" value = "목록" onclick = "history.back()">
			</form>
		</div>
	</div>
</body>
</html>