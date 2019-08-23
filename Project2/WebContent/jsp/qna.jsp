<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 20190820   11:14  > 20190822
	   곽동우
	  문의게시판 -->
	<script>
		function formSubmit(n){
			var form = document.frm;
			form.bno.value = n;
			form.submit();
		}
		
		function qnaWrite(id){
			//if(id != null){
				document.btn.action="QnaWritePage.do";
				document.btn.method="post"; 
								
				document.btn.sid.value = "dong";//테스트용 아이디 세션작업되면 "dong" 수정해야함
				
				document.btn.submit();
				
			//}else{
			//	alert("로그인 해야합니다")
			//}
		}
	</script>
</head>
<body>
	<jsp:include page = "topmenu.jsp"></jsp:include>
	
	<header class="major">
	문의게시판
	</header>
	
	<div align="center">
		<form name="frm" id="frm" action="QnaRead.do">
			<input type="hidden" name="bno">
			<table id="list" border="1">
				<tr>
					<td width="10%">번호</td><th width="50%" align="center">제목</th><th width="20%">글쓴이</th><th width="20%">작성일자</th>
				</tr>
				<c:forEach items="${list }" var="dto">
					<tr align="center" onmouseover="this.style.background='#bbbb'"
					onmouseout="this.style.background='white'"
					onclick="formSubmit(${dto.bno})">
						<td>${dto.bno }</td>
						<td>${dto.subject }</td>
						<td>${dto.id }</td>
						<td>${dto.bdate }</td>
					</tr>
				</c:forEach>
			</table>
			<div></div>
			
			</form>	<!-- 개선? -->
			<form name="btn" id="btn">
				<button type="button" id="wb" name="wb" onclick="qnaWrite(${sid })">글쓰기</button>	<!-- sid 는 세션id -->
				<input type="hidden" id="sid" name="sid">
			</form>
		
	</div>
</body>
</html>