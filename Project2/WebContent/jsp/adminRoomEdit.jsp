<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 - (스터디룸수정)</title>
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
		function roomDel(n){
			var form = document.roominfo;
			form.action="AdminRoomDel.do";
			var check = confirm("정말 삭제하시겠습니까?");
			if(!check){
				return false;
			}
			form.submit();
		}
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>관리자 페이지</h1>
		<h3>스터디룸 수정</h3>
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
		<form id="roominfo" name="roominfo" action="AdminRoomUpdate.do">
			<input type="hidden" id="rnum" name="rnum" value="${dto.rnum}">
			<table id="roominfotb">
				<tr><td>이름</td><td><input id="rname" name="rname" type="text" placeholder="방이름을 적어주세요" value="${dto.rname}"></td></tr>
				<tr><td>첨부파일(보류)</td><td><input type="file" accept=".jpg, .png"></td></tr>
				<tr><td>설명</td><td><textarea id="rinfo" name="rinfo" placeholder="방에대한 설명을 적어주세요(한글100글자 이내)">${dto.rinfo}</textarea></td></tr>
			</table>
			<button type="submit">&nbsp;수정&nbsp;</button>
			<button type="button" onclick=roomDel(${dto.rnum})>&nbsp;삭제&nbsp;</button>
			<button onclick="location.href='Studyroom.do'">목록</button>
		</form>
	</div>
</body>
</html>