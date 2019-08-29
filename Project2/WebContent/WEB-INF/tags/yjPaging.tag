<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="co.yedam.studyroom.command.PagingReservation" %>
<%@ attribute name="jsfunc" %>
<!-- attribute :커스텀 태그에서 사용하는 속성을 정의
		name :속성명
		type :속성값의 데이터 타입 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- my:paging jsfunc="doList" paging="${paging}" --%>

<div class="pagination">
<ul>
<c:if test="${paging.page>=paging.startPage&&paging.page>paging.pageSize}">
	<a href="javascript:${jsfunc}(${paging.startPage-1})">
	이전
	</a>
	&nbsp;&nbsp;
</c:if>

<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	<c:if test="${i != paging.page}">
		<!--paging.page :현재 페이지
			현재 페이지가 아닌 부분 링크걸기-->
		<a href="javascript:${jsfunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<span style = "color:red">${i}</span>
	</c:if>
	&nbsp;
</c:forEach>

<c:if test="${paging.endPage<paging.totalPageCount}">
	&nbsp;&nbsp;
	<a href="javascript:${jsfunc}(${paging.endPage+1})">
	다음
	</a>
</c:if>
</ul>
</div>