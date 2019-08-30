<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href = "css/tableStyle.css" rel = "stylesheet">
	<meta charset="UTF-8">
	<title>^-^</title>
	<script src = "https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	$(function(){
		// 비밀번호 입력 확인 [윤정 0830]
		$("#pwChk,#pw").keyup(function(){
			if($("#pw").val() == $("#pwChk").val()) { // 둘 다 똑같이 입력했으면
				$("#pwChkMsg").html("비밀번호가 일치합니다.").css("color", "green");
				$("#pwChkResult").val("true");
			} else { // 다르게 입력했으면
				$("#pwChkMsg").html("비밀번호가 일치하지 않습니다.").css("color", "red");
				$("#pwChkResult").val("false");
			}
			console.log($("#pwChkResult").val());
		});
	});
	
	// id 중복확인 눌렀을 때
	function idChk(){
		var cid = document.frm.id;
		if(cid.value == '') { // 아이디 칸에 아무것도 입력하지 않았을 때
			alert("아이디를 입력하세요");
			cid.focus();
			return false;
		} else {
			url = "IdChk?id=" + cid.value;
			window.open(url, "chkForm", "width = 400, height = 250, resizable = no, scrollvars = no");
			// IdChk.java 로 폼 아이디 정보 전송
		}
	}
	
	// 회원가입 눌렀을때
	function formCheck(){
		if(document.frm.chk.value != "idCheck"){
			alert("ID 중복확인 하세요!");
			return false;
		}
		if($("#pwChkResult").val() == "false") {
			alert("비밀번호를 확인하세요!");
			return false;
		}
	}
	</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		<h1>회원가입</h1>
	</header>
	<div class = "contentbox" align = "center">
		<form action = "MemberJoinOk.do" method="post" name = "frm" onsubmit = "return formCheck()">
		<table border = "1" cellpadding = "5">
			<tr>
				<th width = "150">아이디 *</th>
				<td width = "400">
					<input type = "text" name = "id" required>
					<input type = "button" value = "ID 중복확인" onclick = "idChk()">
					<input type = "hidden" name = "chk" value="">
					<input type = "hidden" id = "pwChkResult" value = "false"> <!-- 비밀번호 확인 값 저장 -->
				</td>
			</tr>
			<tr>
				<th>비밀번호 *</th>
				<td><input type = "password" name = "pw" id = "pw" required></td>
			</tr>
			<tr>
				<th>비밀번호 확인 *</th>
				<td height = "80px"><input type = "password" name = "pwChk" id = "pwChk" required>
					<span id = "pwChkMsg"> </span>
				</td>
			</tr>			
			<tr>
				<th>이메일 *</th>
				<td><input type = "text" name = "email" required>
				입력한 이메일은 ID 또는 PW 찾을때 이용됩니다.<br>
				이메일로 문의사항을 받아보시겠습니까?
				<input type="radio" id="goodyes" name="emailres" value = "Y" checked>Yes<label for="goodyes"></label>
				<input type="radio" id="goodno" name="emailres" value = "N">NO<label for="goodno"></label></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type = "text" name = "tel"></td>
			</tr>
		</table>
		<br>
		<input type = "submit" value = "회원가입" > &nbsp;&nbsp;
		<input type = "button" value = "취소" onclick = "location.href = 'index.jsp'">
	</form>
	</div>
</body>
</html>