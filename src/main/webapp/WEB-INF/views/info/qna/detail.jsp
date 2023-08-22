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

	<section class="card">
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
			<!-- 관리자 답변출력 -->
			<!-- an_title이 확인중이 아닐때만 출력 -->
			<c:if test="${infoQnA.an_title!='확인중'}">
						<div class="my-2">
							<label class="form-label d-none" for="an_title">제목</label> <input
								class="form-control d-none" id="an_title"
								value="${ infoQnA.an_title }" readonly />
						</div>
						<div class="card mb-2">
							<div class="card-body">
								<h4 class="card-text">${ infoQnA.an_title }</h4>
								<div class="card-text" id="content" style="height: 10rem">${ infoQnA.an_comment }</div>
							</div>
							<fmt:formatDate value="${ infoQnA.answer_date }"
								pattern="yyyy-MM-dd" var="answered" />
							<p class="card-text text-end small mb-3 me-3" id="answer_date">${ answered }</p>
						</div>
			</c:if>

			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="id" />
				<c:if test="${ id == infoQnA.writer }">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button class="btn btn-secondary me-md-2" id="btnDelete"
							type="button">삭제</button>
					</div>
				</c:if>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">

			</sec:authorize>
		</form>
	</section>


	<div class="d-grid gap-2 d-md-flex mt-2 justify-content-md-center">
		<c:url var="qna" value="/info/qna" />
		<button onclick="location.href='${ qna }'" class="btn btn-list col-2"
			type="button">목록</button>
	</div>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/infoQnA-detail.js"></script>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>