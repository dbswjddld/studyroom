<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
		var result = ${cancelResult};
		if(result > 0){
			alert("예약이 취소되었습니다.");
		}else if(result == 0){
			alert("예약 취소에 실패했습니다.");
		}
	});
	
	function listSearch(){
		var op = document.getElementById("search").options.selectedIndex;
		if(op == 0){ // 전체
			location.href = "MyReservation.do";
		}else if(op == 1){ // 예약완료 
			location.href = "MyReservationSearch.do?option=null";
		}else if(op == 2){ // 예약취소
			location.href = "MyReservationSearch.do?option=0";
		}else if(op == 3){ // 이용 완료
			location.href = "MyReservationSearch.do?option=1";
		}
	}
	</script>
</head>
<body>
<jsp:include page = "topmenu.jsp"></jsp:include>
<section id="main" class="wrapper style1">
<header class="major">
	<h2>마이페이지</h2>
	<p>예약 내역</p>
</header>
	<div class="container">
		<div class="row">
			<div class="3u">
				<section>
					<ul class="alt">
						<li><a href="MyReservation.do">예약 내역</a></li>
						<li><a href="#">내 문의 내역</a></li>
						<li><a href="#">회원 정보 수정</a></li>
					</ul>
				</section>
			</div>
			<div class="9u skel-cell-important">
			클릭시 세부정보를 확인할 수 있습니다.
			<select id = "search">
				<option>전체</option>
				<option>예약 완료</option>
				<option>예약 취소</option>
				<option>이용 완료</option>
			</select>
			<input type = "button" value = "검색" onclick = "listSearch()">
			<br>
			<c:forEach items="${list}" var="dto">
				<div class = "myResList" onclick = "location.href='ReservationContents.do?rno=${dto.rno}'">
					<h3>${dto.rname}</h3>
					${dto.usedate}<br>
					${dto.starttime}~${dto.endtime}<br>
					<c:if test = "${dto.status==1}">
					이용 완료
					</c:if>
					<c:if test = "${dto.status==0}">
					예약 취소
					</c:if>
					<c:if test = "${dto.status==null}">
					예약 완료
					</c:if>
				</div>
				<br>
			</c:forEach>
			</div>
		</div>
	</div>
</section>
</body>
</html>