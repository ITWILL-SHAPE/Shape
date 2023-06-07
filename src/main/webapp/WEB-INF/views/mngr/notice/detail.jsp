<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../common/mngr_sidebar.jsp"%>
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
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape</title>
	</head>
	<body>
		<h1>Notice detail</h1>
		
		<main class="my-2">
		<section class="card">
			<form id="noticeDetailFrom">
			<div class="card-body">
				<div class="my-4">
						<label class="form-label" for="nid">NO.</label>
						<input class="form-control" id="nid" name="nid" value="${ notices.nid }" readonly />
				</div>
				<div class="my-4">
					<label class="form-label" for="title">제목</label>
					<input class="form-control" id="title" value="${ notices.title }" readonly />
				</div>
				<div class="my-4">
					<label class="form-label">작성일</label>
					<fmt:formatDate value="${ times }" pattern="yyyy.MM.dd" var="date"/>
					<input class="form-control" id="created_date" value="${ date }" readonly />
				</div>
				<div class="my-4">
					<label class="form-label" for="file">첨부파일</label>
					<input class="form-control" id="file" value="${ notices.atchd_file }" readonly />
				</div>
				<div class="my-4">
					<label class="form-label" for="content">내용</label>
					<div class="form-control" id="content" readonly>${ notices.content }</div>
				</div>
			</div>
			</form>
		</section>


		<div>
			<div class="my-2 text-center">
				<c:url var="infoNoticeModifyPage" value="/mngr/notice/modify">
					<c:param name="nid" value="${ notices.nid }"></c:param>
				</c:url>
				<a class="btn btn-primary" href="${ infoNoticeModifyPage }">수정</a><!-- 수정 페이지 이동 -->
				<button class="btn btn-primary" id="btnDeleteNotice">삭제</button>
			</div>
		</div>
		</main>
		<script src="../../static/js/infoNotice-detail.js"></script>
</body>
</html>
