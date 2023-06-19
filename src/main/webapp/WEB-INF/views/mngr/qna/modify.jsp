<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
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
				<p>관리자 답변</p>
			</header>

			<main class="my-2">
				<div class="card">
					<form class="card-body" id="modifyForm">
						<!-- 사용자 문의 출력 -->
						<div class="my-2">
							<label class="form-label d-none" for="qid">번호</label> <input
								class="form-control d-none" id="qid" value="${ infoQnA.qid }"
								readonly />
						</div>
						<!-- 제목 -->
						<div class="card mb-3">
							<div class="card-body">
								<h2 class="card-text">${ infoQnA.title }</h2>
								<!-- 작성자 -->
								<p id="author" class="card-text">작성자: ${ infoQnA.writer }</p>
								<!-- 내용 -->
								<hr />
								<div class="my-2">
									<label class="form-label d-none" for="content">내용</label>
									<div class="card-text" id="content" style="height: 10rem">${ infoQnA.content }</div>
								</div>
								<hr />
								<!-- 작성날짜 -->
								<fmt:formatDate value="${ infoQnA.created_date }"
									pattern="yyyy-MM-dd" var="created" />
								<p class="card-text text-end small" id="created_date">${ created }</p>
							</div>
						</div>
						<!-- 관리자 답변 -->
						<div class="my-2">
							<label class="form-label" for="an_title">제목</label> <input
								class="form-control" type="text" id="an_title" value="답변드립니다."
								name="an_title" required readonly />
						</div>
						<div class="my-2">
							<label class="form-label" for="an_comment">답변</label>
							<textarea class="form-control" style="height: 100px;" id="an_comment" name="an_comment"
								required autofocus>${ infoQnA.an_comment }</textarea>
						</div>

						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-classic" type="button" id="btnUpdate">
								등록</button>
						</div>
					</form>
				</div>

			</main>
		</div>
	</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/infoQnAMngr-modify.js"></script>
</html>