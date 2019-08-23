<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>^-^</title>
	<link href = "css/tableStyle.css" rel = "stylesheet">
	<script>
	// 아이디 또는 비밀번호가 틀렸을때 알람 띄우기
	function fail(result){
		if (result!=null)
			alert('아이디 또는 비밀번호가 틀렸습니다');
	}
	</script>
</head>
<body>
	<div align = "center">
	<jsp:include page = "topmenu.jsp"></jsp:include>
	</div>
<section id="main" class="wrapper style1">
<header class="major">
   <h2>마이페이지</h2>
   <p>회원관리</p>
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
				<div class = "resContents">
	<h3>회원정보수정</h3>
	<script>fail(${result})</script>
	<form action = "MemberEditFrm.do" method="post" name = "frm">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디</th>
				<td width = "200">
					<input type = "text" name = "id" value = "${mid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type = "password" name = "pw" required></td>
			</tr>
		</table>
		<br>
		
		<input type = "submit" value = "수정"> &nbsp;&nbsp;
		
	</form>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>