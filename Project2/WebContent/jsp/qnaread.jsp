<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 20190819 17:50 곽동우 문의게시판 첫화면 -->
	<jsp:include page = "topmenu.jsp"></jsp:include>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
/*	
	$(document).ready(function (){
			var requestPage = "${pageContext.request.contextPath}/FController";
			$.ajax({
				url: { action: "/Index.do"}
			})
		}); //end	
*/

$(function() {
    $("#requestBtn").on("click", function() {
        $.ajax({
        	url : "QnaRead.do",
        	data : { bno : 1 },
        	dataType: "json",
        	success: function (result) {
        		console.log(result);
        	}
        })
        .done(function() {
            alert("요청 성공");
        })
        .fail(function() {
            alert("요청 실패");
        })
        .always(function() {
            alert("요청 완료");
        });
    });
});
	</script>
</head>
<body>
	<header class="major"></header>
	<div align="center">
	
		<h2 id="title">제목 :${dto.bno }</h2><h4>작성자:${dto.id }</h4>
		<h6>작성일:<fmt:formatDate value="${dto.bdate}" pattern="yyyy.MM.dd HH:mm:ss" /></h6>
		<div>
			<hr align="center" width="30%">
			<h4 id="contents">${dto.content }</h4>
		</div>
		<!-- 댓글추가 --><hr>댓글자리<br>
		<button type="button" id="requestBtn">테스트</button>
	</div>
</body>
</html>