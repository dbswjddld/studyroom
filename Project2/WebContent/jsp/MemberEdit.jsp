<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
   <script>
   $(document).ready(function(){
      // 체크박스 value Y 또는 N으로 설정
      var x = "${result.emailres}"; // Y 또는 N
      if(x == 'Y') {
    	  $("#goodyes").attr("checked", true);
      } else {
    	  $("#goodno").attr("checked", true);
      }
   });
   </script>
</head>
<body>
<jsp:include page = "topmenu.jsp"></jsp:include>
<section id="main" class="wrapper style1">
<header class="major">
	<h2>마이페이지</h2>
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
				<div align = "center">
	<jsp:include page = "topmenu.jsp"></jsp:include>
	<h3>회원정보수정</h3>
	<form action = "MemberEdit.do" method="post" name = "frm">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디 *</th>
				<td width = "400">
					<input type = "text" name = "id" value = "${result.id }" readonly="readonly">
					<input type = "hidden" name = "chk" >
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 *</th>
				<td><input type = "password" name = "pw" value = "${result.pw }"></td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인 *</th>
				<td><input type = "password" name = "pw" value = "${result.pw }"></td>
			</tr>			
			<tr>
				<th>이메일 *</th>
				<td><input type = "text" name = "email" value = "${result.email }">
				입력한 이메일은 ID 또는 PW 찾을때 이용됩니다.<br>
				이메일로 문의사항을 받아보시겠습니까?
				<input type="radio" id="goodyes" name="emailres" value = "Y">Yes<label for="goodyes"></label>
				<input type="radio" id="goodno" name="emailres" value = "N">NO<label for="goodno"></label></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type = "text" name = "tel" value = "${result.tel }"></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "회원정보수정" > &nbsp;&nbsp;
		<input type = "button" value = "회원탈퇴" onclick = "location.href = 'MemberWithdrawal.do?id=${result.id}'">
	</form>
	</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>