
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 게시판 > 내가 작성한 댓글</title>
<script defer src="static/js/myComments-delete.js"></script>
<style>
#main_content {
	margin-left: 15rem;
	padding: 20px;
}
</style>
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<main id="main_content">
		<table class="table">
			<thead>
				<tr>
					<th>
					<input type="checkbox" 
					       id="all-checkbox"
						   name="all-checkbox">
					</th>
					<th>No</th>
					<th>내용</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ mycomments }"
				           var="mycomments"
				           varStatus="loop">
					<tr>
						<td>
						<input type="checkbox"
						           id="row-checkbox" />
						</td>
						<td>
						<input type="hidden"
						       id="pcid"
						       value="${ mycomments.pcid }" />
						</td>
						<td>${ loop.index + 1 }</td>
						<td class="row-content">${ mycomments.content }</td>
						<td>
						<fmt:formatDate value="${ mycomments.created_date }"
								        pattern="yyyy-MM-dd HH:mm" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="delete-button">댓글 삭제</button>
	</main>
	<footer>
		<%@ include file="../../common/footer.jsp"%>
	</footer>
</body>
</html>