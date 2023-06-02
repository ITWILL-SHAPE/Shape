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
			<form>
				<div> <!-- 상세내용 div -->
					<div>
						<label for="fid">NO.</label>
						<input id="fid" vallue="${ faq.fid }" readonly />
					</div>
					<div>
						<label for="question">question</label> 
						<input type="text" id="question" value="${ post.question }" readonly />
					</div>
					<div>
						<label for="answer">answer</label> 
						<textarea rows="20" cols="20" id="answer" readonly>${ post.answer }</textarea>
					</div>
				</div>
				<div> <!-- 수정 삭제 div -->
					
				</div>
			</form>
		</main>
	</body>
</html>