<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<div class="container">
	<header class="my-2 p-5 text-center">
		<h1>포스트 상세 보기</h1>
	</header>
	<main class="my-2">
		<section class="card">
			<form class="card-body" id="modifyForm">
				<!-- 조회수 -->
				<p class="card-text">조회수: ${ post.views }</p>
				<!-- 글번호 -->
				<input class="card-tex d-none" id="pid" value="${ post.pid }"></input>
				<!-- 제목 -->
				<h2 class="card-title">[ ${post.hrs_hd} ] ${ post.title }</h2>
				<!-- 작성자 -->
				<p class="card-text">작성자: ${ post.author }</p>
				<!-- 내용 -->
				<hr />
				<div class="my-2">
					<label class="form-label d-none" for="content">내용</label>
					<div class="card-text" id="content">${ post.content }</div>
				</div>
				<hr />
				<!-- 작성날짜, 수정날짜 -->
				<fmt:formatDate value="${ post.created_date }"
					pattern="yyyy-MM-dd HH:mm:ss" var="created" />
				<fmt:formatDate value="${ post.modified_date }"
					pattern="yyyy-MM-dd HH:mm:ss" var="modified" />
				<p class="card-text text-end small" id="created_date">${ created }
					/ ${ modified }</p>
			</form>
		</section>
		<!-- 수정 삭제 버튼 로그인한 해당 사용자에게만 노출되도록 -->
		<!-- security에서 사용자의 id를 가져오고 변수명으로 id를 사용 -->
		<sec:authentication property="principal.username" var="id" />
		<!-- 예시로 meet라는 DTO에서든 author라는 userId를 받아온다고 치면 -->
		<c:set value="${ post.author }" var="author" />
		<c:if test="${ id ==  author }">
			<div class="my-2 d-grid gap-2 d-md-flex justify-content-md-end">
				<c:url var="postModifyPage" value="/post/modify">
					<c:param name="pid" value="${ post.pid }"></c:param>
				</c:url>
				<button class="btn btn-warning me-md-2" type="button"
					onclick="location.href='${ postModifyPage }'">수정</button>
				<button class="btn btn-warning" type="button" id="btnDelete">삭제</button>
			</div>
		</c:if>
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

			<div class="card-body ">
				<!-- 댓글 목록 보여줄 영역 -->

				<div class="my-2 row">
					<!-- 내 댓글 작성 div -->
					<label class="form-label" for="content">나의 댓글</label>
					<div class="col-10">
						<textarea class="form-control" id="content"></textarea>
						<input class="" id="author" />
						<!-- TODO: 로그인 사용자 아이디 -->
					</div>
					<div class="col-2">
						<button class="form-control btn btn-outline-success"
							id="btnAddComment">등록</button>
					</div>
				</div>

				<div id="comments"></div>

				<div class="my-2 row">
					<!-- 댓글 리스트 div -->
					<c:if test="${comments != null}">
						<c:forEach items="${ comments }" var="comment">
							<div class="card">
								<div>
									<div class="col">번호 ${comment.pcid}</div>
									<div class="col">작성자 ${comment.author}</div>
									<fmt:formatDate value="${comment.modified_date}" var="modified"
										pattern="yyyy-MM-dd" />
									<div class="col">작성 날짜 ${modified}</div>
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

	<script src="<%=request.getContextPath()%>/static/js/postComment.js"></script>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/post-detail.js"></script>
</html>
<%@ include file="../common/footer.jsp"%>