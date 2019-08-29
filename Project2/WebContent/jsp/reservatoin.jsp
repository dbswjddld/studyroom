<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>

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
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	$(document).ready(function(){
		document.getElementById("date").min = new Date().toISOString().substring(0, 10); // 전날 선택하지 못하게 (최솟값 오늘)
		document.getElementById("date").value = new Date().toISOString().substring(0, 10); // 달력 디폴트를 오늘로 설정
		
		date_change();
		
		select1();
		
		// 시작시간 9시부터 20시까지 선택가능
		for(var i = 9; i < 21; i++){
			$option = $("<option>").val(i).text(i + "시");
			$("#start").append($option);
		}
		select_end();
		})
	
	// 방 선택 화면
	function select1(){
		$(".roominfo").show();
		$(".time_select").hide();
	}
	// 시간 선택 화면
	function select2(){
		$(".roominfo").hide();
		$(".time_select").show();
	}
	
	// 우측화면에 날짜 출력
	function date_change(){
		var input = $("#date").val(); // 입력한 날짜
		$(".date_select").html(input); // 우측에 날짜 출력 (YYYY-MM-DD)
		select1();
	}
	
	// 방을 선택했을 때
	function select(num, name){
		// 날짜 선택 안했을 때 (x 눌렀을 때)
		if($("#date").val() == "") {
			alert("날짜를 선택하세요");
		} else {
			$("#rnum").val(num);
			$("#rname").val(name);
			$(".show").text(name);
			select2();
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
	
	// 예약하기 버튼 클릭
	function submitFunc(){
		var loginCheck = $("#id").val();
		if(loginCheck.length == 0) { // 로그인 안되어있을때 
			alert("로그인 해야합니다");
		} else {
			$("#starttime").val($("#start").val());
			$("#endtime").val($("#end").val())
			$("#frm").submit();
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
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>예약하기</h1>
	</header>
	<div class = "contentboxLeft">
		<!-- 왼쪽 달력 나온느 부분 -->
			<form id = "frm" action = "ReservationInsert.do" method = "post">
				<input type = "Date" name = "usedate" id = "date" onchange = "date_change()">
				<input type = "hidden" name = "rnum" id = "rnum">
				<input type = "hidden" name = "rname" id = "rname">
				<input type = "hidden" name = "starttime" id = "starttime">
				<input type = "hidden" name = "endtime" id = "endtime">
				<input type = "hidden" name = "id" id = "id" value = "${mid}">
			</form>
			<font size = "3">
			↑ 이용할 날짜를 선택 후<br>
			이용할 스터디룸 선택 →
			</font>
	</div>
	<div class = "contentboxRight">
			<!-- 선택한 날짜 출력 -->
			<div class = "date_select" align = "center"></div>
			<hr>
			
			<!-- 방 정보 출력 -->
			<div class = "roominfo">
			<c:forEach items="${room}" var="room">
				<div class = "roomlist" onclick = "select(${room.rnum}, '${room.rname}')">
					<h2>${room.rname}</h2>
					<span>${room.rinfo}</span>
				</div>
			</c:forEach>
			</div>
			
			<!-- 시간 선택 -->
			<div class = "time_select">
				<div class = "show"></div>
				시작 시간 : <select id = "start" onchange = "select_end()"></select><br>
				종료 시간 : <select id = "end"></select><br>
				<input type = "button" value = "이전 화면으로" onclick = "select1()">
				<input type = "button" value = "예약하기" onclick = "submitFunc()">
			</div>
	</div>
</html>