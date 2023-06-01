<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
</head>
<body>
	<h1>테스트</h1>
	<div>
		<c:forEach items="${ faq }" var="faqs">
			${ faqs }
			<%-- <dl>
				<dt>${ faqs.question }</dt>
				<dd>${ faqs.answer }</dd>
			</dl> --%>
		</c:forEach>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>