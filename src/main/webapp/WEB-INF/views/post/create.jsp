<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- postpage create -->

<div class="container">
	<header class="my-2 p-5 text-center">
		<h1>게시글 작성</h1>
	</header>

	<main class="">
		<div class="card">
			<form method="post" id="createForm">
				<div class="card-body">
					<div class="my-2">
						<label class="form-label" for="hrs_hd">말머리</label> <select
							class="form-select" id="select" name="select">
							<option selected disabled="disabled" value="no">말머리를
								선택해주세요.</option>
							<option value="모임 후기">모임 후기</option>
							<option value="사담">사담</option>
							<option value="기타">기타</option>
						</select>
						<textarea class="form-control d-none" id="hrs_hd" name="hrs_hd"></textarea>
					</div>

					<div class="my-2">
						<label class="form-label" for="title">제목</label> <input
							class="form-control" type="text" id="title" name="title" required
							autofocus />
					</div>
					<div class="my-2">
						<label class="form-label" for="summernote">내용</label>
						<textarea class="form-control" id="summernote" name="content"
							required></textarea>
					</div>
					<div class="my-2">
						<label class="form-label d-none" for="author">작성자 아이디</label>
						<sec:authentication property="principal.username" var="id" />
						<input class="form-control d-none" type="text" id="author"
							name="author" value="${ id }" readonly />
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-center">
						<c:url var="postList" value="/post/list" />
						<button onclick="location.href='${ postList }'"
							class="btn btn-secondary" type="button">취소</button>
						<button class="btn btn-classic" id="btnPostCreate" type="button">
							등록</button>
					</div>
				</div>
			</form>
		</div>
	</main>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/post-create.js"></script>
<script src="<%=request.getContextPath()%>/static/js/post-summernote.js"></script>
</html>
<%@ include file="../common/footer.jsp"%>