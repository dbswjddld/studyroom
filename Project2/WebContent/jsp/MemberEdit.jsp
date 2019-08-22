<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "topmenu.jsp"></jsp:include>
<section id="main" class="wrapper style1">
<header class="major">
	<h2>마이페이지</h2>
	<p> 회원정보수정</p>
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
				<div align = "center">
	<jsp:include page = "topmenu.jsp"></jsp:include>
	<h3>회원가입</h3>
	<form action = "MemberEdit.do" method="post" name = "frm" onsubmit = "return formCheck()">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디 *</th>
				<td width = "400">
					<input type = "text" name = "id" value = "${mid }" readonly="readonly">
					<input type = "hidden" name = "chk" >
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 *</th>
				<td><input type = "text" name = "pw"></td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인 *</th>
				<td><input type = "text" name = "pw"></td>
			</tr>			
			<tr>
				<th>이메일 *</th>
				<td><input type = "text" name = "email" value = "${result.email }">
				입력한 이메일은 ID 또는 PW 찾을때 이용됩니다.<br>
				이메일로 문의사항을 받아보시겠습니까?<input type="checkbox" id="good" name="name"><label for="good"></label></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type = "text" name = "tel" value = "${reslut.tel }"></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "회원정보수정" > &nbsp;&nbsp;
		<input type = "button" value = "취소" onclick = "location.href = 'index.jsp'">
	</form>
	</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>