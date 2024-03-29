<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의${dto.bno}-${dto.subject }</title>
<!-- 20190819 17:50 곽동우 문의게시판 읽기화면 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
	.replytd {
			  width:450px;
			  word-break:break-all;
		     }
	</style>
	<script>
	
	$(document).ready(function () {
		var requestPage = "${pageContext.request.contextPath}";
		var bno = document.getElementById("bno").value;
		
		/*------------------------------
		페이지에 댓글 뿌려줌
		-------------------------------*/
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
                   			 $("<td class='replytd'>").text(r.reply),
                  			 $("<td>").text(r.cdate)
               			 )
                	if(r.id == "${mid}" || "${mgrant}" == "A")		//관리자 이거나 본인이면 수정 삭제버튼 보임
					     $tr.append(
				    		$("<td>").html($("<button type='button'>").text("수정").click(onupdate)),	//버튼추가	//수정해야		//밖으로 아이디조건
                    		$("<td>").html($("<button type='button'>").text("삭제").click(ondelete)));
                str.append($tr);
            })
            $("#reply").append(str);
		})
	
	/*------------------------------
		댓글달기버튼
		-------------------------------*/
	$("#replyInsert").on("click", function(){
		var id = "${mid}";		// "${mid}"  ""  따옴표로 했기때문에 null 이면 ""로 비교해야함
		if( id == "" ){
			alert("로그인해야 이용할수있습니다");
			return;		//ajax로안넘어감
		}
		
		$('[name="replyupdate"]').remove();		//0830 12:42  댓글달면 수정사라짐
		
		if($("#replycontent").val() == null || $("#replycontent").val() == ""){
			alert("댓글내용을 입력해주세요");
			return;		//ajax로안넘어감
		}
		
		$.ajax({
			url: requestPage+"/ReplyInsert.do",
			data: {
                bno: $("#bno").val(),		//게시글번호
                id: "${mid}",		///작성자id
                replycontent: $("#replycontent").val()	//댓글내용
            },
            dataType: "json",
			success: function(result){
					console.log(result);
					$("#commentstb").prepend(	//처음위치에추가
	                        $("<tr>").attr("id", result[0].cno).append(
	                            $("<td>").text(result[0].cno),
	                            $("<td>").text(result[0].id),
	                            $("<td class='replytd'>").text(result[0].reply),		//dao에서 sysdate받아와야?
	                            $("<td>").text(result[0].cdate)
	                        )
	                    );
					if(result[0].id == "${mid}")
					      $("#commentstb tr").eq(0).append(
				    	 	 $("<td>").html($("<button type='button' class='btnreplyupdate'>").text("수정").click(onupdate)),	//버튼추가	//수정해야		//밖으로 아이디조건
                    	  	 $("<td>").html($("<button type='button' class='btnreplydelete'>").text("삭제").click(ondelete)));
				
	          	    $("#replycontent").val("");
				}
			});
		
		});
	
	/*------------------------------
	버튼 클릭시 이벤트
	-------------------------------*/
	$("#commentstb").on("click", ".btnreplyupdate", onupdate); 
	$("#commentstb").on("click", ".btnreplydelete", ondelete);		
		
	/*------------------------------
	댓글부분 수정버튼 누르면
	-------------------------------*/
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
	             	//if($("#" + cno).next().attr("id") != null){	//댓글수정폼 하나만나오게    if($("#" + cno).next().attr("id") != null){
	             		$('[name="replyupdate"]').remove();
		                 $("#" + cno).after(
		                     $("<tr name='replyupdate'>").append(
			                    $("<td colspan='4'>").html($("<input>").val(result[0].reply)),	//한건이지만 배열타입이라서 result[0]
			                    $("<td>").html($("<button type='button' id='up' >").text("댓글수정").click(updateRow))
		                     )
		                 );
	           		  //}	//if end
	             }
	         });
    	}

    /*------------------------------
	댓글 삭제하기버튼
	-------------------------------*/
	function ondelete(){
		var cno = $(this).parent().parent().attr("id");
		var id = $(this).parent().parent().children().eq(1).text();
		if("${mid}" == id){		// 댓글삭제 조건  자기댓글or관리자계정 관리자조건추가
			var check = confirm("정말 삭제하시겠습니까?");
			if(check){
				$.ajax({
					url: requestPage+"/replyDelete.do",
					method : "post",
					data : { cno : cno	},
					
				}).done(function(data){
					$("#"+cno).remove();
					$('[name="replyupdate"]').remove();
				})
				
			}else{
				
			}
		}else{
			alert("사용자다릅니다");
		}
	}
	
	
	/*------------------------------
	//댓글수정 버튼 누르면 업데이트되고 그 행은 삭제  20190827 곽동우
	-------------------------------*/
	    function updateRow(){
	    	if(!(confirm("정말 수정하시겠습니까?"))){
	    		return;
	    	}
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
	                 //console.log($("#up"));	//   && 수정한 내용 바로 반영되게
	                 //console.log(content);
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
	
	
	
	
	
	
	/*----------------------------------------
	//텍스트에어리어 /n 을 <br>로 치환함
	---------------------------------------------*/
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
		<jsp:include page = "new_menuTop.jsp"></jsp:include>

	<header class="major"></header>
	<div class = "contentboxRight">
		<form id="frm" name="frm">
			<h4>작성자:${dto.id }</h4>
			<font size="3">작성일:<fmt:formatDate value="${dto.bdate}" pattern="yyyy.MM.dd HH:mm:ss" />&nbsp;문의번호:${dto.bno }</font>
				<input type="hidden" name="subject" id="subject" value="${dto.subject }">
				<input type="hidden" name="bno" id="bno" value="${dto.bno }">	
				<br><br>
			
			<h4 id="title">제목 :${dto.subject }</h4>
			<input type="hidden" name="id" id="id" value="${dto.id }">
			
			<div style="height: auto; max-width: 800px; word-wrap:break-word;">
				<hr align="center" width="30%">
				<font size="5" id="content1">${dto.content }</font>
				<input type="hidden" name="content" id="content" value="${dto.content }">
			</div>
			<br><br>
			<!-- 댓글추가 --><hr width="30%">
			<br><br>
			<div id="reply">
			</div>
			<div class="form-group">
				<textarea class="form-control" id="replycontent" name="replycontent" rows="2" style="width :40%" onKeyUp="javascript:fnChkByte(this,'200')" placeholder="내용을 입력하세요(한글 최대70자)"></textarea>
				<button type="button" id="replyInsert">댓글달기</button><br>
			</div>
			<c:if test="${dto.id == mid || mgrant == 'A' }">	<!-- 관리자 이거나 본인이면 수정 삭제버튼 보임 -->
				<button type="button" onclick="qnaUpdate(${dto.bno})">수정</button>
				<button type="button" onclick="qnaDel(${dto.bno})">삭제</button>
			</c:if>
			<button type="button" onclick="location.href='Qna.do'">목록</button>	<!-- 게시글 들어오기 전 페이지로이동 -->
		</form>
	</div>
</body>
</html>