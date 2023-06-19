<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/myPosts-delete.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder">내가 작성한 게시글</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<!-- 메인 컨텐츠 시작 -->
		<div
			class="container myPage-container col-8 border bg-body rounded shadow-sm"
			id="main_content">
			<div class="my-2 pt-5">
				<table class="table table-hover">
					<colgroup>
						<col span="3">
						<!-- 첫 번째, 두 번째, 세 번째 열의 너비를 동일하게 지정 -->
						<col span="1" style="display: none;">
						<!-- 네 번째 열은 숨김 -->
					</colgroup>
					<thead class="text-center btn-classic">
						<tr>
							<th><input type="checkbox" id="all-checkbox"
								name="all-checkbox" /></th>
							<th>No</th>
							<th>제목</th>
							<th style="display: none;"></th>
							<!-- 네 번째 열은 숨김 -->
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ myposts }" var="myposts" varStatus="loop">
							<tr class="row-separator">
								<td class="text-center"><input type="checkbox"
									id="row-checkbox" /></td>
								<td class="text-center mainColor">${ loop.index + 1 }</td>
								<td class="row-content"><a
									href="/shape/post/detail?pid=${ myposts.pid }"
									class="text-decoration-none text-dark"> ${ myposts.title }</a></td>
								<td style="display: none;"><input type="hidden" id="pid"
									value="${ myposts.pid }" /></td>
								<td class="text-center"><fmt:formatDate
										value="${ myposts.created_date }" pattern="yyyy-MM-dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<!-- 페이징 시작 -->
					<ul class="pagination justify-content-center">
						<li class="page-item ${ pageMaker.prev? "":"disabled" }"><a
							class="page-link"
							href="/shape/myposts?id=${ id }&pageNum=${ pageMaker.startPage - 1 }"
							tabindex="-1">&laquo;</a></li>
						<c:forEach begin="${ pageMaker.startPage }"
							end="${ pageMaker.endPage }" var="num">
							<li class="page-item ${ pageMaker.cri.pageNum == num? "active":"" }">
								<a class="page-link"
								href="/shape/myposts?id=${ id }&pageNum=${ num }">${ num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${ pageMaker.next? "":"disabled" }" ><a
							class="page-link"
							href="/shape/myposts?id=${ id }&pageNum=${ pageMaker.endPage + 1 }"
							tabindex="-1">&raquo;</a></li>
					</ul>

					<!--
					<form id='actionForm' action='/shape/mycomments?id=${ id }' method='get'>
						<input type='hidden' name='pageNum'
							value='${ pageMaker.cri.pageNum }' /> 
					</form>
					  -->

					<!-- 페이징 끝 -->
					<button class="btn delete-button btn-secondary float-end">
						댓글
						<div class="mb-2 text-end">
							<button class="btn delete-button btn-secondary">댓글삭제</button>
						</div>
				</div>
			</div>

			<!-- 검색 -->
			<!--
			<div class="d-grid my-2 col-7 mx-auto m-5 text-center">
				<c:url var="postsSearch" value="/mypostssearch"></c:url>
				<form action="${postsSearch}" method="get">
					<input type="hidden" name="id" value="${ id }" />
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
			-->

<!--  검색 시작 -->
			<div class="d-grid my-2 col-7 mx-auto m-5 text-center">
				<c:url var="postsSearch" value="/mypostssearch">
					<c:param name="id" value="${id}" />
				</c:url>
				<form action="${postsSearch}" method="get">
					<input type="hidden" name="id" value="${id}" />
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
			<!-- 검색 끝 -->
		</div>
		<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>