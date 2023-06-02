<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<!-- 지현 qna main(list) page -->
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
			<p>문의를 남겨주시면 영업시간(09:30 ~ 17:30)내에 답변드리겠습니다.</p>
		</header>

		<main class="my-2">
			<div class="card">
				<table class="card-body table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>제목</th>
							<th>작성일</th>
							<th>진행상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ infoQnAs }" var="infoQnA">
							<tr>
								<td>${ infoQnA.qid }</td>
								<!-- secret 여부에 따라 제목이 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.secret.equals('N')}">
											<td><c:url var="infoQnADetailPage" value="/info/qna/detail">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnADetailPage }">${ infoQnA.title }</a></td>
										</c:when>
										<c:otherwise>
											<td><c:url var="infoQnADetailPage" value="/info/qna/detail">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnADetailPage }">🔒비밀글입니다.</a></td>
										</c:otherwise>
									</c:choose>
								</c:if>
								<td><fmt:formatDate value="${ infoQnA.created_date }"
										pattern="yyyy-MM-dd" /></td>
								<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${empty infoQnA.an_title}">
											<td>확인중</td>
										</c:when>
										<c:otherwise>
											<td>답변완료</td>
										</c:otherwise>
									</c:choose>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="my-2 d-grid d-md-flex justify-content-md-end">
				<c:url var="qnaCreate" value="/info/qna/create" />
				<button onclick="location.href='${ qnaCreate }'" class="btn btn-primary" type="button">질문하기</button>
			</div>
		</main>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>

	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>