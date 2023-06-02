<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../common/mngr_sidebar.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>faq 수정화면</h1>
		
		<main>
			<form id="faqModifyForm">
				<div id="modifyForm">
					<div>
						<label for="fid">NO.</label>
						<input id="fid" name="fid" value="${ faq.fid }"/>
					</div>
					<div>
						<label for="question">question</label>
						<input id="question" name="question" value="${ faq.question }" />
					</div>
					<div>
						<label for="answer">answer</label> 
						<textarea rows="20" cols="20" id="answer" name="answer">${ faq.answer }</textarea>
					</div>
				</div>
			</form>
			<div>
				<div>
					<c:url var="faqListPage" value="/list"></c:url>
					<a href="${ faqListPage }">목록</a>
				</div>
				<div>
					<button id="btnFaqUpdate">수정 확인</button>
				</div>
			</div>
		</main>
		
		<script src="../../static/js/infoFaq-modify.js"></script>
		
	</body>
</html>