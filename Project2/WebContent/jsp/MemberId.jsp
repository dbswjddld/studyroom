<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>* ID 중복확인 *</title>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1></h1>
	</header>
	<div class = "contentbox" align = "center">
<%
	String chk = (String)request.getAttribute("result");
	// chk 가 1이면 중복
	
	
	if(chk != null){
		out.print("이미 사용중인 아이디입니다.");
	} else {
		 out.print("사용 가능한 아이디입니다.");
%>
		<script>
			(function() {opener.document.frm.chk.value = "idCheck"}());
		</script>
<%
	}
%>
</div>
</body>
</html>