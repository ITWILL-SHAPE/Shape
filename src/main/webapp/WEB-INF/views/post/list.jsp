<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- 게시판 main(list) postpage -->
<div class="container">
	<div class="border bg-body rounded shadow-sm">

		<header class="my-2 pt-5 text-center">
			<h1>게시판</h1>
		</header>

		<div class="p-3 m-5 border-0 bd-example m-0 border-0">
			<!-- 글쓰기 버튼 -->
			<div class="d-grid my-2 col-5 mx-auto" style="height: 4rem;">
				<c:url var="postCreate" value="/post/create" />
				<button onclick="location.href='${ postCreate }'"
					class="btn btn-warning" type="button">글쓰기</button>
			</div>

			<div class="row row-cols-1 row-cols-md-2 gd-4 p-2">
				<c:forEach items="${ posts }" var="postInfo">
					<c:url var="postDetailPage" value="/post/detail">
						<c:param name="pid" value="${ postInfo.pid }" />
					</c:url>
					<div class="col" onclick="location.href='${ postDetailPage }'">
						<div class="card border-warning my-2 p-3">
							<div class="card-body">
								<!-- 글 번호 -->
								<!-- <div>${ postInfo.pid }</div> -->
								<!-- 말머리랑 제목 -->
								<h5 class="card-title text-truncate">[ ${ postInfo.hrs_hd}
									] ${ postInfo.title }</h5>
								<!-- 작성자 -->
								<p class="card-text">
									작성자: ${ postInfo.author }
									<!-- 작성 날짜 -->
									<br />작성일자:
									<fmt:formatDate value="${ postInfo.created_date }"
										pattern="yyyy-MM-dd" />
									<br />댓글 개수: ${ post.rcnt }
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
							class="page-link" href="${ paging.startPage -1 }" tabindex="-1">Previous</a></li>
						<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }"
							var="num">
							<li class="page-item ${ paging.cri.pageNum == num? "active":"" }"><a
								class="page-link" href="${ num }">${ num }</a></li>
						</c:forEach>
						<li class="page-item ${ paging.next? "":"disabled" }" ><a
							class="page-link" href="${ paging.endPage +1 }" tabindex="-1">Next</a></li>
					</ul>
				</nav>
			</div>

			<form id='actionForm' action='/shape/post/list' method='get'>
				<input type='hidden' name='pageNum' value='${ paging.cri.pageNum }' />
				<input type='hidden' name='amount' value='${ paging.cri.amount }' />
			</form>
			<!-- 페이징 처리 -->

			<!-- 검색 -->
			<c:url var="postSearch" value="/post/search"></c:url>
			<form action="${ postSearch }">
				<div class=" pt-4 m-auto row">
					<div class="col-sm-10">
						<input class="form-control border-warning" type="text"
							name="keyword" id="keyword" />
					</div>
					<div class="col-sm-2">
						<button type="submit" class="form-control btn btn-outline-warning">검색</button>
					</div>
				</div>
			</form>

		</div>

	</div>
</div>
</body>
<script src="<%=request.getContextPath()%>/static/js/paging.js"></script>
</html>
<%@ include file="../common/footer.jsp"%>