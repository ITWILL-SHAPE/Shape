<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<!-- 지현 qna 관리자 main(list) page -->
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>Q&amp;A</h1>
			<p>관리자</p>
		</header>

		<main class="my-2">
			<div class="card">
				<table class="card-body table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ infoQnAs }" var="infoQnA">
							<tr>
								<td>${ infoQnA.qid }</td>
								<td>${ infoQnA.title }</td>
								<td>${ infoQnA.writer }</td>
								<td><fmt:formatDate value="${ infoQnA.created_date }"
										pattern="yyyy-MM-dd" /></td>
								<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.an_title=='확인중'}">
											<td>
											<c:url var="infoQnAUpdatePage" value="/mngr/qna/update">
											<c:param name="qid" value="${ infoQnA.qid }" /></c:url>
											<a href="${ infoQnADetailPage }">답변하기</a></td>
										</c:when>
										<c:otherwise>
											<td>
											<c:url var="infoQnAUpdatePage" value="/mngr/qna/update">
											<c:param name="qid" value="${ infoQnA.qid }" /></c:url>
											<a href="${ infoQnADetailPage }">답변완료</a></td>
										</c:otherwise>
									</c:choose>
								</c:if>
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