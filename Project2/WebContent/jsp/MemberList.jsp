<%@page import="co.yedam.studyroom.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.contentboxLeft {
	float: left;
	width: 200px; /* 왼쪽 사이드바 너비 */
	padding: 10px;
}

.contentboxRight {
	float: left;
	width: 1000px; /* 본문 너비 */
	padding: 15px;
}
/* 왼쪽 사이드바와 본문 너비의 합은 1200이 되어야 한다 */
.contentboxLeft>.sidemenu>ul>li {
	width: 100%;
}
</style>
</head>
<body>

	<jsp:include page="new_menuTop.jsp"></jsp:include>
	<header>
		<h1>관리자 페이지</h1>
		<h3>회원목록</h3>
	</header>
	<div class="contentboxLeft">
		<nav class="sidemenu">
			<ul>
				<li><a href="MemberList.do">회원목록</a></li>
				<li><a href="ReservationAdmin.do">예약관리</a></li>
				<li><a href="Studyroom.do">스터디룸 관리</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="contentboxRight" align = "center">
		<!-- 검색폼 -->
		<form action="MemberList.do" name ="frm" method="post">
			아이디<input type="text" name="id" style="width: 100px;" value = "${dto.id}"> &nbsp;
			이메일<input type="text" name="email" style="width: 100px;" value = "${dto.email}"> &nbsp;
			연락처<input type="text" name="tel" style="width: 100px;" value = "${dto.tel}"> &nbsp;
			등급<input type="text" name="grant" style="width: 100px;" value = "${dto.grant}"> &nbsp;&nbsp;
			<input type="submit" value="검색" /><br /> 
			<input type="hidden" name="p" value="1" />
		</form>
		<br>

		<!-- 결과 -->
		<div>
		<table id="list" border="1" width=900>
			<tr>
				<th width="20%">아이디</th>
				<th width="20%">이메일</th>
				<th width="20%">연락처</th>
				<th width="10%">등급</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<th>${dto.getId()}</th>
					<th>${dto.getEmail()}</th>
					<th>${dto.getTel()}</th>
					<th>${dto.getGrant()}</th>
				</tr>
			</c:forEach>
		</table>
		
		</div>
		<!-- 페이징 -->
		<my:paging jsfunc="doList" paging="${paging}" />
		<script>
			function doList(p) {
				document.frm.p.value = p;
				document.frm.submit();
			}
		</script>
	</div>
</body>
</html>