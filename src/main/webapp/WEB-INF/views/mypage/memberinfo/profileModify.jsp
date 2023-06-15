<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/userinfo-modify.js"></script>
<style>
.center {
	margin: 0 auto;
	text-align: center;
}

table {
	margin: 0 auto;
	text-align: left;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	border: none;
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
	padding: 0;
}

.profile-image {
	width: 300px;
	height: auto;
}

.profile-info {
	margin-bottom: 40px;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-2 my-5">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div class="container col-8" id="main_content">

			<div>
				<h1 class="my-2 pt-5 text-center titleBolder">나의 프로필</h1>
			</div>
			<div class="center profile-info my-2 text-center">

				<div class="profile-image-container">
					<img src="<c:url value='/static/images/common/user.png'/>"
						alt="Profile Image" class="profile-image" />
					<div class="profile-overlay">
						<label for="profile-upload" class="change-profile-btn">사진변경</label>
						<input type="file" id="profile-upload" style="display: none;" />
					</div>
				</div>
			</div>
			<div class=" my-2 pt-3 center profile-info">
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
			<div
				class="my-2 pt-3 d-grid gap-2 d-md-flex justify-content-md-end
                    w-75 m-auto">
				<!-- 수정완료 버튼 -->
				<a class="btn btn-primary btn-classic" href="myprofile?id=${id}">수정완료</a>

				<!-- 취소 버튼 -->
				<a class="btn btn-primary btn-secondary" href="myprofile?id=${id}">취소</a>


			</div>

		</div>
	</div>
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>