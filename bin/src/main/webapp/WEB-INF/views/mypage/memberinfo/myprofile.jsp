<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>


<!-- css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/static/css/style.css" />
</head>
<body>
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<main id="main_contnet">
		<div class="center">
			<img src="static/images/common/user.png"
				 alt="Profile Image"
				 class="profile-image">
		</div>
		<div class="center profile-info">
			<table>
				<tbody>
					<tr>
						<th>이름</th>
						<td>${myPageUserInfo.name}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${myPageUserInfo.gender}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${myPageUserInfo.id}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${myPageUserInfo.birth}</td>
					</tr>
					<tr>
						<th>번호</th>
						<td>${myPageUserInfo.phone}</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${myPageUserInfo.email}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="center change-profile-btn profile-info">
			<!--
         <c:url var="mypageModifyPage" value="/imagemodify">
            <c:param name="id" value="${myPageUserInfo.id}"></c:param>
         </c:url>
           -->
			<a class="btn btn-outline-primary form-control"
				href="profilemodifypage?id=${ id }">수정</a>
		</div>
	</main>
</body>
</html>
<%@ include file="../../common/footer.jsp"%>
