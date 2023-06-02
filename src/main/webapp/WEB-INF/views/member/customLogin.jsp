<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

	<body>
		<div id="body">
			<h1>Custom Login Page</h1>
			<h2>
				<c:if test="${ error != null }">
					<c:out value="${ error }"/>
				</c:if>
			</h2>
			<h2>
				<c:if test="${ logout != null }">
					<c:out value="${ logout }"/>
				</c:if>
			</h2>
			<%-- 
			<c:url var="login" value="/member/login"/>
			<form method="post" action="${ login }">
			 --%>
			<form method="post" action="/shape/login">
				<div>
					<input type="text" name="username"/>
				</div>
				<div>
					<input type="password" name="password"/>
				</div>
				<div>
					<input type="submit"/>	
				</div>
				<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			</form>
		</div>
	</body>

<%@ include file="../common/footer.jsp" %>