<%@page import="co.yedam.studyroom.dao.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
	
<!DOCTYPE html>
<html><head><title>deptList.jsp</title></head>
<body>
	<h3>부서등록</h3>
	<!-- 등록폼 시작 -->
	<form action="dept_control.jsp" method="post">
		<input type="hidden" name="action" value="insert"/>
		부서번호<input type="text" name="department_id"/>
		부서명<input type="text" name="department_name"/><br/>
		메니저<input type="text" name="manager_id"/>
		지역<input type="text" name="location_id"/>
		<input type="submit" value="등록"/><br/>
	</form>
	<!-- 등록폼 끝 -->
	<hr>
	<!-- 검색폼 시작 -->
	<div style="border: 1px solid gray">
		<form name="searchFrm" action="dept_control.jsp">
			<input type="hidden" name="action" value="list"/>
		    <input type="hidden" name="p" value="1"/>
			메니저<input type="text" name="manager_id"/>
			지역  <input type="text" name="location_id"/>
			<input type="submit" value="검색"/><br/>
		</form>
	</div>
	<!-- 검색폼 끝 -->
	
	<h3>부서목록</h3>
	<table>
		<tr>
			<th>부서번호</th>
			<th>부서명</th>
			<th>메니저</th>
			<th>지역</th>
		</tr>
		<c:forEach items="${deptList}" var="vo">
		<tr>
			<th>${vo.getDepartment_id()}</th>
			<th>${vo.getDepartment_name()}</th>
			<th>${vo.getManager_id()}</th>
			<th>${vo.getLocation_id()}</th>
		</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<my:paging jsfunc="doList" paging="${paging}"/>
	<script>
	function doList(p) {
		document.searchFrm.p.value = p;
		document.searchFrm.submit();
	}
	</script>
</body>
</html>