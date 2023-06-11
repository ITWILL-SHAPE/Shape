<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<%@ include file="../../common/mngr_sidebar.jsp" %>
		<title>Shape</title>
	</head>
	<body>
		<div class="container">
			
			<div class="my-2 p-5 text-center">
				<p>관리자 FAQ list</p>
			</div>	
	
			<main class="my-2">
				<div class="card">
					<table class="card-body table table-hover">
						<thead>
							<tr>
								<th>No</th>
								<th>제목</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ faqs }" var="faq">
								<tr>
									<td>${ faq.fid }</td>
									<td>
										<c:url var="faqDetailPage" value="/mngr/faq/detail">
											<c:param name="fid" value="${ faq.fid }"></c:param>
										</c:url>
										<a href="${ faqDetailPage }">${ faq.question }</a>
									</td>
								</tr>	
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<div class="card-footer my-2 text-center">
					<c:url var="faqCreatePage" value="/mngr/faq/create" ></c:url>
					<a class="btn btn-primary"  href="${ faqCreatePage }">FAQ 작성</a>	
				</div>
			</main>
		</div>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
	</body>
</html>