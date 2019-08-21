<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>study room reservation</title>
</head>
<body>
	<jsp:include page = "topmenu.jsp"></jsp:include>

<section id="main" class="wrapper style1">
<header class="major">
	<h2>관리자메뉴</h2>
	<p>예약관리</p>
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
				
				<table>
					<tr>
						<th>회원아이디</th>
						<th>이용 날짜</th>
						<th>시간</th>
						<th>방 이름</th>
						<th>상태</th>
					</tr>
					<c:forEach items="${list}" var="dto">
						<tr onclick = "location.href='ReservationContentsAdmin.do?rno=${dto.rno}'">
							<td>${dto.id}</td>
							<td>${dto.usedate}</td>
							<td>${dto.starttime} ~ ${dto.endtime}</td>
							<td>${dto.rname}</td>
							<td><c:if test = "${dto.status==1}">
								이용 완료
								</c:if>
								<c:if test = "${dto.status==0}">
								예약 취소
								</c:if>
								<c:if test = "${dto.status==null}">
								예약 완료
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</section>
</body>
</html>