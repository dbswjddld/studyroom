<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 20190823 곽동우 문의글 쓰기폼 -->

<title>문의글작성</title>
<script>
	function bWrite(){
		var form = document.frm;
		var subject = form.subject.value;
		var content = form.content.value;
		
		if(subject == ""){
			alert("제목을 입력하세요")
			return false;
		}else if(content == ""){
			alert("내용을 입력하세요")
			return false;
		}
		
		form.submit();
	}
	
	function captureReturnKey(e) {	//text창 엔터키 자동submit 막아줌
	    if(e.keyCode==13 && e.srcElement.type != 'textarea')
	    return false;
	}

	
	
	/*----------------------------------------
	//텍스트에어리어 길이체크 
	---------------------------------------------*/
	function fnChkByte(obj, maxByte)			
	{
	    var str = obj.value;
	    var str_len = str.length;


	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";


	    for(var i=0; i<str_len; i++)
	    {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4)
	        {
	            rbyte += 3;               //윈도우3Byte  리눅스2Byte          //한글2Byte
	        }
	        else
	        {
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }


	        if(rbyte <= maxByte)
	        {
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }


	     if(rbyte > maxByte)
	     {
	  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte(obj, maxByte);
	     }
	     else
	     {
	        document.getElementById('byteInfo').innerText = rbyte;
	     }
	}
	
	
	
	
	
	
</script>
</head>
<body>
	<jsp:include page = "new_menuTop.jsp"></jsp:include>
	<header>
		문의할 내용을 적어주세요
	</header>
	<div class = "contentboxRight" align = "center">
		<article>
		<form id="frm" name="frm" action="QnaWrite.do" onkeydown="return captureReturnKey(event)" method="post">
			<input type="hidden" id="id" name="id" value="${sid }">
			<input type="text" name="subject" id="subject" placeholder="제목을 입력해주세요"><br>
			<textarea name="content" id="content" rows="10" onKeyUp="javascript:fnChkByte(this,'1000')" placeholder="내용을 입력하세요(한글 최대300자)"></textarea><br>
			<button type="button" onclick="bWrite()">등록</button>
			<button type="button" onclick="location.href='Qna.do'">취소</button>
		</form>
	</article>
	</div>
</body>
</html>