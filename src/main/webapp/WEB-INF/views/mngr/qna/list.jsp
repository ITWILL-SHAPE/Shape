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
<!-- 반응형 웹 페이지 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/common.css" />
<!-- icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
<title>Shape</title>
</head>
<body>
	<%@ include file="../../common/mngr_sidebar.jsp"%>
	<div class="container">
		<header class="my-2 p-5 text-center">
			<h1>Q&amp;A</h1>
			<p>관리자</p>
		</header>

		<main class="my-2">
			<div class="card">
				<table class="card-body table table-hover">
					<thead>
						<tr>
							<th class="text-center" scope="col">No</th>
							<th class="text-center" scope="col">제목</th>
							<th class="text-center" scope="col">작성자</th>
							<th class="text-center" scope="col">작성일</th>
							<th class="text-center" scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ infoQnAs }" var="infoQnA">
							<tr>
								<th scope="row" class="col-1 text-center">${ infoQnA.qid }</th>
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.secret.equals('N')}">
											<td class="ms-2">${ infoQnA.title }</td>
										</c:when>
										<c:otherwise>
											<td class="ms-2">🔒${ infoQnA.title }</td>
										</c:otherwise>
									</c:choose>
								</c:if>
								<td class="col-2 text-center">${ infoQnA.writer }</td>
								<td class="col-2 text-center"><fmt:formatDate value="${ infoQnA.created_date }"
										pattern="yyyy-MM-dd" /></td>
								<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.an_title=='확인중'}">
											<td class="col-2 text-center"><c:url var="infoQnAUpdatePage"
													value="/mngr/qna/modify">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnAUpdatePage }">답변하기</a></td>
										</c:when>
										<c:otherwise>
											<td class="col-2 text-center"><c:url var="infoQnAUpdatePage"
													value="/mngr/qna/modify">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnAUpdatePage }">답변완료</a></td>
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