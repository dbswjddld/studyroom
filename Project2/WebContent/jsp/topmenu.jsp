<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
    <script src="js/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-layers.min.js"></script>
    <script src="js/init.js"></script>
    
    <link rel="stylesheet" href="css/skel.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style-xlarge.css">
    <link rel="stylesheet" href="css/topmenu-style.css">
    
    <link rel="stylesheet" href="../css/skel.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/style-xlarge.css">
    <link rel="stylesheet" href="../css/topmenu-style.css">
</head>
<body id="top">
        <header id="header" class="skel-layers-fixed">
            <h1><a href="Index.do">HOME</a></h1>
            <nav id="topMenu">
                <ul>
                    <li class="topMenuLi"><a href="ReservationPage.do">예약하기</a></li>
                    <li class="topMenuLi"><a href="Qna.do">문의게시판</a></li>	<!-- 20190820 16:31 곽동우 -->
                    <li class="topMenuLi"><a href="#">마이페이지</a>
                    	<ul class = "submenu">
                    		<li><a href = "MyReservation.do">예약 내역</a></li>
                    		<li><a href = "#">내 문의 내역</a></li>
                    		<li><a href = "MemberEditLogin.do">회원 정보 수정</a></li>
                    	</ul>
                    </li>
                    <li class="topMenuLi"><a href="#">이용안내</a></li>
                    <li class="topMenuLi"><a href="#">관리자메뉴</a>
                    	<ul class = "submenu">
                    		<li><a href = "#">회원 목록</a></li>
                    		<li><a href = "ReservationAdmin.do">예약 관리</a></li>
                    		<li><a href = "#">스터디룸 관리</a></li>
                    	</ul>
                    </li>
                    <c:if test = "${mid == null }">
                    <li class="topMenuLi"><a href="MemberLogin.do">로그인</a></li>
                    <li class="topMenuLi"><a href="Logout.do">회원가입</a></li>
                    </c:if>
                    <c:if test = "${mid != null }">
                    <li class="topMenuLi"><a href="MemberJoin.do">로그아웃</a></li>
                    </c:if>
                </ul>
            </nav>
        </header>
    
</body>
</html>