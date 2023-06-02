<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shape</title>
	</head>
	<body>
		<h1>FAQ detail</h1>
		
		<main>
			<form id="faqDetailForm">
				<div> <!-- 상세내용 div -->
					<div>
						<label for="fid">NO.</label>
						<input id="fid" vallue="${ faq.fid }" readonly />
					</div>
					<div>
						<label for="question">question</label> 
						<input type="text" id="question" value="${ faq.question }" readonly />
					</div>
					<div>
						<label for="answer">answer</label> 
						<textarea rows="20" cols="20" id="answer" readonly>${ faq.answer }</textarea>
					</div>
				</div>
			</form>

			<div>
				<!-- 수정 삭제 목록 div -->
				<div>
					<c:url var="faqListPage" value="/list"></c:url>
					<a href="${ faqListPage }">목록</a>
				</div>
	
				<div>
					<c:url var="faqModifyPage" value="/faq/modify">
						<c:param name="fid" value="${ faq.fid }"></c:param>
					</c:url>
					<a href="faqModifyPage">수정</a>
	
					<button id="btnFaqDelete">삭제</button>
				</div>
			</div>
	</main>
		
		<script src="../../static/js/infoFaq-detail.js"></script>
		
	</body>
</html>