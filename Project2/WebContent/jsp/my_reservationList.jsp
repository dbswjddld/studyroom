<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
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
	<style>
	.myResList{
		width : 500px; height : 150px;
		border : solid 1px black;
		cursor : pointer;
	}
	</style>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	
	$(document).ready(function(){
		// 상세내역 - 예약취소 하고 다시 이 페이지로 넘어왔을 때 실행
		var result = "${cancelResult}";
		if(result == '1'){
			alert("예약이 취소되었습니다.");
		}else if(result == '0'){
			alert("예약 취소에 실패했습니다.");
		}
		
		// 검색해서 이 페이지로 왔을때, 해당 검색 select option이 selected되게
		var searchOpt = "${searchOpt}";
		if(searchOpt.length > 0)
			$("[value='" + searchOpt + "']").prop("selected", true);
	});
	
	// select로 검색 옵션 선택
	function listSearch(){
		$("#frm").submit();
		
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
	<div class = "contentboxRight">
			클릭시 세부정보를 확인할 수 있습니다.
			<form name = "frm" id = "frm" method = "post" action = "MyReservationSearch.do">
			<input type = "hidden" name = "id" value = "${mid}">
			<select name = "search" id = "search" onchange = "listSearch()">
				<option value = "전체">전체</option>
				<option value = "예약완료">예약 완료</option>
				<option value = "예약취소">예약 취소</option>
				<option value = "이용완료">이용 완료</option>
			</select>
			</form>
			<br>
			<c:forEach items="${list}" var="dto">
				<div class = "myResList" onclick = "location.href='ReservationContents.do?rno=${dto.rno}'">
					<h3>${dto.rname}</h3>
					${dto.usedate}<br>
					${dto.starttime}~${dto.endtime}<br>
					${dto.status}
				</div>
				<br>
			</c:forEach>
			</div>
</body>
</html>