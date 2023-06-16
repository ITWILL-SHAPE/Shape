<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<body>
	<!-- 제목 -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder" >나의 프로필</h1>
			</div>
		</div>
	</div>
	<!-- 사이드 바 , 내용 -->
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div id="main_content" class="container col-8 border bg-body rounded shadow-sm">
			
			<div class="center profile-info my-2 text-center">
				<img src="static/images/common/user.png" alt="Profile Image"
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
				<!--center
         <c:url var="mypageModifyPage" value="/imagemodify">
            <c:param name="id" value="${myPageUserInfo.id}"></c:param>
         </c:url>
           -->
				<a
					class="btn btn-outline-primary form-control text-right btn-classic"
					href="profilemodifypage?id=${ id }">수정</a>
			</div>
		</div>
	</div>
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>