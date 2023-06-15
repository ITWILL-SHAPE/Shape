<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/myComments-delete.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-2 my-5">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<!-- 메인 컨텐츠 시작 -->
		<div id="main_content" class="container col-10 ">
			<div>
				<h1 class="my-2 pt-5 text-center titleBolder">내가 작성한 댓글</h1>
			</div>
			<div class="my-2 pt-3 w-75 m-auto">
				<table class="table btn-list">
					<thead class="text-center">
						<tr>
							<th><input type="checkbox" id="all-checkbox"
								name="all-checkbox" /></th>
							<th>No</th>
							<th>내용</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ mycomments }" var="mycomments"
							varStatus="loop">
							<tr>
								<td class="text-center"><input type="checkbox"
									id="row-checkbox" /></td>
								<td class="text-center">${ loop.index + 1 }</td>
								<td class="row-content"><a
									href="/shape/post/detail?pid=${ mycomments.pid }"
									class="text-decoration-none text-dark"> ${ mycomments.content }
								</a></td>
								<td class="text-center"><fmt:formatDate
										value="${ mycomments.created_date }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<td><input type="hidden" id="pcid"
									value="${ mycomments.pcid }" /></td>
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