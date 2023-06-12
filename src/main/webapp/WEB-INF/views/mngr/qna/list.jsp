<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/css/common.css" />
<!-- js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
<!-- icon -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
<title>Shape - 관리자</title>
</head>
<body>
	<div class="d-flex">
		<%@ include file="../../common/mngr_sidebar.jsp"%>
		<div class="vh-100 vw-100 p-3">
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
							<c:forEach items="${ infoQnAs }" var="infoQnA" varStatus="loop">
								<tr>
									<th scope="row" class="col-1 text-center">${loop.index + 1}</th>
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
									<td class="col-2 text-center"><fmt:formatDate
											value="${ infoQnA.created_date }" pattern="yyyy-MM-dd" /></td>
									<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->
									<c:if test="${infoQnA != null}">
										<c:choose>
											<c:when test="${infoQnA.an_title=='확인중'}">
												<td class="col-2 text-center"><c:url
														var="infoQnAUpdatePage" value="/mngr/qna/modify">
														<c:param name="qid" value="${ infoQnA.qid }" />
													</c:url> <a href="${ infoQnAUpdatePage }">답변하기</a></td>
											</c:when>
											<c:otherwise>
												<td class="col-2 text-center"><c:url
														var="infoQnAUpdatePage" value="/mngr/qna/modify">
														<c:param name="qid" value="${ infoQnA.qid }" />
													</c:url> <a href="${ infoQnAUpdatePage }">답변완료</a></td>
											</c:otherwise>
										</c:choose>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 페이징 처리 -->
					<div class="pb-3">
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item ${ paging.prev? "":"disabled" }"><a
									class="page-link" href="${ paging.startPage -1 }" tabindex="-1">Previous</a></li>
								<c:forEach begin="${ paging.startPage }"
									end="${ paging.endPage }" var="num">
									<li class="page-item ${ paging.cri.pageNum == num? "active":"" }"><a
										class="page-link" href="${ num }">${ num }</a></li>
								</c:forEach>
								<li class="page-item ${ paging.next? "":"disabled" }" ><a
									class="page-link" href="${ paging.endPage +1 }" tabindex="-1">Next</a></li>
							</ul>
						</nav>
					</div>

					<form id='actionForm' action='/shape/mngr/qna/list' method='get'>
						<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' /> 
						<input type='hidden' name='amount' value='${ paging.cri.amount }' />
					</form>
					<!-- 페이징 처리 -->
				</div>

			</main>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/paging.js"></script>
</html>