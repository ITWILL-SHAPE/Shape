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
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/common.css"/>
		<!-- js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/static/js/mngr-sidebar.js"></script>
		<!-- icon -->
		<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/static/images/common/favicon.ico">
		<title>Shape - 관리자</title>
	</head>
	<body>
	<div class="d-flex">
		<%@ include file="../../common/mngr_sidebar.jsp"%>
		<div class="vh-100 vw-100 p-3">
			<div class="my-2 p-5 text-center">
				<h1 class="titleBolder">FAQ</h1>
				<p>관리자</p>
			</div>
				
				<div class="card">
					<form id="faqModifyForm">
						<div class="card-body" id="modifyForm">
							<div class="my-4">
								<label class="form-label" for="fid">NO.</label> <input
									class="form-control" id="fid" name="fid" value="${ faq.fid }" />
							</div>
							<div>
								<label class="form-label" for="question">question</label> <input
									class="form-control" id="question" name="question"
									value="${ faq.question }" />
							</div>
							<div>
								<label class="form-label" for="answer">answer</label>
								<textarea class="form-control" id="answer" name="answer">${ faq.answer }</textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="card-footer my-2 text-center"">
					<c:url var="faqListPage" value="/mngr/faq/list"></c:url>
					<a class="btn btn-primary" href="${ faqListPage }">목록</a>
					<button class="btn btn-primary" id="btnFaqUpdate">수정 확인</button>
				</div>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
				crossorigin="anonymous"></script>
			<script src="../../static/js/infoFaq-modify.js"></script>
		</div>
	</div>
</body>
</html>