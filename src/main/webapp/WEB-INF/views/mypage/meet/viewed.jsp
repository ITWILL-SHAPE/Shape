<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 모임 > 최근 본 모임(beta)</title>
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인 컨텐츠 시작 -->
	<main id="main_content">
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>mtid</th>
						<th>title</th>
						<th>mt_date</th>
						<!-- <th>image</th> -->
						<th>sido</th>
						<th>category</th>
						<th>nm_ppl</th>
						<th>created_date</th>
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
							<td>
							<fmt:formatDate value="${ activeList.created_date }"
								        	pattern="yyyy-MM-dd HH:mm" />
					    	</td>
							<td>${ meet.lcnt }</td>
							<td>${ meet.pcnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	<!-- 메인 컨텐츠 끝 -->
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>