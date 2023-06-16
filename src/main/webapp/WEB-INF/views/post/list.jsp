<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- 게시판 main(list) postpage -->
<div class="container">
	<div class="my-2 pt-3 text-center">
		<h1 class=“titleBolder”>게시판</h1>
	</div>

	<div class="border-0 bd-example m-0 border-0">
		<!-- 글쓰기 버튼 -->
		<div class="text-end">
			<c:url var="postCreate" value="/post/create" />
			<button onclick="location.href='${ postCreate }'"
				class="btn btn-classic" type="button">글쓰기</button>
		</div>

		<div class="row row-cols-1 row-cols-md-2 gd-4">
			<c:forEach items="${ posts }" var="postInfo">
				<c:url var="postDetailPage" value="/post/detail">
					<c:param name="pid" value="${ postInfo.pid }" />
				</c:url>
				<div class="col" onclick="location.href='${ postDetailPage }'">
					<div class="card my-2 p-3">
						<div class="card-body">
							<!-- 글 번호 -->
							<!-- <div>${ postInfo.pid }</div> -->
							<!-- 말머리랑 제목 -->
							<h5 class="card-title text-truncate">[ ${ postInfo.hrs_hd} ]
								${ postInfo.title }</h5>
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

		<form id='actionForm' action='/shape/post/list' method='get'>
			<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
			<input type='hidden' name='amount' value='${ paging.cri.amount }' />
		</form>
		<!-- 페이징 처리 -->

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
<script src="<%=request.getContextPath()%>/static/js/paging.js"></script>
<%@ include file="../common/footer.jsp"%>