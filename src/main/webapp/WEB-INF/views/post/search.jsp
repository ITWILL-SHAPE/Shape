<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>

<!-- 지현 게시판 main(list) page -->
<!-- 카드로 2개씩 -->
<div class="container">
	<header class="my-2 p-5 text-center">
		<h1>게시판</h1>
		<p>검색 결과</p>
		<!-- 검색 -->
		<!-- 글쓰기 버튼 -->
		<div class="my-2 row">
			<c:url var="postCreate" value="/post/create" />
			<button onclick="location.href='${ postCreate }'"
				class="btn btn-warning" type="button">글쓰기</button>
		</div>
	</header>

	<main class="my-2">
		<div class="card">
			<table class="card-body table table-hover">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ posts }" var="postInfo">
						<tr>
							<td>${ postInfo.pid }</td>
							<!-- secret 여부에 따라 제목이 달라짐 -->
							<c:if test="${postInfo != null}">
								<c:choose>
									<c:when test="${postInfo.hrs_hd == 1}">
										<td><c:url var="postDetailPage" value="/post/detail">
												<c:param name="pid" value="${ postInfo.pid }" />
											</c:url> <a href="${ postDetailPage }">[모임 후기] ${ postInfo.title }</a></td>
									</c:when>
									<c:otherwise>
										<td><c:url var="postDetailPage" value="/post/detail">
												<c:param name="pid" value="${ postInfo.pid }" />
											</c:url> <a href="${ postDetailPage }">[사담] ${ postInfo.title }</a></td>
									</c:otherwise>
								</c:choose>
							</c:if>
							<td>${ postInfo.author }</td>
							<td><fmt:formatDate value="${ postInfo.created_date }"
									pattern="yyyy-MM-dd" /></td>
							<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>