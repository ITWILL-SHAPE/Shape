<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <%@ include file="../common/header.jsp"%> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Shape</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="../static/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
	<div class="container-fluid">
		<header class="my-2 p-5 text-center">
			<h1>포스트 상세 보기</h1>
		</header>
		<main class="my-2">
			<section class="card">
				<form class="card-body">
					<div class="my-2">
						<label class="form-label" for="id">번호</label> <input
							class="form-control" id="id" value="${ post.pid }" readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="title">제목</label> <input
							class="form-control" id="title" value="${ post.title }"
							readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="content">내용</label>
						<div class="form-control" id="content" readonly>${ post.content }
						</div>
					</div>
					<div class="my-2">
						<label class="form-label" for="author">작성자 아이디</label> 
						<input class="form-control" id="author" value="${ post.author }" readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="created_date">작성 날짜</label>
						<fmt:formatDate value="${ post.created_date }"
							pattern="yyyy-MM-dd HH:mm:ss" var="created" />
						<input class="form-control" id="created_date" value="${ created }"
							readonly />
					</div>
					<div class="my-2">
						<label class="form-label" for="modified_date">수정 날짜</label>
						<fmt:formatDate value="${ post.modified_date }"
							pattern="yyyy-MM-dd HH:mm:ss" var="modified" />
						<input class="form-control" id="modified_date"
							value="${ modified }" readonly />
					</div>
				</form>
				<div class="card-footer my-2">
					<c:url var="postModifyPage" value="/post/modify">
						<c:param name="pid" value="${ post.pid }"></c:param>
					</c:url>
					<a class="btn btn-outline-warning form-control"
						href="${ postModifyPage }">수정하기</a>
				</div>
				<div class="my-2 text-center">
					<c:url var="postList" value="/post/list" />
					<button onclick="location.href='${ postList }'"
						class="btn btn-warning" type="button">목록</button>
				</div>
			</section>
			<!-- 포스트 상세 보기 카드 -->
<%-- 
			<section class="my-2 card">
				<div class="card-header fw-bold">
					<span>댓글</span> <span id="commentCount">${ post.CommentCount }</span>개
					<button class="btn" id="btnToggleReply">
						<img id="toggleBtnIcon"
							src="../static/assets/icons/toggle2-off.svg" alt="toggle-off"
							width="32" />
					</button>
				</div>
				<div class="card-body collapse" id="replyToggleDiv">
					<!-- 내 댓글 등록 -->
					<div class="my-2 row">
						<label class="form-label" for="replyText">나의 댓글</label>
						<div class="col-10">
							<textarea class="form-control" id="replyText"></textarea>
							<input class="d-none" id="writer" value="admin" />
							<!-- TODO: 로그인 사용자 아이디 -->
						</div>
						<div class="col-2">
							<button class="form-control btn btn-outline-success"
								id="btnAddReply">등록</button>
						</div>
					</div>

					<!-- 댓글 목록 보여줄 영역 -->
					<div class="my-2 row" id="replies"></div>
				</div>
			</section>
			<!-- 댓글 등록, 댓글 리스트 카드 -->

			<!-- 댓글 수정 모달 -->
			<div id="replyUpdateModal" class="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">댓글 수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!-- 수정할 댓글 아이디 - 화면에 보이지 않도록 -->
							<input id="modalReplyId" class="d-none" />
							<!-- 수정할 댓글 내용 -->
							<textarea id="modalReplyText" class="form-control"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">취소</button>
							<button type="button" id="modalBtnUpdate" class="btn btn-primary">변경
								내용 저장</button>
						</div>
					</div>
				</div>
			</div>
 --%>			<!-- end modal -->
		</main>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	</div>
</body>
</html>