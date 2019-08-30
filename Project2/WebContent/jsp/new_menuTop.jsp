<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "css/mystyle.css" rel = "stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
    $(function(){
        $("nav > ul > li").mouseenter(function(){
            $(this).children(".submenu").stop().slideDown(300);
        });
        $("nav > ul > li").mouseleave(function(){
            $(this).children(".submenu").stop().slideUp(100);
        });
    });
    </script>
    <style>
    nav[id='topMenu']{
    	background-color:#e8f2fa;
    }
    </style>
</head>
<body>
    <nav id="topMenu">
        <ul class = "left">
        	<li><a href="Index.do">HOME</a></li>
            <li><a href="ReservationPage.do">예약하기</a></li>
                    
            <li><a href="Qna.do">문의게시판</a></li>	<!-- 20190820 16:31 곽동우 -->
                    
            <c:if test = "${mid != null }">
            <li><a href="#">마이페이지</a>
            	<ul class = "submenu">
                	<li><a href = "MyReservation.do">예약 내역</a></li>
            		<li><a href = "MyQna.do">내 문의 내역</a></li>
            		<li><a href = "MemberEditLogin.do">회원 정보 수정</a></li>
                </ul>
            </li>
            </c:if>
                    
            <li><a href="#">이용안내</a></li>
                    
            <!-- [190822 윤정] 관리자만 관리자메뉴 볼 수 있게-->
            <c:if test = "${mgrant == 'A'}">
            <li><a href="#">관리자메뉴</a>
               	<ul class = "submenu">
               		<li><a href = "MemberList.do">회원 목록</a></li>
               		<li><a href = "ReservationAdmin.do">예약 관리</a></li>
                	<li><a href = "Studyroom.do">스터디룸 관리</a></li>
              	</ul>
            </li>
        	</c:if>
        </ul>
        <ul class = "right">
            <c:if test = "${empty mid }"> 
            <li class = "topmenuRight"><a href="MemberLogin.do">로그인</button></a></li>
            <li class = "topmenuRight"><a href="MemberJoin.do">회원가입</a></li>
            </c:if> 
                    
            <c:if test = "${mid != null }"> 
            <li class = "topmenuRight"><a href="Logout.do">로그아웃</a></li>
            </c:if>
        </ul>
    </nav>
</body>
</html>