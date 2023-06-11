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
		
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Shape</title>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	</head>
	<body>
		<div class="container">
			<div class="my-2 p-5 text-center">
				<p>관리자 공지사항 수정 화면</p>
			</div>
			
			<main class="my-2">
				<form id="noticeModifyForm">
					<section class="card">
						<div class="card-body">
							<div class="my-2">
								<label class="form-label" for="nid">NO.</label>
								<input class="form-control" id="nid" name="nid" value="${ notices.nid }" readonly />
							</div>
							<div class="my-2">
								<label class="form-label" for="title">제목</label>
								<input class="form-control" id="title" name="title" value="${ notices.title }" />
							</div>
							<div class="my-2">
								<label class="form-label">작성일</label>
								<fmt:formatDate value="${ times }" pattern="yyyy.MM.dd" var="date"/>
								<input class="form-control" id="created_date" value="${ date }" readonly />
							</div>
							<div class="my-2">
								<label class="form-label" for="file">첨부파일</label>
								<input class="form-control" id="file" name="file" value="${ notices.atchd_file }"  />
							</div>
							<div class="my-2">
									<label class="form-label" for="summernote">내용</label>
									<textarea class="form-control" id="summernote" name="content" required>${ notices.content }</textarea>
							</div>
						</div>
						<!-- 고정글 체크여부 -->
						<div class="form-check">
							<label class="form-check-label" for="checkbox">고정</label>
							<input class="form-check-input" type=checkbox name="fix" id="checkbox" value="-1"/>
						</div>
					</section>
				</form>
				<div class="my-2 text-center">
					<c:url var="infoNoticelistPage" value="/mngr/notice/list" />
					<a class="btn btn-primary" href="${ infoNoticelistPage }">목록</a>
					<button class="btn btn-primary" id="btnUpdateNotice">수정 완료</button>
				</div>
		</main>
			<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
			<script src="../../static/js/infoNotice-modify.js"></script>
			<script src="<%=request.getContextPath()%>/static/js/notice-summernote.js"></script>
		</div>
	</body>
</html>