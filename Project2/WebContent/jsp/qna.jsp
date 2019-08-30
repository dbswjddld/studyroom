<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 20190820   11:14  > 20190822
	   곽동우
	  문의게시판 -->
	<script>
		function formSubmit(n,id){
			if('${mid}' == id || '${mgrant}' == 'A'){
				var form = document.frm;
				form.bno.value = n;
				form.submit();
			}else{
				alert("작성자만 확인할수있습니다")
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
			<table id="list" class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th width="10%">글번호</th><th width="50%" align="center">제목</th><th width="20%">작성자</th><th width="20%">작성일자</th>
					</tr>
				</thead>
				<c:forEach items="${list }" var="dto">
					<tr align="center" onmouseover="this.style.background='#bbbb'"
					onmouseout="this.style.background='white'"
					onclick="formSubmit(${dto.bno},'${dto.id}')">
						<td>${dto.bno }</td>
						<td>${dto.subject }</td>
						<td>${dto.id }</td>
						<td>${fn:substring(dto.bdate, 0, 16)}</td>
					</tr>
				</c:forEach>
			</table>
			<div></div>
			</form>	<!-- 개선? -->
			
			<!-- 페이지목록 -->
			<nav aria-label="Page navigation example">
				<form name="pagebtn" id="pagebtn" action="Qna.do">
					<c:if test= "${page gt countPage}" >
						<button id="page" name="page" type="submit" onclick="form.submit()" value="${startPage-1}">이전</button>
					</c:if>
					<c:forEach  begin="${startPage }" end="${endPage }" step="1" varStatus="page">
						<button class="btn-primary" id="page" name="page" type="submit" value="${page.current}" onclick="form.submit()">&nbsp;&nbsp;${page.current }&nbsp;&nbsp;</button>
						
					</c:forEach>
					
					<!--  수정해야딤  -->
					<c:if test= "${endPage<totalPage}" >
						<button id="page" name="page" type="submit" onclick="form.submit()" value="${endPage+1}">다음</button>
					</c:if>
				</form>
				
				<form name="btn" id="btn">
					<button type="button" id="wb" name="wb" onclick="qnaWrite()">글쓰기</button>	<!-- sid 는 세션id -->
					<input type="hidden" id="sid" name="sid">
				</form>
			</nav>
		
	</div>
</body>
</html>