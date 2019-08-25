<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>

<!DOCTYPE html>


<html>
<head>
	<meta charset="UTF-8">
	<title>study room reservation</title>
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	$(document).ready(function(){
		document.getElementById("date").min = new Date().toISOString().substring(0, 10); // 전날 선택하지 못하게 (최솟값 오늘)
		document.getElementById("date").value = new Date().toISOString().substring(0, 10); // 달력 디폴트를 오늘로 설정
		
		date_change();
		
		/* 
		-- rnum(방코드) rname id usedate starttime endtime rno(예약번호) status reqdate
		INSERT INTO reservation (rnum, rname, id, usedate, starttime, endtime, rno, status, reqdate)
		VALUES (2, '6인실', '1234', to_date('2019-08-23','YYYY-MM-DD'), 
				to_timestamp('9:00','HH24:MI'), to_timestamp('10:00','HH24:MI'),(select max(rno) from reservation)+1, null, sysdate);
		 */
	})
	
	function date_change(){
		var input = $("#date").val(); // 입력한 날짜
		$(".date_select").html(input); // 우측에 날짜 출력 (YYYY-MM-DD)
				
		// 날짜 선택 안했을 때 (x 눌렀을 때)
		if(input == ""){
			console.log("날짜를 선택하세요");
		}
	}
	</script>
	<style>
	.roomlist{
		border : 1px solid gray;
		margin : 5px;
	}
	</style>
</head>
<body>
	<jsp:include page = "topmenu.jsp"></jsp:include>
</body>

<section id="main" class="wrapper style1">
	<header class="major">
		<h2>예약하기</h2>
	</header>
	<div class="container">
	<div class = "row">
		<!-- 왼쪽 달력 나온느 부분 -->
		<div class = "3u">
			<input type = "Date" name = "date" id = "date" onchange = "date_change()">
		</div>
		
		<!-- 오른쪽 방 정보 -->
		<div class = "9u">
			<!-- 선택한 날짜 출력 -->
			<div class = "date_select" align = "center"></div>
			<br>
			
			<!-- 방 정보 출력 -->
			<c:forEach items="${room}" var="room">
				<div class = "roomlist">
					<h2>${room.rname}</h2>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
</section>
</html>