<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>

<!-- 지현 게시판 search page -->
<!-- 카드로 2개씩 -->
<div class="container">
	<header class="my-2 pt-3 text-center">
		<h1 class="titleBolder">게시판</h1>
	</header>


	<div>

		<!-- 글쓰기 버튼 -->
		<div class="text-end">
			<c:url var="postCreate" value="/post/create" />
			<button onclick="location.href='${ postCreate }'"
				class="btn btn-submit btn-classic" type="button">글쓰기</button>
		</div>

		<div class="row row-cols-1 row-cols-md-2 gd-4">
			<c:forEach items="${ posts }" var="postInfo">
				<c:url var="postDetailPage" value="/post/detail">
					<c:param name="pid" value="${ postInfo.pid }" />
				</c:url>
				<div class="col" onclick="location.href='${ postDetailPage }'">
					<div class="card my-2 p-3">
												<div class="card-body">
							<!-- 말머리랑 제목 -->
							<h5 class="card-title text-truncate">[ ${ postInfo.hrs_hd} ]
								${ postInfo.title }</h5>
							<div class="mt-2 grid d-grid d-md-flex">
								<div class="g-col-3">
									<!-- 프로필 사진 -->
									<div class="text-center"
										style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;">
										<c:if test="${ postInfo.profile == null }">
											<img class=""
												style="width: 100%; height: 100%; object-fit: cover;"
												src="<%=request.getContextPath()%>/static/images/common/user.png" />
										</c:if>
										<c:if test="${ postInfo.profile != null }">
											<c:set value="data:image/png;base64, ${ postInfo.file }"
													var="profile" />
											<img class="" src="${ profile }"
												style="width: 100%; height: 100%; object-fit: cover;"/>
										</c:if>
									</div>
								</div>
								<!-- 게시글 작성자 등 -->
								<div class="g-col ms-2">
									<!-- 글 번호 -->
									<!-- <div>${ postInfo.pid }</div> -->

									<!-- 작성자 -->
									<p class="card-text">
										작성자: ${ postInfo.author }
										<!-- 작성 날짜 -->
										<br />날짜:
										<fmt:formatDate value="${ postInfo.modified_date }"
											pattern="yyyy-MM-dd" />

										<br />댓글: ${ postInfo.rcnt }
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 페이징 처리 -->
		<div>
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item ${ paging.prev? "":"disabled" }"><a
						class="page-link" href="${ paging.startPage -1 }" tabindex="-1">&laquo;</a></li>
					<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }"
						var="num">
						<li class="page-item ${ paging.cri.pageNum == num? "active":"" }"><a
							class="page-link" href="${ num }">${ num }</a></li>
					</c:forEach>
					<li class="page-item ${ paging.next? "":"disabled" }" ><a
						class="page-link" href="${ paging.endPage +1 }" tabindex="-1">&raquo;</a></li>
				</ul>
			</nav>
		</div>

		<form id='actionForm' action='/shape/post/search' method='get'>
			<input type="hidden" name='keyword' value='${ paging.cri.keyword }' />
			<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
			<input type='hidden' name='amount' value='${ paging.cri.amount }' />
		</form>
		<!-- 페이징 처리 -->

		<!-- 검색 -->
		<!-- 검색 -->
		<div class="d-grid my-2 col-7 mx-auto m-5 text-center">
			<c:url var="postSearch" value="/post/search"></c:url>
			<form action="${ postSearch }">
				<div class="input-group col-sm-7 my-2">
					<input class="form-control" type="text" placeholder="검색어 입력"
						name="keyword" id="keyword" aria-label="Input group example"
						aria-describedby="basic-addon1" />
					<button type="submit" class="btn btn-classic">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
          							<path
								d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
        							</svg>
					</button>
				</div>
			</form>
		</div>
	</div>

</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/paging-search.js"></script>
</html>
<%@ include file="../common/footer.jsp"%>