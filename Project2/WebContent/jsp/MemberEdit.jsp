<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
<jsp:include page = "topmenu.jsp"></jsp:include>
<section id="main" class="wrapper style1">
<header class="major">
	<h2>����������</h2>
</header>
	<div class="container">
		<div class="row">
			<div class="3u">
				<section>
					<ul class="alt">
						<li><a href="MyReservation.do">���� ����</a></li>
						<li><a href="#">�� ���� ����</a></li>
						<li><a href="#">ȸ�� ���� ����</a></li>
					</ul>
				</section>
			</div>
			<div class="9u skel-cell-important">
				<div align = "center">
	<jsp:include page = "topmenu.jsp"></jsp:include>
	<h3>ȸ����������</h3>
	<form action = "MemberEdit.do" method="post" name = "frm">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">���̵� *</th>
				<td width = "400">
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
				�̸��Ϸ� ���ǻ����� �޾ƺ��ðڽ��ϱ�?<input type="checkbox" id="good" name="emailres" value = "Y">
				<label for="good"></label></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type = "text" name = "tel" value = "${result.tel }"></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "ȸ����������" > &nbsp;&nbsp;
		<input type = "button" value = "ȸ��Ż��" onclick = "location.href = 'index.jsp'">
	</form>
	</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>