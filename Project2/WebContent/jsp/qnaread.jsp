<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 20190819 17:50 곽동우 문의게시판 첫화면 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	window.onload = function(){		//db읽어온 텍스트 \n  -> <br> 바꿈
			var text = document.getElementById("content");
			var result = text.value.replace(/(\n|\r\n)/g, '<br>');
			document.getElementById("content1").innerHTML = result
	};

	
	function qnaUpdate(n){
		var form = document.frm;
		form.bno.value = n;
		form.action="QnaUpdatePage.do";
		form.submit();
	}
	
	function qnaDel(n){
		var form = document.frm;
		form.bno.value = n;		// form. 은 name
		form.action="QnaDel.do";
		var check = confirm(n+"정말 삭제하시겠습니까?");
		if(!check){
			return false;
		}
		form.submit();
	}

	
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
	<jsp:include page = "topmenu.jsp"></jsp:include>

	<header class="major"></header>
	<div align="center">
		<form id="frm" name="frm">
			<h2 id="title">제목 :${dto.subject }
				<input type="hidden" name="subject" id="subject" value="${dto.subject }">
				<font size="3">문의번호:${dto.bno }</font></h2>
				<input type="hidden" name="bno" id="bno" value="${dto.bno }">	
			<h4>작성자:${dto.id }</h4>
			<input type="hidden" name="id" id="id" value="${dto.id }">
			<h6>작성일:<fmt:formatDate value="${dto.bdate}" pattern="yyyy.MM.dd HH:mm:ss" /></h6>
			<div>
				<hr align="center" width="30%">
				<h4 id="content1">${dto.content }</h4>
				<input type="hidden" name="content" id="content" value="${dto.content }">
			</div>
			<!-- 댓글추가 --><hr>댓글자리<br>
			<button type="button" id="requestBtn">테스트</button>
			<button type="button" onclick="qnaUpdate(${dto.bno})">수정</button>
			<button type="button" onclick="qnaDel(${dto.bno})">삭제</button>
			<button type="button" onclick="location.href='Qna.do'">목록</button>	<!-- 게시글 들어오기 전 페이지로이동 -->
		</form>
	</div>
</body>
</html>