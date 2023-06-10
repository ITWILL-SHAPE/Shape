<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 모임 > 내가 참여 중인 모임</title>
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
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
			<c:forEach items="${ activeList }" var="activeList">
				<tr>
					<td>${ activeList.mtid }</td>
					<td>${ activeList.title }</td>
					<td>${ activeList.mt_date }</td>
					<!--<td>${ meet.image }</td>-->
					<td>${ activeList.sido }</td>
					<td>${ activeList.category }</td>
					<td>${ activeList.nm_ppl }</td>
					<td>${ activeList.lcnt }</td>
					<td>${ activeList.pcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>