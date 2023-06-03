<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<%@ include file="../../common/header.jsp" %>
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 모임 > 내가 참여 중인 모임</title>
</head>
<body>
	<%--
      <div id="sidebar">
         <%@ include file="../sidebar.jsp" %>
      </div>
       --%>
	<table>
		<thead>
			<tr>
				<th>mtid</th>
				<th>title</th>
				<th>mt_date</th>
				<!--<th>image</th>  -->
				<th>sido</th>
				<th>category</th>
				<th>nm_ppl</th>
				<th>lcnt</th>
				<th>pcnt</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ meet }" var="meet">
				<tr>
					<td>${ meet.mtid }</td>
					<td>${ meet.title }</td>
					<td>${ meet.mt_date }</td>
					<!--<td>${ meet.image }</td>-->
					<td>${ meet.sido }</td>
					<td>${ meet.category }</td>
					<td>${ meet.nm_ppl }</td>
					<td>${ meet.lcnt }</td>
					<td>${ meet.pcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
<%--
<%@ include file="../../common/footer.jsp" %>
--%>