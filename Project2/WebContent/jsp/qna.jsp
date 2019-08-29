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
		function formSubmit(n,id){
			if(id=='${mid}' || 'A' == '${mgrant}'){	
				var form = document.frm;
				form.bno.value = n;
				form.submit();
			}else{
				alert("비밀글입니다.")
				return;
			}
		}
		
		function qnaWrite(){
			var id = "${mid}"
			if(id == null || id == ""){
				alert("로그인 해야합니다")
				return;
			}else{
				
				document.btn.action="QnaWritePage.do";
				document.btn.method="post"; 
								
				document.btn.sid.value = "${mid}";//테스트용 아이디 세션작업되면 "dong" 수정해야함
				
				document.btn.submit();
			}
		}
		
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>문의게시판</h1>
	</header>
	<div class = "contentbox" align = "center">
		<form name="frm" id="frm" action="QnaRead.do">
			<input type="hidden" name="bno">
			<table id="list" border="1">
				<tr>
					<td width="10%">번호</td><th width="50%" align="center">제목</th><th width="20%">글쓴이</th><th width="20%">작성일자</th>
				</tr>
				<c:forEach items="${list }" var="dto">
					<tr align="center" onmouseover="this.style.background='#bbbb'"
					onmouseout="this.style.background='white'"
					onclick="formSubmit(${dto.bno},'${dto.id}')">
						<td>${dto.bno }</td>
						<td>${dto.subject }</td>
						<td>${dto.id }</td>
						<td>${dto.bdate }</td>
					</tr>
				</c:forEach>
			</table>
			<div></div>
			</form>	<!-- 개선? -->
			
			<!-- 페이지목록 -->
			<form name="pagebtn" id="pagebtn" action="Qna.do">
				<c:if test= "${page gt countPage}" >
					<button id="page" name="page" type="submit" onclick="form.submit()" value="${startPage-1}">이전</button>
				</c:if>
				<c:forEach  begin="${startPage }" end="${endPage }" step="1" varStatus="page" >
					<button id="page" name="page" type="submit" value="${page.current}" onclick="form.submit()">&nbsp;&nbsp;${page.current }&nbsp;&nbsp;</button>
				</c:forEach>
				
				<!--  수정해야딤  -->
				<c:if test= "${(totalPage-1)/5*5 ge page}" >
					<button id="page" name="page" type="submit" onclick="form.submit()" value="${endPage+1}">다음</button>
				</c:if>
			</form>
			
			<form name="btn" id="btn">
				<button type="button" id="wb" name="wb" onclick="qnaWrite()">글쓰기</button>	<!-- sid 는 세션id -->
				<input type="hidden" id="sid" name="sid">
			</form>
		
	</div>
</body>
</html>