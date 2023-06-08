<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shape</title>
	</head>
	<body>
		<h1>공지사항 게시판</h1>
		
		<div class="container-fluid">
			<main class="my-2">
				<div class="card">
					<table class="card-body table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ notices }" var="notice">
								<tr>
									<c:choose>
										<c:when test="${ notice.fix == -1 }">
											<td>📢</td>
										</c:when>
										<c:otherwise>
											<td>${ notice.nid }</td>
										</c:otherwise>
									</c:choose>
									<td>
										<c:url var="noticeDetailPage" value="/info/notice/detail">
											<c:param name="nid" value="${ notice.nid }"></c:param>
										</c:url>
										<a href="${ noticeDetailPage }">${ notice.title }</a>
									</td>
									<td><fmt:formatDate value="${ notice.created_date }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
			
			<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
			
		</div>
	</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>