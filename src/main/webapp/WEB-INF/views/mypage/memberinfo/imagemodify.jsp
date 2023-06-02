<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shape</title>
<style>
.center {
	margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
	text-align: center; /* 내부 텍스트를 가운데 정렬 */
}

.container {
	position: relative;
	padding-top: 200px; /* 헤더의 높이만큼 여백 추가 */
	padding-bottom: 200px; /* 푸터의 높이만큼 여백 추가 */
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
</style>
</head>
<body>
	<main>
		<c:forEach items="${myPageUserInfo}" var="info">
			<div class="profile-container">
				<div class="profile-image-container">
					<form action="/imagemodify" method="POST"
						enctype="multipart/form-data">
						<img src="data:image/jpeg;base64,${info.profile}"
							alt="Profile Image"> <input type="file" name="profile">
						<input type="file" name="profile">

						<div class="profile-overlay">
							<button type="submit" class="change-profile-btn">사진 변경</button>
					</form>
				</div>
			</div>
			</div>

			<div class="center">
				<table>
					<tbody>
						<tr>
							<th>이름</th>
							<td>${info.name}</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>${info.gender}</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>${info.id}</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>${info.birth}</td>
						</tr>
						<tr>
							<th>번호</th>
							<td>${info.number}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${info.email}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="center">
				<c:url var="myProfile" value="myprofile">
					<c:param name="id" value="${info.id}"></c:param>
				</c:url>
				<a class="btn btn-outline-primary form-control" href="${myProfile}">수정
					완료</a>
			</div>
		</c:forEach>
	</main>
</body>

</html>


<%@ include file="../../common/footer.jsp"%>

