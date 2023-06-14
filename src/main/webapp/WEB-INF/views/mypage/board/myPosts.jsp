<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 게시판 > 내가 작성한 댓글</title>
<script defer src="static/js/myPosts-delete.js"></script>
</head>
<body>
	<div class="my-2 pt-5" id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<!-- 메인 컨텐츠 시작 -->
	<main id="main_content">
		<table class="table">
			<thead>
				<tr>
					<th>
					<input type="checkbox"
					       id="all-checkbox"
						   name="all-checkbox" />
				    </th>
					<th>No</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ myposts }"
				           var="myposts"
				           varStatus="loop">
					<tr>
						<td>
						<input type="checkbox"
						       id="row-checkbox" />
						</td>
						<td>${ loop.index + 1 }</td>
						<td class="row-content">
							<a href="/shape/post/detail?pid=${ myposts.pid }">
								${ myposts.title }
							</a>
						</td>
						<td>
						<fmt:formatDate value="${ myposts.created_date }"
								        pattern="yyyy-MM-dd HH:mm" />
						</td>
						<td>
						<input type="hidden"
						       id="pid"
						       value="${ myposts.pid }" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="delete-button">댓글 삭제</button>
	</main>
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>