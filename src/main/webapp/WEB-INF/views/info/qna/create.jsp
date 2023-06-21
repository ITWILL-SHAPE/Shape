<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 지현 qna main(list) page -->
<div class="container">
	<header class="my-2 p-3 text-center">
		<h1 class=“titleBolder”>Q&amp;A</h1>
		<p>문의를 남겨주시면 영업시간(09:30 ~ 17:30)내에 답변드리겠습니다.</p>
	</header>

	<main class="my-2">
		<div class="card">
			<form method="post">
				<div class="card-body">
					<div class="my-2">
						<label class="form-label" for="title">제목</label> <input
							class="form-control" type="text" id="title" name="title" required
							autofocus />
					</div>
					<div class="my-2">
						<label class="form-label" for="content">내용</label>
						<textarea class="form-control" id="content" name="content"
							required></textarea>
					</div>
					<div class="my-2">
						<label class="form-label d-none" for="writer">작성자 아이디</label>
						<sec:authentication property="principal.username" var="id" />
						<input class="form-control d-none" type="text" id="writer" name="writer"
							value="${ id }" readonly />
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="checkbox"
							checked> <label class="form-check-label" for="checkbox">
							비밀글 </label>
					</div>
					<textarea class="form-control d-none" id="secret" name="secret"></textarea>
				</div>
				<div class="my-2">
					<input class="form-control btn btn-classic" id="btnSubmit"
						type="submit" value="등록" />
				</div>
			</form>
		</div>
	</main>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/infoQnA-create.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>