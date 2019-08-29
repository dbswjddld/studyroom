<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<style>
	.contentboxLeft {
		float :left;
		width : 200px; /* ���� ���̵�� �ʺ� */
		padding :10px;
	}
	.contentboxRight {
		float :left;
		width : 1000px; /* ���� �ʺ� */
		padding :15px;
	}
	/* ���� ���̵�ٿ� ���� �ʺ��� ���� 1200�� �Ǿ�� �Ѵ� */
	.contentboxLeft > .sidemenu>ul>li {
		width :100%;
	}
	</style>
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
   <script>
   $(document).ready(function(){
      // üũ�ڽ� value Y �Ǵ� N���� ����
      var x = "${result.emailres}"; // Y �Ǵ� N
      if(x == 'Y') {
    	  $("#goodyes").attr("checked", true);
      } else {
    	  $("#goodno").attr("checked", true);
      }
   });
   </script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>���� ������</h1>
		<h3>ȸ�� ���� ����</h3>
	</header>
	<div class = "contentboxLeft">
		<nav class = "sidemenu">
			<ul>
				<li><a href="MyReservation.do">���� ����</a></li>
				<li><a href="MyQna.do">�� ���� ����</a></li>
				<li><a href="MemberEditLogin.do">ȸ�� ���� ����</a></li>
			</ul>
		</nav>
	</div>
	<div class = "contentboxRight" align = "center">
	<form action = "MemberEdit.do" method="post" name = "frm">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "280">���̵� *</th>
				<td width = "500">
					<input type = "text" name = "id" value = "${result.id }" readonly="readonly">
					<input type = "hidden" name = "chk" >
				</td>
			</tr>
			<tr>
				<th>���ο� ��й�ȣ *</th>
				<td><input type = "password" name = "pw" value = "${result.pw }"></td>
			</tr>
			<tr>
				<th>���ο� ��й�ȣ Ȯ�� *</th>
				<td><input type = "password" name = "pw" value = "${result.pw }"></td>
			</tr>			
			<tr>
				<th>�̸��� *</th>
				<td><input type = "text" name = "email" value = "${result.email }">
				�Է��� �̸����� ID �Ǵ� PW ã���� �̿�˴ϴ�.<br>
				�̸��Ϸ� ���ǻ����� �޾ƺ��ðڽ��ϱ�?
				<input type="radio" id="goodyes" name="emailres" value = "Y">Yes<label for="goodyes"></label>
				<input type="radio" id="goodno" name="emailres" value = "N">NO<label for="goodno"></label></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type = "text" name = "tel" value = "${result.tel }"></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "ȸ����������" > &nbsp;&nbsp;
		<input type = "button" value = "ȸ��Ż��" onclick = "location.href = 'MemberWithdrawal.do?id=${result.id}'">
	</form>
	</div>
</body>
</html>