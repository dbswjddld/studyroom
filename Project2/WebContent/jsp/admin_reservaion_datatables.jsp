
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
	</style>
	
	<!--  [윤정 190821] datatables를 이용해서 관리자-예약내역 출력하기  -->
	<link rel = "stylesheet" href = "https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
	<script src = "https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src = "https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	
	<script>
	$(document).ready(function() {
	    $('#table').DataTable( {
	        "ajax": 'AdminReservationList'
	    } );
	} );
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
		<table id="table" class="display" style="width:100%">
        <thead>
            <tr>
                <th>방 이름</th>
                <th>회원 아이디</th>
                <th>이용 날짜</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>상태</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th>방 이름</th>
                <th>회원 아이디</th>
                <th>이용 날짜</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>상태</th>
            </tr>
        </tfoot>
    	</table>
	</div>
</body>
</html>