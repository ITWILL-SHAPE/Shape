<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- postpage modify -->
<div class="container">
	<header class="my-2 p-3 text-center">
		<h1 class="titleBolder">게시글 수정</h1>
	</header>

	<main class="my-2">
		<div class="card mb-2">
			<form class="card-body" id="modifyForm">
				<input class="card-text d-none" id="pid" value="${ post.pid }"></input>
				<div class="my-2">
					<label class="form-label" for="hrs_hd">말머리</label> <select
						class="form-select" id="select" name="select">
						<option selected disabled="disabled">말머리를 선택해주세요.</option>
						<option value="모임 후기">모임 후기</option>
						<option value="사담">사담</option>
						<option value="기타">기타</option>
					</select>
					<textarea class="form-control d-none" id="hrs_hd" name="hrs_hd">${ post.hrs_hd }</textarea>
				</div>
				<div class="my-2">
					<label class="form-label" for="title">제목</label> <input
						class="form-control" id="title" name="title"
						value="${ post.title }" autofocus />
				</div>
				<div class="my-2">
					<label class="form-label" for="summernote">내용</label>
					<textarea class="form-control" id="summernote" name="content"
						required>${ post.content }</textarea>
				</div>
				<div class="my-2">
					<label class="form-label d-none" for="author">작성자 아이디</label> <input
						class="form-control d-none" id="author" value="${ post.author }" readonly />
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<c:url var="postList" value="/post/list" />
					<button onclick="location.href='${ postList }'"
						class="btn btn-secondary" type="button">취소</button>
					<button class="btn btn-classic" type="button" id="btnUpdate">수정완료</button>
				</div>
			</form>
		</div>


	</main>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/post-modify.js"></script>
<script src="<%=request.getContextPath()%>/static/js/post-summernote.js"></script>
</html>
<%@ include file="../common/footer.jsp"%>