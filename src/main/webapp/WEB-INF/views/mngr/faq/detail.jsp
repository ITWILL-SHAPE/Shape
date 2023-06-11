<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!-- 우수빈 faq detail 페이지 -->
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
		<div class="container">
		<div class="my-2 p-5 text-center">
			<p>관리자 FAQ 상세 화면</p>
		</div>
		
		<main class="my-2">
		<section class="card">
			<form id="faqDetailForm" >
				<div class="card-body"> <!-- 상세내용 div -->
					<div class="my-4">
						<label class="form-label" for="fid">NO.</label>
						<input class="form-control" id="fid" value="${ faq.fid }" readonly />
					</div>
					<div>
						<label class="form-label" for="question">question</label> 
						<input class="form-control" type="text" id="question" value="${ faq.question }" readonly />
					</div>
					<div>
						<label class="form-label" for="answer">answer</label> 
						<textarea class="form-control" id="answer" readonly>${ faq.answer }</textarea>
					</div>
				</div>
			</form>
		</section>	

			<div class="card-footer my-2 text-center"><!-- 수정 삭제 목록 div -->
				<c:url var="faqListPage" value="/mngr/faq/list"></c:url>
				<a class="btn btn-primary" href="${ faqListPage }">목록</a>
				<c:url var="faqModifyPage" value="../faq/modify">
					<c:param name="fid" value="${ faq.fid }"></c:param>
				</c:url>
				<a class="btn btn-primary" href="${ faqModifyPage }">수정</a>
				<button class="btn btn-primary" id="btnFaqDelete">삭제</button>
			</div>
	</main>
		
		
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
			crossorigin="anonymous"></script>
		<script src="../../static/js/infoFaq-detail.js"></script>
		</div>
	</body>
</html>