<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>

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

<script type="text/javascript">
 document.addEventListener('DOMContentLoaded', () => {
     const modifyForm = document.querySelector('#modifyForm');
     
     
     const btnDelete = document.querySelector('#btnDelete');
     btnDelete.addEventListener('click', () => {
         const check = confirm('정말 삭제할까요?');
         if(check){
             modifyForm.action = './delete?pid=' +${post.pid};
             modifyForm.method = 'post'; 
             modifyForm.submit(); 
         }
     })
 });
 </script>
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
				<form class="card-body" id="modifyForm">
					<!-- 조회수 -->
					<p class="card-text">${ post.views }</p>
					<!-- 글번호 -->
					<p class="card-text" id="id">${ post.pid }</p>
					<!-- 제목 -->
					<h2 class="card-title">${ post.title }</h2>
					<!-- 작성자 -->
					<p class="card-text">${ post.author }</p>
					<!-- 내용 -->
					<div class="my-2">
						<label class="form-label" for="content">내용</label>
						<div class="form-control" id="content" readonly>${ post.content }
						</div>
					</div>
					<!-- 작성날짜, 수정날짜 -->
					<fmt:formatDate value="${ post.created_date }"
						pattern="yyyy-MM-dd HH:mm:ss" var="created" />
					<fmt:formatDate value="${ post.modified_date }"
						pattern="yyyy-MM-dd HH:mm:ss" var="modified" />
					<p class="card-text" id="created_date">${ created }/${ modified }</p>
					<!-- 수정 삭제 버튼  -->
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<c:url var="postModifyPage" value="/post/modify">
							<c:param name="pid" value="${ post.pid }"></c:param>
						</c:url>
						<button class="btn btn-warning me-md-2" type="button"
							onclick="location.href='${ postModifyPage }'">수정</button>
						<button class="btn btn-warning" type="button" id="btnDelete">삭제</button>
					</div>

				</form>
			</section>
			<!-- 포스트 상세 보기 카드 -->
			<section class="my-2 card">
				<div class="card-header fw-bold">
					<span>댓글</span> <span id="commentCount">${ post.commentCount }</span>개
					<!-- <button class="btn" id="btnToggleReply">
						<img id="toggleBtnIcon"
							src="../static/assets/icons/toggle2-off.svg" alt="toggle-off"
							width="32" />
					</button> -->
				</div>
				<div class="card-body " id="replyToggleDiv">

					<!-- 댓글 목록 보여줄 영역 -->
					<div class="my-2 row">
						<c:if test="${comments != null}">
							<c:forEach items="${ comments }" var="comment">
								<div class="card">
									<div>
										<div class="col"> 번호 ${comment.pcid}</div>
										<div class="col"> 작성자 ${comment.author}</div>
										<fmt:formatDate value="${comment.modified_date}"
											var="modified" pattern="yyyy-MM-dd" />
										<div class="col"> 작성 날짜 ${modified}</div>
									</div>
									<div>${comment.content}</div>
									<div>
										<button class="btnDelete btn btn-outline-danger"
											data-id="${reply.id}">삭제</button>
										<button class="btnModify btn btn-outline-success"
											data-id="${reply.id}">수정</button>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<!-- 내 댓글 등록 -->
					<div class="my-2 row">
						<label class="form-label" for="replyText">나의 댓글</label>
						<div class="col-10">
							<textarea class="form-control" id="replyText"></textarea>
							<input class="" id="author" />
							<!-- TODO: 로그인 사용자 아이디 -->
						</div>
						<div class="col-2">
							<button class="form-control btn btn-outline-success"
								id="btnAddReply">등록</button>
						</div>
					</div>

				</div>
			</section>
			<!-- 댓글 등록, 댓글 리스트 카드 -->

			<div class="d-grid gap-2 col-5 mx-auto">
				<c:url var="postList" value="/post/list" />
				<button onclick="location.href='${ postList }'"
					class="btn btn-warning" type="button">목록</button>
			</div>
			<!-- end modal -->
		</main>

		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>