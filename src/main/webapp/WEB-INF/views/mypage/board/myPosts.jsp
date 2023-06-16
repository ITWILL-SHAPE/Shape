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
		<div class="col-2 my-5">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<!-- 메인 컨텐츠 시작 -->
		<div id="main_content" class="container col-10 ">
			<div>
				<h1 class="my-2 pt-5 text-center titleBolder">내가 작성한 게시글</h1>
			</div>
			<div class="my-2 pt-5 w-75 m-auto">
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
					<button class="btn delete-button btn-secondary float-end">댓글
						삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>