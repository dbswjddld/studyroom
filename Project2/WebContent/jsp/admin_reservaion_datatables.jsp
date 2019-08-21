<!--  [윤정 190821] datatables를 이용해서 관리자-예약내역 출력하기  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>study room reservation</title>
	
	
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
	<jsp:include page = "topmenu.jsp"></jsp:include>

<section id="main" class="wrapper style1">
<header class="major">
	<h2>관리자메뉴</h2>
	<p>예약관리</p>
</header>
	<div class="container">
		<div class="row">
			<div class="3u">
				<section>
					<ul class="alt">
						<li><a href="#">회원목록</a></li>
						<li><a href="ReservationAdmin.do">예약관리</a></li>
						<li><a href="#">스터디룸 관리</a></li>
					</ul>
				</section>
			</div>
			<div class="9u skel-cell-important">
				
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
		</div>
	</div>
</section>
</body>
</html>