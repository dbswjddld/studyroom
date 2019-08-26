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
		
		$(".time_select").hide();
		
		// 시작시간 9시부터 20시까지 선택가능
		for(var i = 9; i < 21; i++){
			$option = $("<option>").val(i).text(i + "시");
			$("#start").append($option);
		}
		select_end();
		
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
		$(".roominfo").show();
		$(".time_select").hide();
	}
	
	function select(num, name){
		// 날짜 선택 안했을 때 (x 눌렀을 때)
		if($("#date").val() == "") {
			alert("날짜를 선택하세요");
		} else {
			$("#rnum").val(num);
			$("#rname").val(name);
			$(".show").text(name);
			$(".roominfo").hide();
			$(".time_select").show();
		}
	}
	
	// 시작시간을 바꾸면 종료시간 바꾸기
	function select_end(){
		$("#end").empty();
		var start = $("#start").val();
		for(var i = parseInt(start) + 1; i <= 21; i++){
			$option = $("<option>").val(i).text(i + "시");
			$("#end").append($option);
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
			<form id = "frm" action = "ReservationPage2.do" method = "post">
				<input type = "Date" name = "usedate" id = "date" onchange = "date_change()">
				<input type = "hidden" name = "rnum" id = "rnum">
				<input type = "hidden" name = "rname" id = "rname">
			</form>
		</div>
		
		<!-- 오른쪽 방 정보 -->
		<div class = "9u">
			<!-- 선택한 날짜 출력 -->
			<div class = "date_select" align = "center"></div>
			<hr>
			
			<!-- 방 정보 출력 -->
			<div class = "roominfo">
			<c:forEach items="${room}" var="room">
				<div class = "roomlist" onclick = "select(${room.rnum}, '${room.rname}')">
					<h2>${room.rname}</h2>
				</div>
			</c:forEach>
			</div>
			
			<!-- 시간 선택 -->
			<div class = "time_select">
				<div class = "show"></div>
				시작 시간 : <select id = "start" onchange = "select_end()"></select><br>
				종료 시간 : <select id = "end"></select><br>
				
			</div>
		</div>
	</div>
	</div>
</section>
</html>