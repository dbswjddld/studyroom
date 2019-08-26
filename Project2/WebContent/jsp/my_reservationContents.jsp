<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	.resContents{
		border : 1px solid gray;
	}
	</style>
	<script>
	function cancel(rno){
		var answer = confirm("예약을 취소하시겠습니까?");
		if(answer){ // 예약취소 확인버튼을 눌렀을 때
			var form = document.frm;
			form.action = "ReservationCancel.do";
			form.submit();
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
						<li><a href="MemberEditLogin.do">회원 정보 수정</a></li>
					</ul>
				</section>
			</div>
			<div class="9u skel-cell-important">
				<div class = "resContents">
				
				<font size = "6">${dto.rname}</font><br>
				<b>이용 날짜: ${dto.usedate}</b><br>
				<b>이용 시간 : ${dto.starttime} ~ ${dto.endtime}</b><br>
				예약한 날짜 : ${dto.reqdate}<br>
				상태 :<c:if test = "${dto.status==1}">
					이용 완료
					</c:if>
					<c:if test = "${dto.status==0}">
					예약 취소
					</c:if>
					<c:if test = "${empty dto.status}">
					예약 완료<br>
					</c:if>
					<form name = "frm" method = "post">
						<c:if test = "${empty dto.status}">
							<input type = "hidden" name = "rno" value = "${dto.rno}">
							<input type = "button" value = "예약취소" onclick = "cancel()">
						</c:if>
						<input type = "button" value = "목록" onclick = "history.back()">
					</form>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>