<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h3>회원목록</h3>
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
<!-- 	<div class = "contentboxRight">
	<form>
		<select name="subjects" style = "width:100px;" >
			<option value="1" selected>검색조건</option>
			<option value="2">아이디</option>
			<option value="3">이메일</option>
			<option value="4">연락처</option>
			<option value="5">전체</option>
		</select>
	</form> -->
	<div class = "contentboxRight">
	<form action = "DeptListPagingServ" method="post">
			<input type="hidden" name="action" value="list"/>
		    <input type="hidden" name="p" value="1"/>
			아이디<input type="text" name="memberId" style = "width:100px;">
			이메일<input type="text" name="memberEmail" style = "width:100px;">
			연락처<input type="text" name="memberTel" style = "width:100px;">
			등급<input type="text" name="memberGrant" style = "width:100px;">
			<input type="submit" value="검색"/><br/>
	</form><br>
	</div>
	<div class = "contentbox" align = "center">
		<form name="frm" id="frm" action="DeptListPagingServ">
			<input type="hidden" name="list">
			<table id="list" border="1">
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
			<div></div>
			</form>
			</div>
			
	<my:paging jsfunc="doList" paging="${paging}"/>
	<script>
	function doList(p) {
		document.searchFrm.p.value = p;
		document.searchFrm.submit();
	}
	</script>
</body>
</html>