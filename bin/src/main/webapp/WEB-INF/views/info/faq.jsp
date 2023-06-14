<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
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
		<table>
			<thead>
				<tr>
					<th>no.</th>
					<th>질문</th>
					<th>답변</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach>
				</c:forEach>
			</tbody>
		
		</table>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>