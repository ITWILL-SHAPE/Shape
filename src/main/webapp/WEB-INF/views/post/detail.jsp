<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- postpage detail -->
<div class="container">
	<section class="card">
		<form class="card-body" id="modifyForm">
			<div class="row">
				<!-- 제목 -->
				<h2 class="card-title col-10">[ ${post.hrs_hd} ] ${ post.title }</h2>
				<!-- 조회수 -->
				<p class="card-text col-2 text-end">조회수: ${ post.views }</p>
			</div>
			<!-- 글번호 -->
			<input class="card-tex d-none" id="pid" value="${ post.pid }"></input>
			<!-- 작성자 -->
			<div class="grid d-grid d-md-flex mt-2" style="height: 30px;">
				<div class="g-col-3 me-2">
					<!-- 프로필 사진 -->
					<div class="text-center"
						style="width: 30px; height: 30px; border-radius: 70%; overflow: hidden;">
						<c:if test="${ post.file == null }">
							<img style="width: 100%; height: 100%; object-fit: cover;"
								src="<%=request.getContextPath()%>/static/images/common/user.png" />
						</c:if>
						<c:if test="${ post.file != null }">
							<c:set value="data:image/png;base64, ${ post.file }"
								var="profile" />
							<img class="" src="${ profile }"
								style="width: 100%; height: 100%; object-fit: cover;" />
						</c:if>
					</div>
				</div>
				<p class="g-col card-text mt-1">작성자: ${ post.author }</p>
			</div>
			<!-- 내용 -->
			<hr />
			<div class="my-2">
				<label class="form-label d-none" for="content">내용</label>
				<div class="card-text postDetail" id="content">${ post.content }</div>
			</div>
			<hr />
			<!-- 작성날짜, 수정날짜 -->
			<fmt:formatDate value="${ post.modified_date }" pattern="yyyy-MM-dd"
				var="modified" />
			<p class="card-text text-end small" id="created_date">${ modified }</p>
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
			<button class="btn btn-classic me-md-2" type="button"
				onclick="location.href='${ postModifyPage }'">수정</button>
			<button class="btn btn-secondary" type="button" id="btnDelete">삭제</button>
		</div>
	</c:if>
	<!-- 포스트 상세 보기 카드 -->

	<section class="my-2 card">
		<div class="card-header fw-bold">
			<span>댓글 </span><span id="commentCount">${ post.commentCount }</span>
		</div>

		<div class="card-body">
			<!-- 댓글 작성, 목록 보여줄 div -->
			<label class="form-label m-0" for="content">나의 댓글</label>
			<div class="my-2 input-group">
				<!-- 내 댓글 작성 div -->
				<sec:authentication property="principal.username" var="id" />
				<input class="form-control d-none" type="text" id="author"
					name="author" value="${ id }" readonly />
				<textarea class="form-control" aria-describedby="basic-addon1"
					id="content"></textarea>
				<button class="btn btn-classic" id="btnAddComment">등록</button>
			</div>

			<!-- 수빈: 댓글 리스트 div -->
			<div id="comments"></div>

		</div>
	</section>
	<!-- 댓글 등록, 댓글 리스트 카드 -->


	<div class="d-grid d-md-flex justify-content-md-center">
		<c:url var="postList" value="/post/list" />
		<button onclick="location.href='${ postList }'"
			class="btn btn-list col-2" type="button">목록</button>
	</div>
	<!-- end modal -->

	<!-- <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script> -->


</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/postComment.js"></script>
<script src="<%=request.getContextPath()%>/static/js/post-detail.js"></script>
<%@ include file="../common/footer.jsp"%>