<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<body>
		<div class="container">
			<div class="my-2 p-5 text-center">
				<h1>공지사항</h1>
			</div>
		
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
		</div>
	</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>