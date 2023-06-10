<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 모임 > 내가 찜한 모임</title>
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
			<c:forEach items="${ interestsList }" var="interestsList">
				<tr>
					<td>${ interestsList.mtid }</td>
					<td>${ interestsList.title }</td>
					<td>${ interestsList.mt_date }</td>
					<!--<td>${ meet.image }</td>-->
					<td>${ interestsList.sido }</td>
					<td>${ interestsList.category }</td>
					<td>${ interestsList.nm_ppl }</td>
					<td>${ interestsList.lcnt }</td>
					<td>${ interestsList.pcnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>