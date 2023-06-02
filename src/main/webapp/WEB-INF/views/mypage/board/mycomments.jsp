<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 > 게시판 > 내가 작성한 댓글</title>
	</head>
	<body>
		<div id="sidebar">
			<%@ include file="../sidebar.jsp" %>
		</div>
		
		<main>
			<div>
				<table class="table">
					<tbody>
	                    <c:forEach items="${ mycomments }" var="mycomments">
	                        <tr>
	                            <td>${ mycomments.content }</td>
	                            <fmt:formatDate value="${ mycomments.createdTime }"
	                             pattern="yyyy-MM-dd HH:mm"/>
	                             </td> 
	                        </tr>
	                    </c:forEach>
	                </tbody>
				</table>
			</div>
		</main>
	</body>
</html>
<%@ include file="../../common/footer.jsp" %>
