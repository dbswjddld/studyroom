<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!--tagdir :(태그 경로)에 있는 태그를 쓰겠다
	prefic :태그 경로를 지칭함 -->
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
	td,th {
		padding :10px 30px;
	}
	select {width : 200px;}
	</style>
	
	<script src = "js/jquery-3.4.1.js"></script>
	<script>
	$(function(){
		$("#btn").on("click", search);
		optionChange();
	});
	
	// 검색조건을 바꾸었을 때 실행할 함수
	function optionChange(){
		var option = $("#searchOpt").val();
		if(option == 'id'){ // 검색조건 아이디 선택
			$("#show").html($("<input type = 'text'>").attr("placeholder", "검색할 아이디 입력"));
		} else if (option == 'usedate'){
			$("#show").html($("<input type = 'date'>").val(new Date().toISOString().substring(0, 10)));
		} else if (option == 'rname'){
			$("#show").html($("<input type = 'text'>").attr("placeholder", "검색할 방 이름 입력"));
		} else if (option == 'status'){
			$("#show").html($("<input type = 'text'>").attr("placeholder", "검색할 방 상태 입력"));
		}
	}
	
	// 검색 버튼 클릭
	function search(){
		var value = $("#show").children().eq(0).val()
		if($("#searchOpt").val() == 'usedate')
			var value = value.substr(2,2) + "/" + value.substr(5,2) + "/" + value.substr(8,2);
			// 날짜를 검색하는경우, 날짜 양식을 맞춰야한다.
			//select * from reservation where usedate like '%19/08/29%';
		$("#searchVal").val(value);
		$("#searchFrm").submit();
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
	<div class = "contentboxRight" align = "center">
		<!-- 검색 폼 -->
		<form name = "searchFrm" id = "searchFrm" action = "ReservationAdmin.do" method = "post">
			<input type = "hidden" name = "searchVal" id = "searchVal"> <!-- 검색 내용 -->
			<input type = "hidden" id = "p" name = "p"> <!-- 페이지 번호 -->
			검색 조건 : 
			<select name = "searchOpt" id = "searchOpt" onchange = "optionChange()"> <!-- 검색 옵션 -->
				<option value = "id">아이디</option>
				<option value = "usedate">이용날짜</option>
				<option value = "rname">스터디룸</option>
				<option value = "status">예약상태</option>
			</select>
			<div id = "show"></div>
			<input type = "submit" value = "검색" id = "btn">
		</form>
		<br><hr><br>
	
		<table border = "1">
			<tr>
				<th>예약번호</th>
				<th>회원아이디</th>
				<th>이용 날짜</th>
				<th>시간</th>
				<th>방 이름</th>
				<th>상태</th>
			</tr>
			
			<c:forEach items="${list}" var="dto">
			<tr onclick = "location.href='ReservationContentsAdmin.do?rno=${dto.rno}'">
				<td>${dto.rno}</td>
				<td>${dto.id}</td>
				<td>${dto.usedate}</td>
				<td>${dto.starttime} ~ ${dto.endtime}</td>
				<td>${dto.rname}</td>
				<td>${dto.status}</td>
			</tr>
			</c:forEach>
		</table>
		
		<br><br>
		
		<!-- 페이징 -->
		<my:yjPaging jsfunc="doList" paging="${paging}"/>
		<script>
		function doList(p) {
			$("#p").val(p); // 검색폼에 페이지 값 넣기
			$("#searchVal").val($("#show").children().eq(0).val("")); // 검색값 ""으로 세팅
			$("#searchFrm").submit(); // 검색폼 실행 (DeptListPagingServ)
		}
		</script>
	</div>
</body>
<style>
select { width : 100px; }
#show { width :200px; display : inline-block; }
</style>
</html>