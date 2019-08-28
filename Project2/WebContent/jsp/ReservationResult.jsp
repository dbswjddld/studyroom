<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src = "js/jquery-3.4.1.js"></script>
	<script>
	$(function(){
		var result = ${result};
		if(result == 1){
			alert("예약 성공!");
			location.replace("MyReservation.do");
		} else {
			alert("예약 실패");
			location.replace("ReservationPage.do");
		}
	})
	</script>
</head>
<body>
</body>
</html>