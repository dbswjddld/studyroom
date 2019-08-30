<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
	select {width : 200px;}
	td,th {
		padding :10px 30px;
	}
	/* 테이블에 마우스 올리면 색상 바뀌게 */
	.list:hover{
		background-color : #e8f2fa;
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
		
		$("#btn").on("click", submitFunc);
		optionChange();
		
		// n건씩 출력 세팅
		var printNum = "${printNum}";
		if(printNum == 25){
			$("#print").find("option:eq(1)").prop("selected", true);
		} else if(printNum == 50){
			$("#print").find("option:eq(2)").prop("selected", true);
		} else {
			$("#print").find("option:eq(0)").prop("selected", true);
		}
		
		// 검색값 세팅
		var searchVal = "${searchVal}"
		$("#show").children().eq(0).val(searchVal);
		
		// 검색조건 세팅
		var searchOpt = "${searchOpt}";
		if(searchOpt == 'usedate'){
			$("#searchOpt").find("option:eq(2)").prop("selected", true);
			$("#show").html($("<input type = 'date' value = '" + searchVal + "'>"));
		} else if(searchOpt == 'rname'){
			$("#searchOpt").find("option:eq(1)").prop("selected", true);
		} else{
			$("#searchOpt").find("option:eq(0)").prop("selected", true);
		}
	});
	
	// 검색조건을 바꾸었을 때 실행할 함수
	function optionChange(){
		var option = $("#searchOpt").val();
		if (option == 'usedate'){
			$("#show").html($("<input type = 'date'>").val(new Date().toISOString().substring(0, 10)));
		} else if (option == 'rname'){
			$("#show").html($("<input type = 'text'>").attr("placeholder", "검색할 방 이름 입력"));
		} else {
			$("#show").html($("<input type = 'text'>").attr("placeholder", "검색할 예약 상태 입력"));
		}
	}
	
	function submitFunc(){
		$("#printVal").val($("#print").val()); // 출력개수
		var value = $("#show").children().eq(0).val();
		$("#searchVal").val(value); // 검색값
		$("#searchFrm").submit(); // 제출
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
		<form name = "searchFrm" id = "searchFrm" method = "post" method = "post" action = "MyReservation.do">
			<input type = "hidden" name = "printVal" id = "printVal">
			<input type = "hidden" id = "p" name = "p"> <!-- 페이지 번호 -->
			<input type = "hidden" name = "searchVal" id = "searchVal"> <!-- 검색 내용 -->
			<input type = "hidden" name = "id" value = "${mid}">
			<select name = "print " id = "print" onchange = "submitFunc()">
				<option value = "10">10건씩 보기</option>
				<option value = "25">25건씩 보기</option>
				<option value = "50">50건씩 보기</option>
			</select>
			<div style = "display:inline-block; width : 80px"></div>
			검색 조건 :  <!-- 검색 옵션 -->
			<select name = "searchOpt" id = "searchOpt" onchange = "optionChange()">
				<option value = "status">예약상태</option>
				<option value = "rname">스터디룸</option>
				<option value = "usedate">이용날짜</option>
			</select>
			<div id = "show"></div>
			<input type = "submit" value = "검색" id = "btn">
		</form>
		<br>
		클릭시 세부정보를 확인할 수 있습니다.
		<table border = "1">
			<tr>
				<th>예약번호</th>
				<th>이용 날짜</th>
				<th>시간</th>
				<th>방 이름</th>
				<th>상태</th>
			</tr>
			
			<c:forEach items="${list}" var="dto">
			<tr onclick = "location.href='ReservationContents.do?rno=${dto.rno}'" class = "list">
				<td>${dto.rno}</td>
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
			submitFunc();
		}
		</script>
	</div>
</body>
<style>
select { width : 100px; }
#show { width :200px; display : inline-block; }
</style>
</html>