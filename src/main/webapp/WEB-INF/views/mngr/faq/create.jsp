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
		<h1>FAQ 작성 화면</h1>
		
		<main>
			<div>
				<form method="post">
					<div>
						<div>
							<label for="question">question</label>
							<input type="text" id="question" name="question" required/>
						</div>
					</div>
					<div>
						<div>
							<label for="answer">answer</label> 
							<textarea rows="20" cols="20" id="answer" name="answer" required></textarea>
						</div>
					</div>
					<div>
						<input type="submit" value="작성 완료"/>
					</div>
					<div>
						<c:url var="faqListPage" value="/list"></c:url>
						<a href="${ faqListPage }">목록</a>
					</div>
			</form>
			</div>
		</main>
	</body>
</html>