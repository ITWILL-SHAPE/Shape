<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<style>
.center {
	margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
	text-align: center; /* 내부 텍스트를 가운데 정렬 */
}

table {
	margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
	text-align: left; /* 테이블 내부 텍스트를 왼쪽 정렬 */
	border-collapse: collapse; /* 테이블 셀 경계를 병합하여 선을 숨김 */
}

th, td {
	padding: 5px; /* 셀 내부 여백 설정 */
	border: none; /* 셀 경계 선을 없앰 */
}

.profile-container {
	position: relative;
}

.profile-image-container {
	position: relative;
	display: inline-block;
}

.profile-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0;
	transition: opacity 0.3s;
}

.profile-overlay:hover {
	opacity: 1;
}

.change-profile-btn {
	border: none;
	background-color: transparent;
	color: white;
	font-size: 16px;
	cursor: pointer;
	width: max-content;
	padding: 0; /* 옵션: 버튼 내부 여백을 없애기 위해 padding을 0으로 설정 */
}

.profile-image {
	width: 300px; /* 원하는 가로 크기로 설정 */
	height: auto; /* 세로 크기를 자동으로 조정하여 비율 유지 */
}

.profile-info {
	margin-bottom: 40px; /* 원하는 간격 크기를 설정 */
}
</style>
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
	<!-- 메인 컨텐츠 끝 -->
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>