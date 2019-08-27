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
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>���� ������</h1>
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
		<h3>���������� Ż��Ǿ����ϴ�.</h3>
	</div>
</body>
</html>