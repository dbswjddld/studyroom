<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>* ID 중복확인 *</title>
</head>
<body>
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
</body>
</html>