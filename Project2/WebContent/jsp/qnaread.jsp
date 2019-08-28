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
	
	$(document).ready(function () {
		var requestPage = "${pageContext.request.contextPath}";
		var bno = document.getElementById("bno").value;
		$.ajax({
			url: requestPage+"/GetReply.do?bno="+bno,
			method: "get",
			dataType: "json"
		}).done(function(data){
			var str = $("<table>").attr("id", "commentstb");
			$.map(data, function (r, i) {
                $tr = $("<tr>").attr("id", r.cno).append(
                    $("<td>").text(r.cno),
                    $("<td>").text(r.id),
                    $("<td>").text(r.reply),
                    $("<td>").text(r.cdate),
                    $("<td>").html($("<button type='button'>").text("수정").click(onupdate)),	//버튼추가
                    $("<td>").html($("<button type='button'>").text("삭제").click(ondelete))
                )
                str.append($tr);
            })
            $("#reply").append(str);
		})
	
	//댓글달기버튼 클릭하면
	$("#replyInsert").on("click", function(){
		$.ajax({
			url: requestPage+"/ReplyInsert.do",
			data: {
                bno: $("#bno").val(),		//게시글번호
                id: $("#id").val(),		///작성자id
                replycontent: $("#replycontent").val()	//댓글내용
            },
            dataType: "json",
			success: function(result){
					console.log(result);
					$("#commentstb").append(
	                        $("<tr>").append(
	                            $("<td>").text(result[0].cno),
	                            $("<td>").text(result[0].id),
	                            $("<td>").text(result[0].reply),		//dao에서 sysdate받아와야?
	                            $("<td>").text(result[0].cdate),
	                            $("<td>").html($("<button type='button'>").text("수정").click(onupdate)),	//버튼추가	//수정해야
	                            $("<td>").html($("<button type='button'>").text("삭제").click(ondelete))				//됩니다
	                        )
	                    );
	                    $("#replycontent").val("");
				}
			});
		});
	
	 //수정 버튼누르면		//계속눌러도 하나만 나오게 수정해야됨 20190827
    function onupdate() {
        var cno = $(this).parent().parent().attr("id");		// input태그 일때 .val()로읽어오고 아닐땐 그냥 이런식으로쓰면됨 
   	 	console.log(cno);
	   	 if ($(this).parent().parent().eq(0).next())
	         $.ajax({
	             url: requestPage+"/replyUpdateGet.do",
	             data: {
	                cno: cno
	             },		//변경하기위한 데이터를얻어와야함
	             dataType: "json",
	             success: function (result) {
	             	console.log(result);
	             	if($("#" + cno).next().attr("id") != null){	//댓글수정폼 하나만나오게
		                 $("#" + cno).after(
		                     $("<tr>").append(
			                    $("<td colspan='4'>").html($("<input>").val(result[0].reply)),	//한건이지만 배열타입이라서 result[0]
			                    $("<td>").html($("<button type='button' id='up'>").text("댓글수정").click(updateRow))
		                     )
		                 );
	           		  }
	             }
	         });
    	}
	
	function ondelete(){
		
	}
	
	function updateRow(){		//댓글수정 버튼 누르면 업데이트되고 그 행은 삭제  20190827 곽동우
		 var id = $(this).parent().parent().prev().children().eq(1).text();
         var content = $(this).parent().parent().children().eq(0).children().eq(0).val();
         var cno = $(this).parent().parent().prev().attr("id");
         
         $.ajax({
             url: requestPage+"/replyUpdate.do",
             method : "post",
             data: {
                 cno : cno,
                 id : id,
                 content: content
             },success: function () {		//변경 성공? 하면 버튼 조상의 조상(<tr>) 삭제 //위에 아이디 추가해줬음 <button id='up'>
                 console.log($("#up"));	//   && 수정한 내용 바로 반영되게
                 console.log(content);
                 $("#" + cno).children().eq(1).text(id);
                 $("#" + cno).children().eq(2).text(content);
                 $("#up").parent().parent().remove();
             }
         })
    }
	
	});	// (document).ready 끝
	
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
	
	
	
	
	
	
	
	window.onload = function(){		//db읽어온 텍스트 \n  -> <br> 바꿈
			var text = document.getElementById("content");
			var result = text.value.replace(/(\n|\r\n)/g, '<br>');	//value말고 innerHTML하면 다른데?적용
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
		var check = confirm("정말 삭제하시겠습니까?");
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
			<div id="reply">
				<h3>댓글표현</h3>
			</div>
			
			<textarea id="replycontent" name="replycontent" rows="2" cols="10" onKeyUp="javascript:fnChkByte(this,'200')" ></textarea>
			<button type="button" id="replyInsert">댓글달기</button><br>
		
			<button type="button" onclick="qnaUpdate(${dto.bno})">수정</button>
			<button type="button" onclick="qnaDel(${dto.bno})">삭제</button>
			<button type="button" onclick="location.href='Qna.do'">목록</button>	<!-- 게시글 들어오기 전 페이지로이동 -->
		</form>
	</div>
</body>
</html>