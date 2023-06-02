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
		<title>Shape</title>
	</head>
	<body>
		<%@ include file="../../common/mngr_sidebar.jsp"%>
		<h1>관리자 faq list 테스트</h1>
			<div id="body">
				<table>
					<thead>
						<tr>
							<th>NO.</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ faqs }" var="faq">
								<td>${ faq.fid }</td>
								<td>
									${ faq.question }
								</td>
						</c:forEach>
					</tbody>
				</table>
			
			<div>
				<c:url var="faqCreatePage" value="/faq/create" ></c:url>
				<a href="${ faqCreatePage }">FAQ 작성</a>	
			</div>
			
			
			</div>
	</body>
</html>