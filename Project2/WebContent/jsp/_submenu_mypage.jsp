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
	<p> !! 여기에 중간 제목 작성 !!</p>
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
				!! 여기에 본문을 작성 !!
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>