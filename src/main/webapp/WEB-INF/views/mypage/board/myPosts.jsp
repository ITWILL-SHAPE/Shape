<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 > 게시판 > 내가 작성한 댓글</title>
<style>
#main_content {
	margin-left: 15rem;
	padding: 20px;
}
</style>
</head>
<body>
      <div id="sidebar">
        <%@ include file="../sidebar.jsp" %>
      </div>
	<main>
		<div id="main_content">
			<table class="table">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ myposts }" var="myposts" varStatus="loop">
						<tr>
							<td>${ loop.index + 1 }</td>
							<td>${ myposts.title }</td>
							<td>
							<td><fmt:formatDate value="${ myposts.created_date }"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>
<%@ include file="../../common/footer.jsp" %>