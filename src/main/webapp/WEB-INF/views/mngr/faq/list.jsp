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
		<h1>관리자 faq list 테스트</h1>
			<div>
				<table>
					<thead>
						<tr>
							<th>NO.</th>
							<th>제목</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ faqs }" var="faq">
							<tr>
								<td>${ faq.fid }</td>
								<td>
									${ faq.question }
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
			<div>
				<c:url var="faqCreatePage" value="/faq/create" ></c:url>
				<a href="${ faqCreatePage }">FAQ 작성</a>	
			</div>
			
			
			</div>
	</body>
</html>