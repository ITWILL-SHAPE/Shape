<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<body>
		<h1>FAQ 작성 화면</h1>
		
		<main class="my-2">
		<section class="card">
			<form method="post">
				<div class="card-body">
					<div class="my-4">
						<label class="form-label" for="question">question</label>
						<input class="form-control" type="text" id="question" name="question" required/>
					</div>
					<div>
						<label class="form-label" for="answer">answer</label> 
						<textarea class="form-control" rows="20" cols="20" id="answer" name="answer" required></textarea>
					</div>
					<div style="float: right">
						<input type="submit" value="작성 완료"/>
					</div>
					<div style="float: right">
						<c:url var="faqListPage" value="/mngr/faq/list"></c:url>
						<a href="${ faqListPage }">목록</a>
					</div>
				</div>
			</form>
		</section>
		</main>
	</body>
</html>