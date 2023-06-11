<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<!-- 반응형 웹 페이지 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- css -->
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
			crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<!-- <link rel="stylesheet" href="../static/css/common.css"/> -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape</title>
	</head>
	<body >
		<div class="container">
			<div class="my-2 p-5 text-center">
				<p>관리자 공지사항 list</p>
			</div>
		
		
			<main class="my-2">
				<div class="card">
					<table class="card-body table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>제목</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ notices }" var="notice">
								<tr>
									<c:choose>
										<c:when test="${ notice.fix == -1 }">
											<td>📢</td>
										</c:when>
										<c:otherwise>
											<td>${ notice.nid }</td>
										</c:otherwise>
									</c:choose>
									<td>
										<c:url var="noticeDetailMngrPage" value="/mngr/notice/detail">
											<c:param name="nid" value="${ notice.nid }"></c:param>
										</c:url>
										<a href="${ noticeDetailMngrPage }">${ notice.title }</a>
									</td>
									<td><fmt:formatDate value="${ notice.created_date }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="my-2 text-center">
					<c:url var="infoNoticeCreatePage" value="/mngr/notice/create" />
					<a class="btn btn-primary" href="${ infoNoticeCreatePage }">새 글 작성</a><!-- create 페이지 이동 -->
				</div>
			</main>
			
			<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script> <!-- 지우면 안됨 -->
			
		</div>
	</body>
</html>
