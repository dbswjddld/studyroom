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
	<h2>관리자메뉴</h2>
	<p> !! 여기에 소제목 작성 !! </p>
</header>
	<div class="container">
		<div class="row">
			<div class="3u">
				<section>
					<ul class="alt">
						<li><a href="#">회원목록</a></li>
						<li><a href="ReservationAdmin.do">예약관리</a></li>
						<li><a href="#">스터디룸 관리</a></li>
					</ul>
				</section>
			</div>
			<div class="9u skel-cell-important">
			!! 여기에 본문 작성 !!
			</div>
		</div>
	</div>
</section>
</body>
</html>