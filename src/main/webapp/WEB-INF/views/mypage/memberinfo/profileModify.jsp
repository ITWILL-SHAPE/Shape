<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../common/header.jsp"%>
<head>
<script defer src="static/js/userinfo-modify.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-2"></div>
		<div class="col-10">
			<div class="my-2 p-3 text-center">
				<h1 class="titleBolder" >나의 프로필 수정</h1>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<%@ include file="../sidebar.jsp"%>
		</div>

		<div class="container col-8 border bg-body rounded shadow-sm pt-4" id="main_content">


	<div class="center profile-info my-2 text-center">
		<form id="form_test" action="/shape/profileupload/${ id }" method="post"
				encType="multipart/form-data">


				<div class="profile-image-container">
					<c:if test="${ myPageUserInfo.file == null }">
						<img src="static/images/common/user.png" alt="Profile Image"
							class="profile-image">
					</c:if>
					<c:if test="${ myPageUserInfo.file != null }">
						<c:set value="data:image/png;base64, ${ myPageUserInfo.file }" var="url" />
						<img src="${ url }" alt="Profile Image"
							class="profile-image">
					</c:if>
					<div class="profile-overlay">
						<label for="profile-upload" class="change-profile-btn">사진변경</label>
						<input type="file" id="profile-upload" name="uploadFile" style="display: none;" />
					</div>
				</div>
     	</form>
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
				class="my-2 pt-3 d-grid gap-2 d-md-flex justify-content-md-center
                    w-75 m-auto pb-4">
				<!-- 취소 버튼 -->
				<a class="btn btn-primary btn-secondary" href="myprofile?id=${id}">취소</a>
				<!-- 수정완료 버튼 -->
				<a class="btn btn-primary btn-classic" id="btnUpdate">수정완료</a>

			</div>
		</div>
	</div>
	
	<script type="text/javascript">
    $(document).on('click', '#btnUpdate', function(e) {

        $("#form_test").submit();
    });
	</script>
</body>
<footer>
	<%@ include file="../../common/footer.jsp"%>
</footer>